# Bira for Bash Theme - A colorful prompt theme inspired by ZSH Bira theme
# Color definitions for terminal formatting

# Basic colors
normal="\[\033[0m\]"
bold_blue="\[\033[1;34m\]"
bold_green="\[\033[1;32m\]"
bold_red="\[\033[1;31m\]"
bold_white="\[\033[1;37m\]"
bold_yellow="\[\033[1;33m\]"
yellow="\[\033[0;33m\]"
cyan="\[\033[0;36m\]"
bold_cyan="\[\033[1;36m\]"
green="\[\033[0;32m\]"
red="\[\033[0;31m\]"
white="\[\033[0;37m\]"
reset_color="\[\033[0m\]"
bold="\[\e[1m\]"

# Function to safely append commands to PROMPT_COMMAND
# Avoids overwriting existing PROMPT_COMMAND content
safe_append_prompt_command() {
  local new_command="$1"
  if [[ -z "$PROMPT_COMMAND" ]]; then
    PROMPT_COMMAND="$new_command"
  else
    PROMPT_COMMAND="$PROMPT_COMMAND; $new_command"
  fi
}

# Theme prompt styling configurations
# SCM (Source Control Management) git branch display
SCM_THEME_PROMPT_PREFIX=" ${yellow}‹"
SCM_THEME_PROMPT_SUFFIX="›${reset_color}"

# Virtual environment display (virtualenv/conda)
VIRTUALENV_THEME_PROMPT_PREFIX=" ${cyan}‹"
VIRTUALENV_THEME_PROMPT_SUFFIX="›${reset_color}"
CONDAENV_THEME_PROMPT_PREFIX=" ${cyan}‹"
CONDAENV_THEME_PROMPT_SUFFIX="›${reset_color}"

# Display conda environment name in prompt if active
condaenv_prompt() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo "${CONDAENV_THEME_PROMPT_PREFIX}${CONDA_DEFAULT_ENV}${CONDAENV_THEME_PROMPT_SUFFIX}"
  fi
}

# Display git branch information in prompt if in a git repository
scm_prompt_info() {
  local branch
  if branch=$(git symbolic-ref --short HEAD 2>/dev/null); then
    echo "${SCM_THEME_PROMPT_PREFIX}${branch}${SCM_THEME_PROMPT_SUFFIX}"
  fi
}

# Set user@hostname color based on user privileges
# Red for root user, green for regular users
if [[ ${UID} -eq 0 ]]; then
  user_host="${bold_red}\u@\h${normal}${reset_color}"
else
  user_host="${bold_green}\u@\h${normal}${reset_color}"
fi

# Main function to build and set the PS1 prompt
# Creates a two-line prompt with user@host, current directory, virtual env, and git info
prompt_command() {
  local current_dir=" ${bold_blue}\w${normal}${reset_color}"
  local virtualenv_prompt
  virtualenv_prompt="${virtualenv_prompt:-$(condaenv_prompt)}"
  local scm_prompt
  scm_prompt="$(scm_prompt_info)"
  PS1="╭─${user_host}${current_dir}${virtualenv_prompt}${scm_prompt}\n╰─${bold}\\$ ${normal}"
}

# Initialize the prompt by adding our function to PROMPT_COMMAND
safe_append_prompt_command prompt_command
