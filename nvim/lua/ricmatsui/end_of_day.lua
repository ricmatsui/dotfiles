-- Alert at end of day when working in the wiki. Polls wall time every minute
-- instead of one timer for the target time: libuv timers are monotonic and
-- don't advance while macOS sleeps, so a single long timer fires late.
local wiki = vim.fn.resolve(vim.fn.expand('~/synced/Wiki'))
local alert_hour, alert_min = 23, 50
local alert_time = string.format('%02d:%02d', alert_hour, alert_min)
local alert_win

-- Most recent alert time at or before now, as a timestamp. Stepping back by
-- day rather than 24 hours lets os.time normalize across DST changes.
local function latest_alert_at(now)
    local t = os.date('*t', now)
    t.hour, t.min, t.sec = alert_hour, alert_min, 0
    local at = os.time(t)
    if at > now then
        t.day = t.day - 1
        at = os.time(t)
    end
    return at
end

-- Alert times before startup count as handled, except tonight's, so starting
-- nvim during the day doesn't alert for last night
local started = os.time()
local last_alerted = latest_alert_at(started)
if os.date('%Y-%m-%d', last_alerted) == os.date('%Y-%m-%d', started) then
    last_alerted = nil
end

vim.api.nvim_set_hl(0, 'EndOfDay', { fg = '#f0f0e0', bg = '#2e7d32', bold = true, ctermfg = 255, ctermbg = 28 })

local function in_wiki()
    for _, path in ipairs({ vim.fn.getcwd(), vim.api.nvim_buf_get_name(0) }) do
        if path ~= '' and vim.startswith(vim.fn.resolve(path), wiki) then
            return true
        end
    end
    return false
end

local function alert()
    -- Still open from an earlier alert: focus it rather than stacking another
    if alert_win and vim.api.nvim_win_is_valid(alert_win) then
        vim.api.nvim_set_current_win(alert_win)
        return
    end
    local lines = {
        '',
        '        END OF DAY        ',
        '',
        '    press esc to dismiss    ',
        '',
    }
    local width = 28
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
    -- Nvim 0.12 floats can show a statusline, and airline fills it in
    vim.b[buf].airline_disable_statusline = 1
    alert_win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = #lines,
        row = math.floor((vim.o.lines - #lines) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = 'minimal',
        border = 'double',
        title = ' ' .. alert_time .. ' ',
        title_pos = 'center',
        zindex = 250,
    })
    vim.api.nvim_set_option_value('statusline', '', { scope = 'local', win = alert_win })
    vim.wo[alert_win].winhighlight = 'Normal:EndOfDay,FloatBorder:EndOfDay,FloatTitle:EndOfDay'
    vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', { buffer = buf, nowait = true })
end

local function tick()
    local now = os.time()
    local at = latest_alert_at(now)
    if last_alerted ~= at and in_wiki() then
        last_alerted = at
        alert()
    end
end

vim.uv.new_timer():start(0, 60 * 1000, vim.schedule_wrap(tick))
