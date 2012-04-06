My Global Rakes
===
Description
---
I'm created some rakes to organize my stuff, maybe are userful to you guys. Well, but how can I make my rakes avaiable in anywere? Puting a file named rakefile.rb in your user home folder. Be careful, because you can make a task collide with some task in some project, I advice you to use a namespace g. A sample of how I use my rakefile.rb it's avaiable look in this project files.

Series
---
### Introduction ###
I hate when I download my favorite serie episode and the file name seems like: "mysiteItsAwesome.com.tHeWalkingDEAD.02x10.avi", so I created some tasks to help me with that:

### Task 1 ###
    rake g:series:nice-names:see[YOUR_SERIES_NAME]
Will look for all files in actual folder and padronize the file names. Probably you will not have problems with this task. This task will not rename the files, only show you how they will look.

### Task 2 ###
    rake g:series:nice-names:apply[YOUR_SERIES_NAME]
Will do the same of task 1, but will rename the files too. 


Musics
---
### Introduction ###
I hate when I download a lot of musics, and the names seems like: "mysiteItsAwesome.com.WolfMotherfucker-Vagabond.0123.mp3", so I created some tasks to help me with that:

### Task 1 ###
    rake g:musics:nice-names:see
Will look for all musics in actual folder and try to fix the name checking in a set of default regexps, probably it will not work at first time, you will have to adapt the SUBS constants for your needs. This task will not rename the files, only show you how they will look.

### Task 2 ###
    rake g:musics:nice-names:apply
Will do the same of task 1, but will rename the files too.


HQ (History Comic)
---
### Introduction ###
My comic reader just know how to read .cbz, but some websites like to make available as .zip, folder, or another shits, so I created some tasks to help me with that.

### Task 1 ###
    rake g:hq:convert-to-cbz
Will convert all .zip in actual folder to .cbz

### Task 2 ###
    rake g:hq:compress-to-cbz
Will compress all folders in actual folder in .cbz


Pascal
---
### Introduction ###
I hate have to compile and after that execute my pascal files, and have some garbage in my folder, so I created two tasks to help me with that.

### Task 1 ###
    rake g:pascal:run[filename]
Will compile, execute and delete all the generated files during the compilation.

### Task 2 ###
    rake g:pascal:compile[filename]
Will compile your source to you.
