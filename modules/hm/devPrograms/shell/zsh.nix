{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.roverp.shell.zsh;
in {
  options = {
    roverp.shell.zsh = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable zsh module";
      };

      purePrompt.enable = lib.mkOption {
        type = lib.types.bool;
        default = cfg.enable && !config.roverp.shell.ohMyPosh.enable;
        description = "Enable pure prompt for zsh";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";

      enableCompletion = false;
      autosuggestion.enable = false;
      syntaxHighlighting.enable = false;

      history = {
        size = 1000000;
        save = 1000000;
        path = "${config.xdg.cacheHome}/zsh/history";

        extended = true;
        share = true;
        ignoreDups = true;
        ignoreSpace = true;
        expireDuplicatesFirst = true;
      };

      plugins = with pkgs; [
        {
          name = zsh-syntax-highlighting.pname;
          src = zsh-syntax-highlighting.src;
        }

        (lib.mkIf cfg.purePrompt.enable {
          name = pure-prompt.pname;
          src = pure-prompt.src;
          file = "pure.zsh";
        })
      ];

      initContent = let
        purePromptConfig = ''
          autoload -U promptinit; promptinit
          prompt pure

          prompt_newline='%666v'
          PROMPT=" $PROMPT"
        '';

        zshConfigAfterPlugins = lib.mkOrder 600 ''
          ${purePromptConfig}
        '';
        zshConfig = lib.mkOrder 1000 (builtins.readFile ./../../../../Configs/.config/zsh/.zshrc);
      in
        lib.mkMerge [zshConfigAfterPlugins zshConfig];
    };

    home.file = {
      ".zshenv".source = ./../../../../Configs/.zshenv;
    };
  };
}
