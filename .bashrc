# -polka-

run_scripts()
{
    for script in $1/*; do
        # skip non-executable snippets
        [ -x "$script" ] || continue

        #execute $script in the context of the current shell
        . $script
    done
}

load_bashrc()
{
    run_scripts "${HOME}/.bashrc.d"
}

load_bashrc
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
