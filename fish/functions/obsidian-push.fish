function obsidian-push --description 'Commit and push Obsidian vault changes'
    git add .
    and git commit -m "notes: "(date +"%Y-%m-%d %H:%M")
    and git push
end
