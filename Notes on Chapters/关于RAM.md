# RAM

## 内存
在计算机的组成结构中，有一个很重要的部分，就是存储器。存储器是用来存储程序和数据的部件，对于计算机来说，有了存储器，才有记忆功能，才能保证正常工作。存储器的种类很多，按其用途可分为主存储器和辅助存储器，主存储器又称内存储器（简称内存，港台称之为记忆体）。

内存又称主存，是CPU能直接寻址的存储空间，由半导体器件制成。内存的特点是存取速率快。内存是电脑中的主要部件，它是相对于外存而言的。我们平常使用的程序，如Windows操作系统、打字软件、游戏软件等，一般都是安装在硬盘等外存上的。但仅此是不能使用其功能的，必须把它们调入内存中运行，才能真正使用其功能，我们平时输入一段文字，或玩一个游戏，其实都是在内存中进行的。就好比在一个书房里，存放书籍的书架和书柜相当于电脑的外存，而我们工作的办公桌就是内存。通常我们把要永久保存的、大量的数据存储在外存上，而把一些临时的或少量的数据和程序放在内存上，当然内存的好坏会直接影响电脑的运行速度。

## Why Memory
In early 2012, a new Mac might be equipped with 4 GB of memory and a hard drive whose storage capacity is 500 GB. The primary reason for this great disparity is cost. Memory, RAM, is much more expensive then hard drive storage space. Here’s a rough comparison. One GB of RAM costs about $8, while 1 GB of hard drive storage space costs about 10 cents. In other words, RAM costs about 8000 as much as hard drive storage space.

Oddly enough, memory does not "remember" anything when the power is turned off. So why do they call it memory? Because the first memory did "remember," but today's RAM chips do not. Although there are memory chips that do hold their content permanently (ROMs, EEPROMs, flash memory, etc.), they are used for internal control purposes and data storage, not for processing. 

## RAM & ROM
|RAM|ROM
|*Definition* |Random Access Memory or RAM is a form of data storage that can be accessed randomly at any time, in any order and from any physical location., allowing quick access and manipulation. |Read-only memory or ROM is also a form of data storage that can not be easily altered or reprogrammed.Stores instuctions that are not nescesary for re-booting up to make the computer operate when it is switched off.They are hardwired.
|*Stands for* |Random Access Memory |Read-only memory
|*Use* |RAM allows the computer to read data quickly to run applications. It allows reading and writing. |ROM stores the program required to initially boot the computer. It only allows reading.
|*Volatility* |RAM is volatile i.e. its contents are lost when the device is powered off. |It is non-volatile i.e. its contents are retained even when the device is powered off.
|*Types* |The two main types of RAM are static RAM and dynamic RAM. |The types of ROM include PROM, EPROM and EEPROM.

- RAM：Ramdom Access Memory 易挥发性随机存取存储器，高速存取，读写时间相等，且与地址无关，如计算机内存等。 
- ROM：Read Only Memory 只读存储器。断电后信息不丢失，如计算机启动用的BIOS芯片。存取速度很低(较RAM而言)，且不能改写。由于不能改写信息，不能升级，现已很少使用。 
- ROM和RAM是计算机内存储器的两种型号：ROM表示的是只读存储器，即：它只能读出信息，不能写入信息，计算机关闭电源后其内的信息仍旧保存，一般用它存储固定的系统软件和字库等。RAM表示的是读写存储器，可其中的任一存储单元进行读或写操作，计算机关闭电源后其内的信息将不在保存，再次开机需要重新装入，通常用来存放操作系统，各种正在运行的软件、输入和输出数据、中间结果及与外存交换信息等，我们常说的内存主要是指RAM。

## SRAM & DRAM
//todo: 
- SRAM & DRAM http://www.diffen.com/difference/Dynamic_random-access_memory_vs_Static_random-access_memory, how does SRAM work
- What is ROM, how does it work, EEPROMs and all
- diff. between firmware and OS

## RAM

RAM is considered "random access" because you can access any memory cell directly if you know the row and column that intersect at that cell. The opposite of RAM is **serial access memory** (SAM). SAM stores data as a series of memory cells that can only be accessed sequentially (like a cassette tape). If the data is not in the current location, each memory cell is checked until the needed data is found. SAM works very well for memory buffers, where the data is normally stored in the order in which it will be used (a good example is the texture buffer memory on a video card). RAM data, on the other hand, can be accessed in any order.

Similar to a microprocessor, a memory chip is an integrated circuit (IC) made of millions of transistors and capacitors. In the most common form of computer memory, **dynamic random access memory** (DRAM), a transistor and a capacitor are paired to create a memory cell, which represents a single bit of data. The capacitor holds the bit of information -- a 0 or a 1 (see How Bits and Bytes Work for information on bits). The transistor acts as a switch that lets the control circuitry on the memory chip read the capacitor or change its state.

A capacitor is like a small bucket that is able to store electrons. To store a 1 in the memory cell, the bucket is filled with electrons. To store a 0, it is emptied. The problem with the capacitor's bucket is that it has a leak. In a matter of a few milliseconds a full bucket becomes empty. Therefore, for dynamic memory to work, either the CPU or the memory controller has to come along and recharge all of the capacitors holding a 1 before they discharge. To do this, the memory controller reads the memory and then writes it right back. This refresh operation happens automatically thousands of times per second.
<img src="/Images/chap1-RAM-1.PNG" width="300"> 

The capacitor in a dynamic RAM memory cell is like a leaky bucket. It needs to be refreshed periodically or it will discharge to 0. This refresh operation is where **dynamic RAM** gets its name. Dynamic RAM has to be dynamically refreshed all of the time or it forgets what it is holding. The downside of all of this refreshing is that it takes time and slows down the memory.
<img src="/Images/chap1-RAM-2.PNG" width="300"> 

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

# Static RAM
Static RAM uses a completely different technology. In static RAM, a form of flip-flop holds each bit of memory (see How Boolean Logic Works for details on flip-flops). A flip-flop for a memory cell takes four or six transistors along with some wiring, but never has to be refreshed. This makes static RAM significantly faster than dynamic RAM. However, because it has more parts, a static memory cell takes up a lot more space on a chip than a dynamic memory cell. Therefore, you get less memory per chip, and that makes static RAM a lot more expensive.

Static RAM is fast and expensive, and dynamic RAM is less expensive and slower. So static RAM is used to create the CPU's speed-sensitive cache, while dynamic RAM forms the larger system RAM space.

Reference:　[How RAM Works](http://computer.howstuffworks.com/ram.htm)