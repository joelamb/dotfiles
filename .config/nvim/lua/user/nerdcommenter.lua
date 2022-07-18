local status_ok, nerdcommenter = pcall(require, "nerdcommenter")
if not status_ok then
  return
end

nerdcommenter.setup {}
