dep 'seatbelt_directory' do
  def seatbelt_dir
    '~/.seatbelt'
  end

  met? {
    seatbelt_dir.p.exists?
  }
  meet {
    shell("mkdir -p #{seatbelt_dir}")
    # shell("sudo chmod -R `whoami` #{seatbelt_dir}")
  }
end

dep 'seatbelt_admium_profile' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/adium.sb'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/adium.sb.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/adium.sb.erb', :to => seatbelt
  }
end

dep 'seatbelt_admium_script' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/adium.sh'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/adium.sh.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/adium.sh.erb', :to => seatbelt
    shell("chmod +x #{seatbelt}")
  }
end

dep 'seatbelt_firefox_profile' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/firefox.sb'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/firefox.sb.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/firefox.sb.erb', :to => seatbelt
  }
end

dep 'seatbelt_firefox_script' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/firefox.sh'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/firefox.sh.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/firefox.sh.erb', :to => seatbelt
    shell("chmod +x #{seatbelt}")
  }
end

dep 'seatbelt_safari_profile' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/safari.sb'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/safari.sb.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/safari.sb.erb', :to => seatbelt
  }
end

dep 'seatbelt_safari_script' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/safari.sh'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/safari.sh.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/safari.sh.erb', :to => seatbelt
    shell("chmod +x #{seatbelt}")
  }
  end

dep 'seatbelt_bash_profile' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/bash.sb'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/bash.sb.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/bash.sb.erb', :to => seatbelt
  }
end

dep 'seatbelt_bash_script' do
  requires 'seatbelt_directory'

  def seatbelt
    '~/.seatbelt/bash.sh'
  end

  met? {
    Babushka::Renderable.new(seatbelt).from?('~/.babushka/deps/seatbelt-profiles/bash.sh.erb')
  }
  meet {
    render_erb '../../../profiles/os/osx/seatbelt-profiles/bash.sh.erb', :to => seatbelt
    shell("chmod +x #{seatbelt}")
  }
end

dep 'seatbelt-osx' do
  requires 'seatbelt_admium_profile',
           'seatbelt_admium_script',
           'seatbelt_firefox_profile',
           'seatbelt_firefox_script',
           'seatbelt_safari_profile',
           'seatbelt_safari_script',
           'seatbelt_bash_profile',
           'seatbelt_bash_script'
end