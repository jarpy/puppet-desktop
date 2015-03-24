task :default do
  system 'git submodule init'
  system 'git submodule update'
  system "sudo puppet apply --modulepath='./modules:./modules-github' --hiera_config=hiera/hiera.yaml manifests/desktop.pp"
end
