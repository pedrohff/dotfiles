return {
     {
         "catppuccin/nvim", 
         name = "catppuccin", 
         priority = 1000 , 
         opts = {
             colorscheme = "catppuccin-mocha"
         },
         config = function()
             require("catppuccin").setup({
                 flavour="mocha",
                 term_colors = true,
                 background={
                     dark = "mocha",
                 },
             })
         end,
     }
}
