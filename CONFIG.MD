# Last update : 04.11 at 09:45 by dotCore    
  
## How to use these files ?  

# For challenges
1) Go in lua/battlepass/challenges/ 
2) Drop these files in the folder
3) Edit them to fit your needs and save
4) Go in lua/battlepass/configuration/config.lua 
5) Then, search for Battle pass Challenges configuration
6) Add the new challenges there with their tiers
  
# For rewards
1) Go in lua/battlepass/rewards/
2) Drop these files in the folder
3) Go in lua/battlepass/configuration/config.lua 
4) Add new tier's rewards by following these templates :
- :Free({ Type = "ps2_items", Reward = "ps2_item_name", Name = "Printed name", Description = "Custom description", Display = "Model path", Color = XeninUI.Theme.Green })
- :Free({ Type = "ps2_random", Reward = "optional", Name = "optional", Description = "optional", Color = XeninUI.Theme.Green })
- :Free({ Type = "sh_ps", Reward = 1000, Color = XeninUI.Theme.Green })
- :Free({ Type = "sh_ps_prem", Reward = 25, Color = XeninUI.Theme.Green })
- :Free({ Type = "sh_ps_items", Reward = "item_classname", Name = "Printed name", Description = "Custom description", Display = "Model path", Color = XeninUI.Theme.Green })
- :Free({ Type = "concommand", Reward = "ulx adduser sid vip, Color = XeninUI.Theme.Green })

  
#### Made by dotCore  
#### Thanks for using this !  