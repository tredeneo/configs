{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      # Replace the "❯" symbol in the prompt with "➜"
      add_newline = false;
      format = " 
        \r[┌──](red)[$username$shell$time$git_branch$git_status$cmd_duration](red)
        \r[├─](bold red)[$directory](red)
        \r[└](bold red)[\\$](bold yellow)";

      memory_usage = {

        disabled = false;
        threshold = 0;
      };

      cmd_duration = {

        min_time = 500;
        show_milliseconds = true;
      };

      username = {

        show_always = true;
        # format = "[$user]($style)[ in ](underline red)"
      };


      time = {

        disabled = false;
        time_format = "%H:%M";
      };

      directory = {

        style = "bold yellow";
        truncation_length = 1;
        fish_style_pwd_dir_length = 5;
      };

      shell = {

        disabled = false;
        # format = "[$indicator]($style) ";
        style = "bold yellow";
      };
    };
  };
}
