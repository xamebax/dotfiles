[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Load .bashrc and other files...
for file in ~/.{bashrc,aliases,exports,bash_local}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file


eval "$(pyenv virtualenv-init -)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

###
# BASH COMPLETIONS
###

# kubernetes autocompletion
source <(/opt/homebrew/bin/kubectl completion bash)
source <(/opt/homebrew/bin/helm completion bash)

export BASH_COMPLETION_COMPAT_DIR="/opt/homebrew/etc/bash_completion.d"
. /opt/homebrew/opt/asdf/etc/bash_completion.d/asdf.bash
source <(/opt/homebrew/bin/kubectl completion bash)
source <(minikube completion bash)
# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.bash.inc" ]; then . "${HOME}/google-cloud-sdk/completion.bash.inc"; fi

if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

###
# PATH
###

export PATH=$PATH:/usr/local/go/bin:$GOBIN

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.bash.inc" ]; then . "${HOME}/google-cloud-sdk/path.bash.inc"; fi
export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="/opt/homebrew/sbin:$PATH"
export PATH=~/bin:$PATH
export PATH=~/.pyenv/bin:$PATH

#kubectx and kubens
export PATH=~/.kubectx:$PATH
export PATH=~/.npm-global/bin:$PATH

export PATH="${HOME}/Library/Python/3.10/bin:$PATH"
export PATH="${HOME}/.klipy/bin:$PATH"

export GOBIN=$HOME/go/bin
export GOPATH=$HOME/go

