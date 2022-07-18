local status_ok, leap_nvim = pcall(require, "leap")
if not status_ok then
  return
end

leap_nvim.set_default_keymaps()
