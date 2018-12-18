class x11::packages {
  $packages = [
    # 'awesome',
    # 'awesome-extra',
    # 'pavucontrol',
    # 'gnome-terminal',
    'xfce4',
    'xfce4-terminal',
  ]
  package { $packages: }
}
