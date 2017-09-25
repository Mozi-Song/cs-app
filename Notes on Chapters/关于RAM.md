## Von Neumann机器模型

组成：

	- Processing Unit
		- ALU
		- processor registers
	- Control Unit 控制数据在CPU和memory之间的流动　
		- instruction register
		- PC
	- memory: store data & instructions
	- external mass storage
	- input & output mechanisms

Von Neumann机器模型是一种stored-program computer，与program-controlled computer相对应。后者是1940年代发明的，典型的有ENIAC和Colossus，特点是程序是固定在硬件中的，像一个手持计算器，可以做四则运算，但是不能写文档或玩游戏。如果要改变程序的话，就要改变硬件，1940年代的那些女程序员是通过改变switch和插入patch cable去改变电路，从而修改程序的，通常要花几个周左右的时间debug。Von Neumann机器跟这些机器最主要的区别是它有内存，可以储存指令和数据。处理器可以读取内存中存取的暂时状态进行计算，得到相对复杂的结果。大多数现代计算机都是Von Neumann机器。

## Memory

通常计算机中会有一个storage hierarchy，将快、小而贵的存储方式放在CPU的近处，而慢、大而便宜的放在远处。一般把前面这些快且挥发性(volatile)的称作memory，而慢且掉电不丢失数据的称作storage。不过有时把掉电不丢失数据的存储方式也叫memory。

<img src="https://upload.wikimedia.org/wikipedia/commons/3/3e/Computer_storage_types.svg" width="300"> 

现代用法中一般用memory指代半导体随机读写存储器，即RAM，一般指DRAM或其他快速但临时的存储。而storage一般指CPU**不直接访问**的存储，如硬盘，光盘和其他比RAM慢但不挥发的存储方式。

memory = core memory = main memory = real storage = internal memory<br>
non-volatile storage = secondary storage = external memory = auxiliary/peripheral storage

内存通常以**内存总线 (memory bus)**与CPU相连。其实有两条总线：**地址总线**和**数据总线**。CPU先从地址总线发送一个内存地址到内存，内存地址表示CPU想要拿到的数据的地址。然后它经过数据总线向memory cells读写数据。

由于primary storage用的是易挥发的RAM，计算机启动时还需要一片不易挥发的二级存储空间来存放程序，然后一个叫BIOS的程序会从二级存储空间读取程序到内存中执行。这个过程叫做**bootstrap**。这个BIOS程序放在一个不易挥发的存储空间，称为**ROM**。

# RAM & ROM

## RAM & ROM

| |RAM|ROM|
|:--- |:---- |:---- |
|**Definition** |Random Access Memory or RAM is a form of data storage that can be accessed randomly at any time, in any order and from any physical location., allowing quick access and manipulation. |Read-only memory or ROM is also a form of data storage that can not be easily altered or reprogrammed.Stores instuctions that are not nescesary for re-booting up to make the computer operate when it is switched off.They are hardwired.|
|**Stands for** |Random Access Memory<br>易挥发性随机存取存储器|Read-only memory<br>只读存储器|
|**Use** |RAM allows the computer to read data quickly to run applications. It allows reading and writing. <br>通常用来存放操作系统、各种正在运行的软件、输入和输出数据、中间结果及与外存交换信息等，我们常说的内存主要是指RAM。|ROM stores the program required to initially boot the computer. It only allows reading.<br>断电后信息不丢失，如计算机启动用的BIOS芯片。存取速度很低(较RAM而言)，且不能改写。由于不能改写信息，不能升级，现已很少使用。|
|**Volatility** |RAM is volatile i.e. its contents are lost when the device is powered off. |It is non-volatile i.e. its contents are retained even when the device is powered off.|
|**Types** |The two main types of RAM are static RAM and dynamic RAM. |The types of ROM include PROM, EPROM and EEPROM.|


## SRAM & DRAM

