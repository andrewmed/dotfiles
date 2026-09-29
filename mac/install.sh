set +e
set -x

brew tap mutagen-io/mutagen
brew tap umputun/apps

brew install agent-browser ansible cmake codex delve docker docker-buildx docker-compose duti fd fzf gh git-delta go gperf herdr jq lima nmap node ollama pandoc python@3.10 qpdf revmux ripgrep shellcheck tabiew tmux tree ttyd uv wget websocat wireguard-tools zoxide zsh-autosuggestions
brew install mutagen-io/mutagen/mutagen
brew install umputun/apps/ralphex umputun/apps/revdiff

brew install --cask umputun/apps/agterm android-platform-tools audacity brave-browser disk-inventory-x google-drive handy knockknock the-unarchiver utm vlc zed

#brew install microsoft-remote-desktop
#brew install visual-studio-code


set +x
set_default() {
    duti -s "${1:-"UNKNOWN_APP_ID"}" ".${2:-"UNKNOWN-EXT"}" all
    errcode=$?
    if [ $errcode -eq 0 ]; then echo "[OK ] Set defaul app for '${2}' to '${1}'";
    else echo "[ERR] Set default app for '${2}' to '${1}': Errocode = $errcode"; return $errcode;
    fi
}

VIDEO_APP=org.videolan.vlc
AUDIO_APP=org.videolan.vlc
CODE_APP=dev.zed.Zed

for ext in avi flv m2ts mkv mov mp4 mpeg mpg mts ogv ts vob webm wmv; do set_default "${VIDEO_APP}" "${ext}"; done

for ext in aac ac3 aif aiff alac amr ape au caf flac m3u m4a m4b mid midi mp3 oga ogg opus pls wav wma; do set_default "${AUDIO_APP}" "${ext}"; done

CODE_APP=dev.zed.Zed
for ext in asm awk c cc clj cljs conf cpp cs css csv cts cxx dart diff el erl ex exs fish fs fsx go gql graphql gradle groovy h hpp hxx ini ipynb java jl js json json5 jsonl jsx kt less log lua m m4 make md mdx mjs nim nix patch php plist proto ps1 py r rb rs rtf sass scala scss sh sql swift terraform tex tf tfvars ts tsx txt vala vb vue wasm xml yaml yml zig; do set_default "${CODE_APP}" "${ext}"; done
