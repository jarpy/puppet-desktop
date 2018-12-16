task :default do
  # Puppet is not really interested in running as anybody but root, so we
  # can't natively refer to our real, non-root username.
  #
  # To fix this, we'll define a facter fact for our username.
  ENV['FACTER_USER'] = ENV['USER']

  system "sudo -E puppet apply --modulepath='./modules:./modules-forge' --hiera_config=./hiera/hiera.yaml manifests/desktop.pp"
end
