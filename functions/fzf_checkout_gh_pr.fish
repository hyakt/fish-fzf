function fzf_checkout_gh_pr
    set -l pullreq (CLICOLOR_FORCE=1 GH_FORCE_TTY=100% gh pr list | tail -n+4 | fzf --ansi --bind "change:reload:CLICOLOR_FORCE=1 GH_FORCE_TTY=100% gh pr list -S {q} | tail -n+4 || true" --disabled --preview "CLICOLOR_FORCE=1 GH_FORCE_TTY=100% gh pr view {1} | bat --color=always --style=grid --file-name preview.md")

    if [ -n "$pullreq" ];
        gh pr checkout (echo $pullreq | awk '{ print $1 }')
    end
end
