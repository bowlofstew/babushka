# Babushka

Installation in depth: https://babushka.me/installing

Installation, condensed form:

  * Debian, apt-get install -y curl && sh -c "`curl https://babushka.me/up`"
            on older Ubuntu hosts, you will most likely have to use wget, 
            sh -c "`wget -O - babushka.me/up`"

  * OSX/BSD, sh -c "`curl https://babushka.me/up`"

    * Prerequisite: homebrew: ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

  * Arch, pacman -S curl && sh -c "`curl https://babushka.me/up`"

  * After installation
  
    ```
    git clone git@github.com:bowlofstew/babushka.git ~/.babushka/deps
    ```

# User profiles

  * Create a user profile under the users directory that has the package set.

  * Commit your profile

  * Execute babushka meet {profile_name}.  An example is `babushka meet shenderson-work-osx`