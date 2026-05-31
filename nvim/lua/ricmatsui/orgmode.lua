require('orgmode').setup({
    org_agenda_files = {'./TODO.org'},
    org_default_notes_file = './TODO.org',
    org_todo_keywords = {'TODO(t)', 'IN_PROGRESS(p)', '|', 'DONE(d)'},
    org_indent_mode = 'noindent',
    org_log_done = 'false',
})
