# profiles.nvim 
`profiles.nvim` allows you to setup a custom profile and load different plugins based on them. 

## LazyNvim Example 
```lua
return {
  {
    "github/copilot.nvim",
    lazy = false,
    enabled = function() 
      -- load github/copilot.nvim only when the personal profile is detected
      return require("profiles").is("personal")
    end
  }  
}
```

## Why?
In my company we're not allowed to use Github Copilot due to its behaviour (sends company code to an external server). At the same time I tried to split my neovim configuration
but it didn't last so long, so I ended up loading some plugins by checking the hostname (not the cleanest trick).

With `profiles.nvim` you can have a global `.nvim-profile.json` (or whatever you can customize the name and the path) 

```lua
require("profiles").setup({
  filename = ".nvim-profile.json",
  global_path = "~" -- by default it searches for $filename in the $HOME if it's not found in the `cwd`
})
``` 

It will try to load the given `profile_file` from the `cwd` and then if the file does not exists will try from the `global_path`. In this way you're able to set a profile for every project.

## Profiles File
The file is dead-simple:

```jsonc
// .nvim-profile.json
{
    "profile": "personal"
}
```

## Installation

```lua
-- lazy nvim
{
  "rawnly/profiles.nvim",
  lazy = false,
  priority = 1000, -- make sure to load before other plugins you want to manipulate

  -- atm this won't work :/ 
  -- looks like lazy.nvim checks `enabled` / `cond` before initializing the plugins
  opts = {
    filename = ".nvim-profile.json",
    global_path = "~"
  }
}
```
