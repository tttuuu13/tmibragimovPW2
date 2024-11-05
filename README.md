**Q**: What issues prevent us from using storyboards in real projects?  
**A**: Storyboards are basically just an XML files, wich are not really easy to read and understand, for this reason resolving merge conflicts becomes almost impossible.  

**Q**: What does the code on lines 25 and 29 do?  
**A**: On line 25 we set `translatesAutoresizingMaskIntoConstraints` property of view to `false` to disable auto generation of constraints so we can add them by ourselves without any conflicts. On line 29 we're adding title label on our view as a subview.  

**Q**: What is a safe area layout guide?  
**A**: `safeAreaLayoutGuide` is a layout guide that respresents the area within view that is not obstructed by any of system elements.  

