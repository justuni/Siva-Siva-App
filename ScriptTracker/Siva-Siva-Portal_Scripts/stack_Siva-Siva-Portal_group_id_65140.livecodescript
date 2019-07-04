Script "stack_Siva-Siva-Portal_group_id_65140"

/*
# Name: group "footerNavigation" of card "SivaSivaBrowser" of stack "Siva-Siva-Portal"
# ID: group id 65140 of card id 65147 of stack "Siva-Siva-Portal"
*/


global sConfigA

on mouseUp
   local tTarget, tShareControl, tControl, tBrowser
   local tCdHeight, tSharingHeight
   
   -- record the last URL they were on
   if not (the vis of widget "loader") then
      journal_AddEntry
   end if
   
   put the short name of the target into tTarget
   
   if tTarget is not "share" then
      send "terminateBrowser" to card "SivaSivaBrowser" of stack "Siva-Siva-Portal" in 100 milliseconds
   end if
   
   switch tTarget
      case "go-home-portal"
         portal_GoStack ("Siva-Siva-Portal")
         break
         
      Case "settings-gear"
         portal_GoStack "settings"
         break
         
         
      case "share"
         lock screen
         put sConfigA["shareControl"] into tShareControl
         
         if (exists(group "share-ui" of this card) ) then
            -- it has a preopencontrol which hides me
         else
            copy tShareControl to this card 
         end if
         
         put the long id of group "share-ui" of this card into tControl
         put the long id of widget "body" of this card into tBrowser
         put the height of this card into tCdHeight
         put the height of tControl into tSharingHeight
         set loc of tControl to\
               (the width of this card/2),tCdHeight- (tSharingHeight/2 )
         set the top of tBrowser to -(tSharingHeight/2)
         
         deleteMobileControl  "audioPlayer"
         show group "share-ui" with visual "dissolve" very fast
         unlock screen
         break
         
      case "add-favorites"
         portal_GoStack "Journal"
         break
   end switch
end mouseup
