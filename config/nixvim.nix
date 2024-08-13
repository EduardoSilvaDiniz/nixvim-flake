{
  programs.nixvim = {
    extraConfigLua = ''
      print("hello wolrd")
    '';
  };
}
