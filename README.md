## Week 3 Homework Assignment
For Kodeco NY State iOS Bootcamp students
Introduction
In this module, we continued your learning of the Swift language by focusing on more advanced Swift constructs and rules. You looked at Swift functions and types, and learned how Swift overloads functions. You also practiced using closures, and built your skills with named types.

You learned about higher-order functions, protocols, and inheritance.
  
Wow! That is a lot to absorb. The good news is that these concepts are so fundamental in iOS development that you will get to practice them often. This repetition will help ingrain these concepts into your memory and become second nature in no time. It takes time and practice, which we’ll start on now!
Assignment
Part 1 - Programming assignment

For this homework, you will go back to using the first repository you created as part of homework 1. The instructions will use Terminal for the initial setup. Make sure Xcode is closed before doing the steps below.

Open Terminal and go to the directory where homework 1 repository is located.
If you are not on the main branch switch to it with git checkout main. To find the branch you are on, type git branch to list the branches. The branch you are on will have an asterisk by the name.
Create a branch called week3 with git checkout -b week3
Create a directory called week3 with mkdir week3

At this point you are in your git repository, and on your week3 branch and you have created a directory called week3. The following steps will be done in Xcode.

Open Xcode and select File -> New -> Playground.
Choose macOS and the Blank template and click Next.
Select the week3 directory to create the project in.
Give the Playground a name of your choosing and click Create.

You now have a Playground created in the week3 directory of your git repository on the week3 branch.

Now go back to the Terminal and perform the following steps.

Type git status. You should see that the directory week3 is untracked. If you do not, make sure you are in the top level directory of your project.
Type git add week3 this will add the directory week3 and its contents to your repository.
Type git status again, and you should the week3 directory and all of its contents.
Type git commit -m “Playground Setup”. You should see the directory and files listed again.

You are now ready to start the programming assignment. When you are done with your assignment go back to the Terminal one last time and type git commit -m “homework done”.



Swift in Playgrounds

This module’s programming assignment will be in Playgrounds.
 
a) In the assignment for Week 2, part D asked you to write a function that would compute the average of an array of Int. Using that function and the array created in part A, create two overloaded functions of the function average.

b) Create an enum called Animal that has at least five animals. Next, make a function called theSoundMadeBy that has a parameter of type Animal. This function should output the sound that the animal makes. For example, if the Animal pass is a cow, the function should output, “A cow goes moooo.” Hint: Do not use if statements to complete this section.
Call the function twice, sending a different Animal each time.

c) This question will have you creating multiple functions that will require you to use closures and collections. First, you will do some setup.

Create an array of Int called nums with the values of 0 to 100.
Create an array of Int? called numsWithNil with the following values: 
79, nil, 80, nil, 90, nil, 100, 72

Create an array of Int called numsBy2 with values starting at 2 through 100, incrementing by 2.
Create an array of Int called numsBy4 with values starting at 2 through 100, incrementing by 4.
You can set the values of the arrays above using whatever method you find the easiest. In previous modules, you were introduced to ranges and sequences in Swift. Leveraging those in the Array initializer will allow you to create the requested arrays in a single line. Don’t let the last two break your stride!
.
- Create a function called evenNumbersArray that takes a parameter of [Int] (array of Int) and returns [Int]. The array of Int returned should contain all the even numbers in the array passed. Call the function passing the nums array and print the output.
 

- Create a function called sumOfArray that takes a parameter of [Int?] and returns an Int. The function should return the sum of the array values passed that are not nil. Call the function passing the numsWithNil array, and print out the results.

- Create a function called commonElementsSet that takes two parameters of [Int] and returns a Set<Int> (set of Int.) The function will return a Set<Int> of the values in both arrays. 

Call the function commonElementsSet passing the arrays numsBy2, numsBy4, and print out the results.

d) Create a struct called Square that has a stored property called sideLength and a computed property called area. Create an instance of Square and print out the area.
 
Part 2 - Above and Beyond

Note: you don’t need to complete Above and Beyond sections in order to pass the homework. If you need to, you can stop here. But if you have the time and bandwidth, the A&B sections will let you challenge yourself further.

Create a protocol called Shape with a calculateArea() -> Double method. Create two structs called Circle and Rectangle that conform to the protocol Shape. Both Circle and Rectangle should have appropriate stored properties for calculating the area.

Create instances of Circle and Rectangle and print out the area for each.

Next, extend the protocol Shape to add a new method called calculateVolume() -> Double. 

Finally, create a struct called Sphere that conforms to Shape. Sphere should have appropriate stored properties for calculating area and volume.

Create an instance of Sphere and print out the area and volume.

Turning in your homework

The assignment should be in a GitHub repository that you have granted your mentor access to; include the repo or branch link in the homework email,  NYStateBC@gmail.com.
  
Your Playground should be in a new branch. Push the changes for your homework branch to GitHub and create a pull request, adding both mentors as reviewers.
Rubric
MEETS EXPECTATIONS (pass):
The app is in GitHub on a branch with a merge request to your mentor.
Your Playground compiles without errors or warnings.
Your Playground contains all programming assignments.
ABOVE AND BEYOND (pass): 
Everything in MEETS EXPECTATIONS
The code for the Above and Beyond
NEEDS IMPROVEMENT (fail):
Any item missing from the meets expectations list.
You can do this! If you need help or have questions, reach out in the Discord channels.



