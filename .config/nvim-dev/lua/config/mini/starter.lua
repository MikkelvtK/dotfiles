local M = {}

local function header()
  return [[
	888b    888 888     888 8888888 888b     d888
	8888b   888 888     888   888   8888b   d8888
	88888b  888 888     888   888   88888b.d88888
	888Y88b 888 Y88b   d88P   888   888Y88888P888
	888 Y88b888  Y88b d88P    888   888 Y888P 888
	888  Y88888   Y88o88P     888   888  Y8P  888
	888   Y8888    Y888P      888   888   "   888
	888    Y888     Y8P     8888888 888       888
	]]
end

function M.setup()
  local ok_sessions, sessions = pcall(require, "mini.sessions")
  if not ok_sessions then
    return
  end

  sessions.setup({})

  local ok_starter, starter = pcall(require, "mini.starter")
  if not ok_starter then
    return
  end

  local opts = {
    evaluate_single = true,
    header = header,
    items = {
      starter.sections.builtin_actions(),
      starter.sections.recent_files(10, false),
      starter.sections.recent_files(10, true),
      starter.sections.sessions(5, true),
    },
    content_hooks = {
      starter.gen_hook.adding_bullet(),
      starter.gen_hook.indexing("all", { "Builtin actions" }),
      starter.gen_hook.padding(5, 2),
    },
  }

  starter.setup(opts)
end

return M
