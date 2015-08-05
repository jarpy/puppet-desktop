class x11::packages {
  $packages = [
    'alsamixergui',
    'awesome',
    'awesome-extra',
    'dconf-editor',
    'gconf-editor',
    'gnome-control-center',
    'gnome-devel',
    'gnome-session-fallback',
    'gpointing-device-settings',
    'klipper',
    'pavucontrol',
    'xfce4-settings',
    'xfce4-terminal',
    'xscreensaver',
    'xscreensaver-gl',
    'xscreensaver-gl-extra',
  ]
  package { $packages: }
}
