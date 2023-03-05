local ScriptCategoryContext = {}

getgenv().GlobalSettings = {} 

getgenv().GetScriptContext = function()
    -- Get the script that GetScriptContext was called in
    local Script = getfenv(2).script 
    return ScriptCategoryContext[Script] and ScriptCategoryContext[Script] or {}
end 

getgenv().SetScriptContext = function(Category)
    -- Get the script that SetScriptContext was called in
    local Script = getfenv(2).script 
    ScriptCategoryContext[Script] = Category
end 

getgenv().CreateCategory = function(CategoryName)
    if not CategoryName then 
        return false, "Could not create category, as a non-valid category name was passed"
    end 

    getgenv().GlobalSettings[CategoryName] = {}
end 

getgenv().GetCategory = function(Category)
   local IsCategory = getgenv().GlobalSettings[Category]

   if not IsCategory then 
       return getgenv().CreateCategory(Category)
   end 

   return IsCategory
end 

getgenv().CreateGlobalSetting = function(CategoryName, SettingName, SettingValue)
   if not getgenv().GlobalSettings[CategoryName] then 
       local Category, Error = getgenv().CreateCategory(CategoryName)

       if not Category then 
          return false, Error
       end 

   end 

   getgenv().GlobalSettings[CategoryName][SettingName] = SettingValue
end

getgenv().GetGlobalSetting = function(Category, SettingName)
   local IsCategory = getgenv().GlobalSettings[Category]

   if not IsCategory then 
       return false, "Category could not be found"
   end 

   local IsSetting = IsCategory[SettingName]

   if not IsSetting then 
       return false, "Setting could not be found"
   end 

   return IsSetting
end 

getgenv().SetGlobalSetting = function(...)
  -- Global setting will be overwritten when creating a setting with the same name
   getgenv().CreateGlobalSetting(...)
end 
