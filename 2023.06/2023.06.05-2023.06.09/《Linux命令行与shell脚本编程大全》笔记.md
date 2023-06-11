# 《Linux命令行与shell脚本编程大全》笔记

## 第一章 初识 Linux shell

### 1.1 Linux初探

![image-20230610113403659](D:\Typora image\image-20230610113403659.png)

![image-20230610113458322](D:\Typora image\image-20230610113458322.png)

#### 1.1.1 深入探究Linux内核

Linux系统的核心是内核。内核控制着计算机系统的软硬件。

**内核主要负责以下四种功能**：

![image-20230610113725935](D:\Typora image\image-20230610113725935.png)

![image-20230610113734784](D:\Typora image\image-20230610113734784.png)

1. 系统内存管理

![image-20230610114001882](D:\Typora image\image-20230610114001882.png)

#### 1.1.2 GNU实用工具

![image-20230610114451007](D:\Typora image\image-20230610114451007.png)

![image-20230610114505835](D:\Typora image\image-20230610114505835.png)

1. 核心GNU实用工具

![image-20230610150743648](D:\Typora image\image-20230610150743648.png)

2. shell

![image-20230610150837597](D:\Typora image\image-20230610150837597.png)

## 第二章 走进shell

感觉没说什么

### 2.7 小结

![image-20230610151512824](D:\Typora image\image-20230610151512824.png)

![image-20230610151528852](D:\Typora image\image-20230610151528852.png)

## 第三章 bash shell 基础命令

![image-20230610151616939](D:\Typora image\image-20230610151616939.png)

### 3.1 启动shell 

GNU bash shell是一个程序，提供了对Linux系统的交互式访问。它是作为普通程序运行的，通常是在用户登录终端时启动。启动什么shell程序取决于用户账户的配置。

在WSL中应该通过输入bash开启的这个程序。

### 3.2 使用shell提示符

![image-20230610152704839](D:\Typora image\image-20230610152704839.png)

### 3.3 与bash手册交互

![image-20230610153015950](D:\Typora image\image-20230610153015950.png)

![image-20230610153105436](D:\Typora image\image-20230610153105436.png)

shell命令采用的基本模式如下：

![image-20230610153251187](D:\Typora image\image-20230610153251187.png)

![image-20230610153310870](D:\Typora image\image-20230610153310870.png)

![image-20230610153339882](D:\Typora image\image-20230610153339882.png)

![image-20230610153533572](D:\Typora image\image-20230610153533572.png)

### 3.4 浏览文件系统

当登录系统并获得shell命令提示符后，通常位于用户主目录中。想进入其它目录，则需要shell命令cd去操作。

#### 3.4.1 Linux文件系统

Linux文件与win文件系统的区别：

1. Linux不使用驱动器盘符，而win用，例如：

![image-20230610153934593](D:\Typora image\image-20230610153934593.png)

而Linux会将文件存储在名为**虚拟目录**的单个目录结构中。而虚拟目录会把计算机系统所有存储设备的文件路径都纳入单个目录结构。

Linux虚拟目录结构中只有一个称为**根目录**的基础目录。根目录下的目录和文件会按照其访问路径一一列出。

![image-20230610154310016](D:\Typora image\image-20230610154310016.png)

![image-20230610154337282](D:\Typora image\image-20230610154337282.png)

![image-20230610154347689](D:\Typora image\image-20230610154347689.png)

Linux选取根驱动器后，会使用根驱动器上一些特别的目录作为**挂载点**。挂载点就是虚拟目录中分配给额外存储设备的目录。Linux会让文件和目录出现在这些挂载点目录中，即便它们位于其它物理驱动器，自己的物理驱动器当然也可以。

系统文件通常就存在根驱动器，用户文件就存储在其它驱动器，如下图：

![image-20230610154931234](D:\Typora image\image-20230610154931234.png)

![image-20230610154946848](D:\Typora image\image-20230610154946848.png)

![image-20230610155021045](D:\Typora image\image-20230610155021045.png)

![image-20230610155105509](D:\Typora image\image-20230610155105509.png)

![image-20230610155132873](D:\Typora image\image-20230610155132873.png)

#### 3.4.2 遍历目录

![image-20230610155313128](D:\Typora image\image-20230610155313128.png)

1. 绝对路径

用户在虚拟目录中采用**绝对路径**来引用目录名。绝对路径该目录在虚拟目录中从根目录到该目录的确切位置，相当于路径的全名。

![image-20230610155559963](D:\Typora image\image-20230610155559963.png)

![image-20230610155609345](D:\Typora image\image-20230610155609345.png)

波浪号表示在主目录。

![image-20230610155808494](D:\Typora image\image-20230610155808494.png)

wsl是配置了的。

![image-20230610155841681](D:\Typora image\image-20230610155841681.png)

![image-20230610155921609](D:\Typora image\image-20230610155921609.png)

好处就是任意，坏处难打。

2. 相对路径

**相对路径**允许指定一个基于当前位置的目标路径。相对路径不以根目录的/为开头，而是以当前目录的目录名。

![image-20230610160202178](D:\Typora image\image-20230610160202178.png)

![image-20230610160222148](D:\Typora image\image-20230610160222148.png)

![image-20230610160243199](D:\Typora image\image-20230610160243199.png)

![image-20230610160252412](D:\Typora image\image-20230610160252412.png)

![image-20230610160322199](D:\Typora image\image-20230610160322199.png)

![image-20230610160356906](D:\Typora image\image-20230610160356906.png)

