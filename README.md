# class-manager
Class Manager for schools using Blackboard. Blackboard is a maze of buttons and slow on slow networks. This helps you get where you need to go faster.

## Setup
**1.**** Download `Class Manager.bat` and `Class Manager on top.exe` and put them in the same folder.
   Note: If you have AutoHotKeys installed on your PC, you can use `Class Manager on top.ahk`, the open source version. If you dont care about the manager file being on top, you can just download niether.
**2.** Create a folder named `Classes` in the same directory.
**3.** Download the template class file and put it in the `Classes` folder.
**4.** Edit the class file by right clicking and selecting `Edit`.

#### Class File setup
**1.** the class file will look like this:
```set cname=full name for course
set cnum=Short name for course
set pname=Teacher's name
set pmail=Teacher's eamil
set announcements=URL for announcements page
set assignmentss=Course content beginning
set assignmentse=Course content end
set weekstartminusone=number
set grades=Gades URL
```
   -Save it in the classes folder with a unique name.
**2.** Fill in the fields thats are fairly self explanitory.
   - For annoucements, go to the announcements page of your course and copy that URL
   - Do the same for grades
**3.** For the course content variables and the number you'll have to do the following:
   - Go to your course on Blackboard and select `Course Content` and choose `Week One`.
   - On this page you should see `Assignments` and `Readings`.
   - In a new tab Open `Week 2` in the same way you opened week One.
   - Compare the two URLs. You should see somewhere in the url the number goes up by one. For example:
     `https://learn.liberty.edu/webapps/blackboard/content/listContent.jsp?course_id=_606565_1&content_id=_39453131_1`
     `https://learn.liberty.edu/webapps/blackboard/content/listContent.jsp?course_id=_606565_1&content_id=_39453132_1`
   - You can see that near the end `31` became `32` (note that it should always be a double-digit number. i.e., `1` did not become `2`)
   - Take the part of the URL from Before the number that changed (in this example: `https://learn.liberty.edu/webapps/blackboard/content/listContent.jsp?course_id=_606565_1&content_id=_394531`) and set that to `asignmentss` where it says "Course content beginning".
   - Take the part of the URL after the number and set that as `assignmentse` where it says "Course content end". In this example: `_1`.
   - Take the number for week one and subtract one number for it (in this example `30`) and set that to `weekstartminusone`.
**4.** Replace all `&` symbols with `^^^&`. to do this:
   - Press CTRL+H on your keyboard.
   - Replace any `&` symbols with `^^^&`. This is **very important** and must be done **after all the URLS are put in!**
**5.** You're done!
   - Save the class file
   - Copy and paste your file to make more classes (right click and `edit` new ones).
**6.** For each class you should test the weekly course content section. Choose week four. If it opens to week three, up the `weekstartminuesone` variable by one. Do the opposite if it opens to week five.

Sorry its a bit janky and hard to do, but it makes each course a lot easier to manage. I hope to impliment a system to automate all of this later on.

## Future Plans:

1. Automatic week calculator (so you dont have to choose the week).
2. Easier Config setup (could use help on that one everyone :)
