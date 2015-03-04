if [[ -a $HOME/google-cloud-sdk/path.zsh.inc ]]
then
    # The next line updates PATH for the Google Cloud SDK.
    source $HOME/google-cloud-sdk/path.zsh.inc
    # The next line enables bash completion for gcloud.
    source $HOME/google-cloud-sdk/completion.zsh.inc
fi

# add pwd to work around issues with scoping & such
alias gaenose='PYTHONPATH=$PWD:$PYTHONPATH nosetests'

