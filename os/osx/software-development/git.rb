dep 'git.managed' do
  requires { on :osx, 'homebrew' }
  installs 'git'
end

dep 'git_configured', :git_username, :git_email do
  git_username.default('Stewart Henderson')
  git_email.default('henderson.geoffrey@gmail.com')

  def bashconfig
    '~/.gitconfig'
  end

  def up_to_date? dest
    source = '../../../configs/gitconfig.erb'
    if dest.p.exists?
      true
    else
      Babushka::Renderable.new(dest).from?(source) && Babushka::Renderable.new(dest).clean?
    end
  end

  met? {
    up_to_date?('~/.gitconfig')
  }
  meet {
    render_erb '../../../configs/gitconfig.erb', :to => bashconfig
  }

end