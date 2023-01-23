{
    ".editorconfig".source = ./cfg/.editorconfig;
    ".config/alacritty/alacritty.yml".source = ./cfg/alacritty/alacritty.yml;
    ".config/nvim" = {
        source = ./cfg/nvim;
        recursive = true;
    };
    ".tmux.conf.local" = {
        source = ./cfg/tmux/tmux.conf.local;
    };
}
