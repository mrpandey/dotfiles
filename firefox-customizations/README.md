To add/enable custom CSS:
1. Open about:config
2. Set toolkit.legacyUserProfileCustomizations.stylesheets to true
3. Copy the `chrome/` directory to root profile directory of Firefox, whose location can be found through about:profiles
4. Restart Firefox

To enable compact mode:
1. Open about:config
2. Set browser.uidensity to 1

To prevent closing window when closing last tab:
1. Open about:config
2. Set browser.tabs.closeWindowWithLastTab to false

To enable wayland, set the env var `MOZ_ENABLE_WAYLAND` to `1` in `.config/environment.d/envvars.conf` or `~/.profile` (depends on your setup).
