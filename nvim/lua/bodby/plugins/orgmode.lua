require("orgmode").setup({
  org_agenda_files = "~/org/*",
  org_default_notes_file = "~/org/refile.org",
  org_archive_location = "~/org/archives/%s::",

  org_todo_keywords = {
    "TODO(t)", "STARTED(s)", "BLOCKED(b)", "IDEA(i)",
    "|",
    "DONE(d)", "CANCELLED(c)"
  },

  org_priority_highest = "A",
  org_priority_default = "B",
  org_priority_lowest = "C",

  mappings = { disable_all = false },

  org_todo_keyword_faces = {
    [ "TODO" ] = ":slant italic",
    [ "STARTED" ] = ":slant italic",
    [ "BLOCKED" ] = ":slant italic",
    [ "IDEA" ] = ":slant italic",
    [ "DONE" ] = ":slant italic",
    [ "CANCELLED" ] = ":slant italic"
  },

  ui = { folds = { colored = false } },

  win_split_mode = "horizontal",
  win_border = "single",

  org_startup_folded = "inherit",

  org_hide_leading_stars = false,
  org_hide_emphasis_markers = true,
  org_startup_indented = false,
  org_adapt_indentation = true,
  org_ellipsis = " ... ",

  org_edit_src_content_indentation = 1,

  org_log_done = "time",
  org_log_repeat = "time",

  org_src_window_setup = "top 16new",
  org_edit_src_content_indentation = 0,

  calendar_week_start_day = 0,

  org_deadline_warning_days = 10,
  org_agenda_span = "month",
  org_agenda_start_on_weekday = 0,

  -- org_capture_templates = {}

  org_agenda_skip_scheduled_if_done = false,
  org_agenda_skip_deadline_if_done = false,
})
