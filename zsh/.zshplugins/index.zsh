zsh-install-plugin() {
	local BASE_DIR=~/.zshplugins
	[ "$#" -lt 2 ] && {
		echo "Illegal number of parameters"
		return
	}
	local START_DIR=$(pwd)

	if [ "$#" -eq 3 ]; then
		local FILENAME=$3
	else
		local FILENAME="$2.plugin.zsh"
	fi

	if [ "$1" = '-omz' ]; then
		local OMZ_DIR="$BASE_DIR/ohmyzsh"
		if [ -d "$OMZ_DIR" ]; then
			cd $OMZ_DIR
			git fetch
		else
			git clone --depth 1 --no-checkout 'https://github.com/ohmyzsh/ohmyzsh.git'
			cd $OMZ_DIR
		fi
		git sparse-checkout add "plugins/$2"
		git checkout
		local PLUGIN_PATH="$OMZ_DIR/plugins/$2"
	else
		local PLUGIN_PATH="$BASE_DIR/$2"
		git clone "https://github.com/$1/$2.git" $PLUGIN_PATH
	fi
	source "$PLUGIN_PATH/$FILENAME" && echo "source $PLUGIN_PATH/$FILENAME" >>"$BASE_DIR/index.zsh"
	cd $START_DIR
}

zsh-update-plugins() {
	local BASE_DIR=~/.zshplugins
	local CURRENT_DIR=$(pwd)
	for PLUGIN_DIR in "$BASE_DIR"/*; do
		if [ -d "$PLUGIN_DIR" ] && [ -d "$PLUGIN_DIR/.git" ]; then
			echo "Updating $(basename $PLUGIN_DIR)..."
			cd "$PLUGIN_DIR" || continue
			git pull
		fi
	done
	cd $CURRENT_DIR
}

#plugins
source ~/.zshplugins/zsh-z/zsh-z.plugin.zsh