### 3.5 列出文件和目录

![image-20230610160548489](D:\Typora image\image-20230610160548489.png)

#### 3.5.1 显示基本列表

![image-20230610160750381](D:\Typora image\image-20230610160750381.png)

![image-20230610160803351](D:\Typora image\image-20230610160803351.png)

![image-20230610160821533](D:\Typora image\image-20230610160821533.png)

![image-20230610160946370](D:\Typora image\image-20230610160946370.png)

![image-20230610161137250](D:\Typora image\image-20230610161137250.png)

![image-20230610161149970](D:\Typora image\image-20230610161149970.png)

我试了，巨长。

#### 3.5.2 显示长列表

![image-20230610161334477](D:\Typora image\image-20230610161334477.png)

![image-20230610161423641](D:\Typora image\image-20230610161423641.png)

#### 3.5.3 过滤输出列表

随便看看

![image-20230610161526889](D:\Typora image\image-20230610161526889.png)

![image-20230610161610196](D:\Typora image\image-20230610161610196.png)

![image-20230610161621087](D:\Typora image\image-20230610161621087.png)

![image-20230610161706182](D:\Typora image\image-20230610161706182.png)

### 3.6 处理文件

#### 3.6.1 创建文件

![image-20230610161854588](D:\Typora image\image-20230610161854588.png)

touch 命令相当于声明文件？

#### 3.6.2 复制文件

用cp命令

![image-20230610162106993](D:\Typora image\image-20230610162106993.png)

![image-20230610162308111](D:\Typora image\image-20230610162308111.png)

![image-20230610162402776](D:\Typora image\image-20230610162402776.png)

![image-20230610162431851](D:\Typora image\image-20230610162431851.png)

![image-20230610162442494](D:\Typora image\image-20230610162442494.png)

![image-20230610162516412](D:\Typora image\image-20230610162516412.png)

![image-20230610162538574](D:\Typora image\image-20230610162538574.png)

![image-20230610162551387](D:\Typora image\image-20230610162551387.png)

#### 3.6.3 使用命令行补全

![image-20230610164308731](D:\Typora image\image-20230610164308731.png)

![image-20230610164323099](D:\Typora image\image-20230610164323099.png)

#### 3.6.4 链接文件

![image-20230610164414713](D:\Typora image\image-20230610164414713.png)

![image-20230610164536590](D:\Typora image\image-20230610164536590.png)

![image-20230610164554669](D:\Typora image\image-20230610164554669.png)

![image-20230610164613511](D:\Typora image\image-20230610164613511.png)

![image-20230610164650132](D:\Typora image\image-20230610164650132.png)

就是同一个文件，这是什么意思呢，两个都是指针？

#### 3.6.5 文件重命名

![image-20230610164800131](D:\Typora image\image-20230610164800131.png)

![image-20230610164832011](D:\Typora image\image-20230610164832011.png)

![image-20230610164842691](D:\Typora image\image-20230610164842691.png)

![image-20230610164854561](D:\Typora image\image-20230610164854561.png)

![image-20230610164902244](D:\Typora image\image-20230610164902244.png)

![image-20230610164939940](D:\Typora image\image-20230610164939940.png)

![image-20230610164948333](D:\Typora image\image-20230610164948333.png)

![image-20230610165007101](D:\Typora image\image-20230610165007101.png)

![image-20230610165017669](D:\Typora image\image-20230610165017669.png)

![image-20230610165033561](D:\Typora image\image-20230610165033561.png)

#### 3.6.6 删除文件

![image-20230610165122715](D:\Typora image\image-20230610165122715.png)

### 3.7 管理目录

![image-20230610165227253](D:\Typora image\image-20230610165227253.png)

#### 3.7.1 创建目录

![image-20230610165246926](D:\Typora image\image-20230610165246926.png)

![image-20230610165307179](D:\Typora image\image-20230610165307179.png)

![image-20230610165345097](D:\Typora image\image-20230610165345097.png)

![image-20230610165454259](D:\Typora image\image-20230610165454259.png)

![image-20230610165502061](D:\Typora image\image-20230610165502061.png)

![image-20230610165519753](D:\Typora image\image-20230610165519753.png)

### 3.8 查看文件内容

![image-20230610165602107](D:\Typora image\image-20230610165602107.png)

#### 3.8.1 查看文件类型

![image-20230610165740022](D:\Typora image\image-20230610165740022.png)

#### 3.8.2 查看整个文件

![image-20230610165807103](D:\Typora image\image-20230610165807103.png)

1. cat 命令

![image-20230610165834031](D:\Typora image\image-20230610165834031.png)

![image-20230610165854502](D:\Typora image\image-20230610165854502.png)

2. more 命令

![image-20230610165926649](D:\Typora image\image-20230610165926649.png)

![image-20230610170014499](D:\Typora image\image-20230610170014499.png)

3. less 命令

![image-20230610170106773](D:\Typora image\image-20230610170106773.png)

![image-20230610170127015](D:\Typora image\image-20230610170127015.png)

#### 3.8.3 查看文件的部分内容

![image-20230610170227212](D:\Typora image\image-20230610170227212.png)

![image-20230610170259063](D:\Typora image\image-20230610170259063.png)

![image-20230610170313846](D:\Typora image\image-20230610170313846.png)

![image-20230610170326376](D:\Typora image\image-20230610170326376.png)

### 3.9 小结

![image-20230610170349227](D:\Typora image\image-20230610170349227.png)

![image-20230610170358811](D:\Typora image\image-20230610170358811.png)
