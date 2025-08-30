{ pkgs, lib, ... }: {
    
vim = { 
    theme = {
        enable = true;
        name = "nord";
        #style = "moon";
        transparent = true;
    };
    statusline.lualine.enable = true;
    telescope = {
        enable = true;
        mappings.findFiles = "<leader>pf";
    };
    autocomplete.nvim-cmp.enable = true;

    
    lsp = {
        enable = true;
        inlayHints.enable = true;
        formatOnSave = true;
        #lightbulb.enable = true;
        mappings = {
            codeAction = "<leader>ca";
            goToDefinition = "<leader>gd";
            hover = "K";
            #format = "<leader>gf";
        };
    };

    languages = {
        enableTreesitter = true;

        nix.enable = true;
    };
    options = {
        relativenumber = true;
        shiftwidth = 4;
        tabstop = 4;
        softtabstop = 4;
        expandtab = true;
    };
    extraLuaFiles = [
        (builtins.path {
        path = ./init.lua;
        name = "keymaps";
        })            
    ];

    visuals = {
        nvim-cursorline.enable = true;
        nvim-cursorline.setupOpts.cursorword.enable = true;
    };

}; }
