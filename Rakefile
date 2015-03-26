task :default do
  ENV['FACTER_homedir'] = ENV['HOME']
  system 'git submodule init'
  system 'git submodule update'
  system "sudo -E puppet apply --modulepath='./modules:./modules-github' --hiera_config=hiera/hiera.yaml manifests/desktop.pp"
end
