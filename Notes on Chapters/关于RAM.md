### RAM

RAM is considered "random access" because you can access any memory cell directly if you know the row and column that intersect at that cell. The opposite of RAM is **serial access memory** (SAM). SAM stores data as a series of memory cells that can only be accessed sequentially (like a cassette tape). If the data is not in the current location, each memory cell is checked until the needed data is found. SAM works very well for memory buffers, where the data is normally stored in the order in which it will be used (a good example is the texture buffer memory on a video card). RAM data, on the other hand, can be accessed in any order.

Similar to a microprocessor, a memory chip is an integrated circuit (IC) made of millions of transistors and capacitors. In the most common form of computer memory, **dynamic random access memory** (DRAM), a transistor and a capacitor are paired to create a memory cell, which represents a single bit of data. The capacitor holds the bit of information -- a 0 or a 1 (see How Bits and Bytes Work for information on bits). The transistor acts as a switch that lets the control circuitry on the memory chip read the capacitor or change its state.

A capacitor is like a small bucket that is able to store electrons. To store a 1 in the memory cell, the bucket is filled with electrons. To store a 0, it is emptied. The problem with the capacitor's bucket is that it has a leak. In a matter of a few milliseconds a full bucket becomes empty. Therefore, for dynamic memory to work, either the CPU or the memory controller has to come along and recharge all of the capacitors holding a 1 before they discharge. To do this, the memory controller reads the memory and then writes it right back. This refresh operation happens automatically thousands of times per second.
<img src="/Images/chap1-RAM-1.PNG" width="500"> 

The capacitor in a dynamic RAM memory cell is like a leaky bucket. It needs to be refreshed periodically or it will discharge to 0. This refresh operation is where **dynamic RAM** gets its name. Dynamic RAM has to be dynamically refreshed all of the time or it forgets what it is holding. The downside of all of this refreshing is that it takes time and slows down the memory.
<img src="/Images/chap1-RAM-2.PNG" width="500"> 

Memory is made up of bits arranged in a two-dimensional grid.

In this figure, red cells represent 1s and white cells represent 0s. In the animation, a column is selected and then rows are charged to write data into the specific column.

Memory cells are etched onto a silicon wafer in an array of columns (**bitlines**) and rows (**wordlines**). The intersection of a bitline and wordline constitutes the **address** of the memory cell.

DRAM works by sending a charge through the appropriate column (CAS) to activate the transistor at each bit in the column. When writing, the row lines contain the state the capacitor should take on. When reading, the sense-amplifier determines the level of charge in the capacitor. If it is more than 50 percent, it reads it as a 1; otherwise it reads it as a 0. The counter tracks the refresh sequence based on which rows have been accessed in what order. The length of time necessary to do all this is so short that it is expressed in nanoseconds (billionths of a second). A memory chip rating of 70ns means that it takes 70 nanoseconds to completely read and recharge each cell.

Memory cells alone would be worthless without some way to get information in and out of them. So the memory cells have a whole support infrastructure of other specialized circuits. These circuits perform functions such as:

- Identifying each row and column (*row address select* and *column address select*)
- Keeping track of the refresh sequence (*counter*)
- Reading and restoring the signal from a cell (*sense amplifier*)
- Telling a cell whether it should take a charge or not (*write enable*)

Other functions of the memory controller include a series of tasks that include identifying the type, speed and amount of memory and checking for errors.

## Static RAM
Static RAM uses a completely different technology. In static RAM, a form of flip-flop holds each bit of memory (see How Boolean Logic Works for details on flip-flops). A flip-flop for a memory cell takes four or six transistors along with some wiring, but never has to be refreshed. This makes static RAM significantly faster than dynamic RAM. However, because it has more parts, a static memory cell takes up a lot more space on a chip than a dynamic memory cell. Therefore, you get less memory per chip, and that makes static RAM a lot more expensive.

Static RAM is fast and expensive, and dynamic RAM is less expensive and slower. So static RAM is used to create the CPU's speed-sensitive cache, while dynamic RAM forms the larger system RAM space.

Reference:　[How RAM Works](http://computer.howstuffworks.com/ram.htm)