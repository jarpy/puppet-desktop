class x11::packages {
  $packages = [
    'awesome',
    'awesome-extra',
    'glipper',
    'pavucontrol',
    'xfce4',
    # 'xfce4-settings',
    'xfce4-terminal',
  ]
  package { $packages: }
}
