{ ... }:
{
  programs.kitty = {
    enable = true;
    #font = {
    #  size = 20;
    #  name = "noto";
    #};
    #    theme = "Dark One Nuanced";
    settings = {
      cursor = "#ff0000";
      #:cursor como linha
      cursor_shape = "beam";
      #:iniciar com o fish shell
      shell = "fish";
      #:grossura do cursor
      cursor_beam_thinckness = 2;
      #:velocidade da piscada do cursor
      cursor_blink_interval = "0.3";
      sync_to_monitor = "yes";
      enable_audio_bell = "no";
      #esconder o mouse;
      mouse_hide_wait = "7.0";
      url_style = "
        double ";
      copy_on_select = "
        yes ";

      #:layouts habilitados
      enabled_layouts = "Splits, Stack";
      #:localização das abas
      tab_bar_edge = "top";
      #:estilo da aba
      tab_bar_style = "fade";
      tab_fade = "1 1 1 1";
      editor = "nvim";

    };
    keybindings = {
      "ctrl+F5" = " launch --location = hsplit ";
      "
      ctrl + F6" = "launch --location=vsplit";
      "ctrl+F7" = "layout_action rotate";

      "shift+up" = "move_window up";
      "shift+left" = " move_window left";
      "shift+right" = " move_window right";
      "shift+down" = "move_window down";

      "ctrl+left " = "neighboring_window left";
      "ctrl+right" = " neighboring_window right";
      "ctrl+up" = "neighboring_window up";
      "ctrl+down" = " neighboring_window down";

      "ctrl+shift+k" = " scroll_line_up";
      "ctrl+shift+j" = " scroll_line_down   ";

      "ctrl+tab " = "next_tab";
      "ctrl+shift+tab" = " previous_tab";
    };
  };
}



