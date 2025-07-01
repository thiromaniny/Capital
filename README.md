# RWiOSBootcamp
**********
HW 2W Part 2
^^^^^^^^^^^^^
Area: square1 - 16 square2 - 25
Area: rectangle1 - 20 rectangle2 - 20
>> End  two lines of printout <<

Value Types (Struct Square):

When square2 is created as a copy of square1, any changes to square2 do not affect square1 because they are separate instances with their own copies of data.
This is why square1 retains its original area calculation of 16, while square2 changes to an area of 25 after modifying its side property.
///////////\\\\\\\\\\\
///////////\\\\\\\\\\\
Reference Types (Class Rectangle):

When rectangle2 is assigned the value of rectangle1, both variables refer to the same instance in memory.
Any changes to rectangle2's properties directly affect rectangle1 because there is only one shared instance.
This is why both rectangle1 and rectangle2 have the same area calculation of 20 after modifying rectangle2.length.
