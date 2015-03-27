task :default do
  # Puppet is not really interested in running as anybody but root, so we
  # can't natively refer to our username or home directory.
  # To fix this, we'll define some facter facts that clone existing environment
  # variables.
  ENV['FACTER_USER'] = ENV['USER']
  ENV['FACTER_HOME'] = ENV['HOME']

  system 'git submodule init'
  system 'git submodule update'
  system "sudo -E puppet apply --modulepath='./modules:./modules-github' --hiera_config=hiera/hiera.yaml manifests/desktop.pp"
end