|  |Dynamic random-access memory|Static random-access memory|
|:--- |:---- |:---- |
|Introduction (from Wikipedia) |Dynamic random-access memory is a type of random-access memory that stores each bit of data in a separate capacitor within an integrated circuit. |Static random-access memory is a type of semiconductor memory that uses bistable latching circuitry to store each bit. The term static differentiates it from dynamic RAM (DRAM) which must be periodically refreshed.|
|Typical applications |Main memory in a computer (e.g. DDR3). Not for long-term storage. |L2 and L3 cache in a CPU|
|Typical sizes |1GB to 2GB in smartphones and tablets; 4GB to 16GB in laptops |1MB to 16MB|
|Place Where Present |Present on motherboard. |Present on Processors or between Processor and Main Memory.

- SRAM & DRAM http://www.diffen.com/difference/Dynamic_random-access_memory_vs_Static_random-access_memory, how does SRAM work
- What is ROM, how does it work, EEPROMs and all
- diff. between firmware and OS

## RAM

RAM is considered "random access" because you can access any memory cell directly if you know the row and column that intersect at that cell. The opposite of RAM is **serial access memory** (SAM). SAM stores data as a series of memory cells that can only be accessed sequentially (like a cassette tape). If the data is not in the current location, each memory cell is checked until the needed data is found. SAM works very well for memory buffers, where the data is normally stored in the order in which it will be used (a good example is the texture buffer memory on a video card). RAM data, on the other hand, can be accessed in any order.

Similar to a microprocessor, a [memory](#memory) chip is an integrated circuit (IC) made of millions of transistors and capacitors. In the most common form of computer memory, **dynamic random access memory** (DRAM), a transistor and a capacitor are paired to create a memory cell, which represents a single bit of data. The capacitor holds the bit of information -- a 0 or a 1 (see How Bits and Bytes Work for information on bits). The transistor acts as a switch that lets the control circuitry on the memory chip read the capacitor or change its state.

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



# Memory
在计算机的组成结构中，有一个很重要的部分，就是存储器。存储器是用来存储程序和数据的部件，对于计算机来说，有了存储器，才有记忆功能，才能保证正常工作。存储器的种类很多，按其用途可分为主存储器和辅助存储器，主存储器又称内存储器（简称内存，港台称之为记忆体）。

内存又称主存，是CPU能直接寻址的存储空间，由半导体器件制成。内存的特点是存取速率快。内存是电脑中的主要部件，它是相对于外存而言的。我们平常使用的程序，如Windows操作系统、打字软件、游戏软件等，一般都是安装在硬盘等外存上的。但仅此是不能使用其功能的，必须把它们调入内存中运行，才能真正使用其功能，我们平时输入一段文字，或玩一个游戏，其实都是在内存中进行的。就好比在一个书房里，存放书籍的书架和书柜相当于电脑的外存，而我们工作的办公桌就是内存。通常我们把要永久保存的、大量的数据存储在外存上，而把一些临时的或少量的数据和程序放在内存上，当然内存的好坏会直接影响电脑的运行速度。

## Why Memory
In early 2012, a new Mac might be equipped with 4 GB of memory and a hard drive whose storage capacity is 500 GB. The primary reason for this great disparity is cost. Memory, RAM, is much more expensive than hard drive storage space. Here’s a rough comparison. One GB of RAM costs about $8, while 1 GB of hard drive storage space costs about 10 cents. In other words, RAM costs about 8000 as much as hard drive storage space.

Oddly enough, memory does not "remember" anything when the power is turned off. So why do they call it memory? Because the first memory did "remember," but today's RAM chips do not. Although there are memory chips that do hold their content permanently (ROMs, EEPROMs, flash memory, etc.), they are used for internal control purposes and data storage, not for processing. 


# 总结

- RAM称为Random Access Memory的原因是它可以通过已知的行、列数access任何一个memory cell，而不需要像SAM那样遍历前面的所有memory cell直至找到想要的那一个。简而言之，RAM可以以任何顺序访问memory cell，而SAM比较适合顺序访问。
