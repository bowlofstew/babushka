dep 'GPG.installer' do
  met? {
    '/Applications/GPG Keychain.app'.p.exists?
  }
  source 'https://releases.gpgtools.org/GPG_Suite-2015.09.dmg'
end

dep 'gpg_directory' do
  def gnu_directory
    '~/.gnupg/'
  end
  met? {
    gnu_directory.p.exists?
  }
  meet {
    shell("mkdir -p #{gnu_directory}")
    shell("sudo chmod -R `whoami` #{gnu_directory}")
  }
end

dep 'gpg_configuration' do
  requires 'GPG.installer',
           'gpg_directory'
  def config_file
    '~/.gnupg/gpg.conf'
  end

  met? {
    Babushka::Renderable.new(config_file).from?('~/.babushka/deps/configs/gpg.conf.erb')
  }
  meet {
    render_erb '../../../configs/gpg.conf.erb', :to => config_file
  }
end

dep 'install_keyservers_ca_certificate' do
  met? {
      '/etc/sks-keyservers.netCA.pem'.p.exists?
  }
  meet {
    shell('curl -O https://sks-keyservers.net/sks-keyservers.netCA.pem && sudo mv sks-keyservers.netCA.pem /etc')
  }
end

dep 'gpg-osx' do
  requires 'GPG.installer',
           'gpg_directory',
           'install_keyservers_ca_certificate'
           # 'gpg_configuration'
end