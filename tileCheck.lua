
module(..., package.seeall)

local walkable = {0}

function isWalkable(NUM)
  local var = false
  for i=1,#walkable do
      if NUM == walkable[i] then
          var = true
      end
      
  end
  
  return var
end


