task :default do
  system "sudo puppet apply --modulepath='./modules:./modules-github' --hiera_config=hiera/hiera.yaml manifests/desktop.pp"
end
