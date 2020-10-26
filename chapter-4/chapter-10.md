# Chapter 10 - Working With Text

## 10.1 Introduction

### 10.1.1 Viewing Files in the Terminal

The `cat` command, short for concatenate, is a simple but useful command whose functions include creating and displaying text files, as well as combining copies of text files. One of the most popular uses of cat is to display the content of text files. To display a file in the standard output using the cat command, type the command followed by the filename:

```bash
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$ cat food.txt 
Food is good.
```

Although the terminal is the default output of this command, the cat command can also be used for redirecting file content to other files or input for another command by using redirection characters.


### 10.1.2 Viewing Files Using a Pager

While viewing small files with the cat command poses no problems, it is not an ideal choice for large files. The cat command doesn't provide any easy ways to pause and restart the display, so the entire file contents are dumped to the screen.

For larger files, use a pager command to view the contents. Pager commands display one page of data at a time, allowing you to move forward and backward in the file by using movement keys.

There are two commonly used pager commands:

- The less command provides a very advanced paging capability. It is usually the default pager used by commands like the man command.
- The more command has been around since the early days of UNIX. While it has fewer features than the less command, however, the less command isn't included with all Linux distributions. The more command is always available.
- The more and less commands allow users to move around the document using keystroke commands. Because developers based the less command on the functionality of the more command, all of the keystroke commands available in the more command also work in the less command.

The focus of our content is on the more advanced less command. The more command is still useful to remember for times when the less command isn't available. Remember that most of the keystroke commands provided work for both commands


#### 10.1.2.1 Pager Movement Commands

To view a file with the less command, pass the file name as an argument:

```bash
sysadmin@localhost:~/Documents$ less words
```

There are many movement commands for the less command, each with multiple possible keys or key combinations. While this may seem intimidating, it is not necessary to memorize all of these movement commands. When viewing a file with the less command, use the H key or Shift+H to display a help screen:

The first group of movement commands to focus on are the ones that are most commonly used. To make it even more convenient, the keys that are identical in more and less are summarized below in order to demonstrate how to move in more and less at the same time:

‌⁠​​⁠​ 
Key	Movement:

- Spacebar Window forward
- B	Window backward
- Enter	Line forward
- Q	Exit
- H	Help


#### 10.1.2.2 Pager Searching Commands

There are two ways to search in the less command: searching forward or backward from your current position.

To start a search to look forward from your current position, use the slash `/` key. Then, type the text or pattern to match and press the Enter key.

Notice that "frog" didn't have to be a word by itself. Also notice that while the less command moved to the first match from the current position, all matches were highlighted.

If no matches forward from your current position can be found, then the last line of the screen will report Pattern not found:

To search backward from your current position, press the question mark `?` key, then type the text or pattern to match and press the Enter key. The cursor moves backward to the first match it can find or reports that the pattern cannot be found.

If more than one match can be found by a search, then use the n key to move the next match and use the Shift+N key combination to go to a previous match.

The search terms actually use patterns called **regular expressions**. More details regarding regular expressions are provided later in this chapter.

### 10.1.3 Head and Tail

The **head** and **tail** commands are used to display only the first few or last few lines of a file, respectively (or, when used with a pipe, the output of a previous command). By default, the head and tail commands display ten lines of the file that is provided as an argument.

Passing a number as an option will cause both the head and tail commands to output the specified number of lines, instead of the standard ten. For example to display the last five lines of the /etc/sysctl.conf file use the -5 option:

The -n option can also be used to indicate how many lines to output. Pass a number as an argument to the option:


```bash
sysadmin@localhost:~/Documents$ cd
sysadmin@localhost:~$ head /etc/sysctl.conf
#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables
# See sysctl.conf (5) for information.
#

#kernel.domainname = example.com

# Uncomment the following to stop low-level messages on console
#kernel.printk = 3 4 1 3
sysadmin@localhost:~$ tail -5 /etc/sysctl.conf
# Protects against creating or following links under certain conditions
# Debian kernels have both set to 1 (restricted)
# See https://www.kernel.org/doc/Documentation/sysctl/fs.txt
#fs.protected_hardlinks=0
#fs.protected_symlinks=0

sysadmin@localhost:~$ head -n 3 /etc/sysctl.conf
#
# /etc/sysctl.conf - Configuration file for setting system variables
# See /etc/sysctl.d/ for additional system variables
```

**Negative Value Option**

Traditionally in UNIX, the number of lines to output would be specified as an option with either command, so -3 meant to show three lines. For the tail command, either -3 or -n -3 still means show three lines.

However, the GNU version of the head command recognizes -n -3 as show all but the last three lines, and yet the head command still recognizes the option -3 as show the first three lines.

**Positive Value Option**

The GNU version of the tail command allows for a variation of how to specify the number of lines to be printed. If the -n option is used with a number prefixed by the plus sign, then the tail command recognizes this to mean to display the contents starting at the specified line and continuing all the way to the end.

For example, the following displays the contents of the /etc/passwd from line 25 to the end of the file:

```bash
sysadmin@localhost:~$ nl /etc/passwd | tail -n +25
    25  sshd:x:103:65534::/var/run/sshd:/usr/sbin/nologin
    26  operator:x:1000:37::/root:/bin/sh
    27  sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash
```

> !!!!!! Live file changes can be viewed by using the -f option to the tail command—useful when you want to see changes to a file as they are happening. A good example of this would be when viewing log files as a system administrator. Log files can be used to troubleshoot problems and administrators often view them "interactively" with the tail command while performing commands in a separate window. For example, if you were to log in as the root user, you could troubleshoot issues with the email server by viewing live changes to the /var/log/mail.log log file. !!!!!!


## 10.2 Command Line Pipes

**The pipe `|` character** can be used to send the output of one command to another. 

> Typically, when a command has output or generates an error, the output is displayed to the screen; however, this does not have to be the case. Instead of being printed to the screen, the output of one command becomes input for the next command. This tool can be powerful, especially when looking for specific data; piping is often used to refine the results of an initial command.

In previous examples the head and tail commands were given files as arguments to operate on. However, the pipe character allows you to utilize these commands not only on files, but on the output of other commands. This can be useful when listing a large directory, for example the /etc directory:

The previous command lists a large number of files. If you execute this in our terminal, the output is cut off and can only be viewed if scrolling up. To more easily view the beginning of the output, pipe it to the head command. The following example displays only the first ten lines:

```bash
sysadmin@localhost:~$ ls /etc
sysadmin@localhost:~$ ls /etc | head
X11
adduser.conf
alternatives
apparmor
apparmor.d
apt
bash.bashrc
bind
bindresvport.blacklist
binfmt.d
```

The full output of the ls command is passed to the head command by the shell instead of being printed to the screen. The head command takes this output from the ls command as input data, and the output of head is then printed to the screen.

Multiple pipes can be used consecutively to link multiple commands together. If three commands are piped together, the output of the first command is passed to the second command. Then, the output of the second command is passed to the third command. The output of the third command would then be printed to the screen.

It is important to carefully choose the order in which commands are piped, as each command only sees input from the previous command. The examples below illustrate this using the nl command, which adds line numbers to the output. In the first example, the `nl` command is used to number the lines of the output of the preceding ls command

In the next example, note that the ls command is executed first and its output is sent to the nl command, numbering all of the lines from the output of the ls command. Then the tail command is executed, displaying the last five lines from the output of the nl command:

```bash
sysadmin@localhost:~$ ls /etc/ssh | nl
     1  moduli
     2  ssh_config
     3  ssh_host_ecdsa_key
     4  ssh_host_ecdsa_key.pub
     5  ssh_host_ed25519_key
     6  ssh_host_ed25519_key.pub
     7  ssh_host_rsa_key
     8  ssh_host_rsa_key.pub
     9  ssh_import_id
    10  sshd_config
sysadmin@localhost:~$ ls /etc/ssh | nl | tail -5
     6  ssh_host_ed25519_key.pub
     7  ssh_host_rsa_key
     8  ssh_host_rsa_key.pub
     9  ssh_import_id
    10  sshd_config
Compare the output above with the next example:

sysadmin@localhost:~$ ls /etc/ssh | tail -5 | nl
     1  ssh_host_ed25519_key.pub
     2  ssh_host_rsa_key
     3  ssh_host_rsa_key.pub
     4  ssh_import_id
     5  sshd_config
```

## 10.3 Input/Output Redirection

**Input/Output (I/O) redirection** allows for command line information to be passed to different streams. Before discussing redirection, it is important to understand the standard streams.

- **STDIN** = Standard input, or STDIN, is information entered normally by the user via the keyboard. When a command prompts the shell for data, the shell provides the user with the ability to type commands that, in turn, are sent to the command as STDIN.
- **STDOUT** = Standard output, or STDOUT, is the normal output of commands. When a command functions correctly (without errors) the output it produces is called STDOUT. By default, STDOUT is displayed in the terminal window where the command is executing. STDOUT is also known as **stream or channel #1**.
- **STDERR** = Standard error, or STDERR, is error messages generated by commands. By default, STDERR is displayed in the terminal window where the command is executing. STDERR is also known as **stream or channel #2**.
‌⁠​
I/O redirection allows the user to :
- redirect STDIN so that data comes from a file 
- STDOUT/STDERR so that output goes to a file. 
- Redirection is achieved by using the arrow < > characters.

### 10.3.1 STDOUT 

STDOUT can be directed to files. To begin, observe the output of the following echo command which displays to the screen:

Using the `>` character, the output can be redirected to a file instead:

This command displays no output because STDOUT was sent to the file example.txt instead of the screen. You can see the new file with the output of the ls command.

The file contains the output of the echo command, which can be viewed with the cat command:

> It is important to realize that the single arrow overwrites any contents of an existing file! 

It is also possible to preserve the contents of an existing file by appending to it. Use two arrow `>>` characters to append to a file instead of overwriting it: Instead of being overwritten, the output of the echo command is added to the bottom of the file.

```bash
sysadmin@localhost:~$ echo "Line 1"
Line 1
sysadmin@localhost:~$ echo "Line 1" > example.txt
sysadmin@localhost:~$ ls
Desktop    Downloads  Pictures  Templates  example.txt
Documents  Music      Public    Videos   
sysadmin@localhost:~$ cat example.txt                                  
Line 1
sysadmin@localhost:~$ cat example.txt
Line 1
sysadmin@localhost:~$ echo "New line 1" > example.txt
sysadmin@localhost:~$ cat example.txt
New line 1
sysadmin@localhost:~$ cat example.txt
New line 1
sysadmin@localhost:~$ echo "Another line" >> example.txt
sysadmin@localhost:~$ cat example.txt
New line 1
Another line
```

### 10.3.2 STDERR

STDERR can be redirected similarly to STDOUT. When using the arrow character to redirect, stream #1 (STDOUT) is assumed unless another stream is specified. Thus, stream #2 must be specified when redirecting STDERR by placing the number 2 preceding the arrow > character.

To demonstrate redirecting STDERR, first observe the following command which produces an error because the specified directory does not exist:

Note that there is nothing in the example below that implies that the output is STDERR. The output is clearly an error message, but how could you tell that it is being sent to STDERR? One easy way to 
determine this is to redirect STDOUT:

In the example below, STDOUT was redirected to the output.txt file. So, the output that is displayed can't be STDOUT because it would have been placed in the output.txt file instead of the terminal. Because all command output goes either to STDOUT or STDERR, the output displayed below must be STDERR.

In the example, the 2> indicates that all error messages should be sent to the file error.txt, which can be confirmed using the cat command:

```bash
sysadmin@localhost:~$ ls /fake
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ ls /fake > output.txt
ls: cannot access /fake: No such file or directory
# The STDERR output of a command can be sent to a file:
sysadmin@localhost:~$ ls /fake 2> error.txt
sysadmin@localhost:~$ cat error.txt
ls: cannot access /fake: No such file or directory
```

### 10.3.3 Redirecting Multiple Streams

It is possible to direct both the STDOUT and STDERR of a command at the same time. The following command produces both STDOUT and STDERR because one of the specified directories exists and the other does not:

- If only the STDOUT is sent to a file, STDERR is still printed to the screen:
- If only the STDERR is sent to a file, STDOUT is still printed to the screen:
- Both STDOUT and STDERR can be sent to a file by using the ampersand & character in front of the arrow > character. The &> character set means both 1> and 2>:

> Note that when you use &>, the output appears in the file with all of the STDERR messages at the top and all of the STDOUT messages below all STDERR messages:

```bash
sysadmin@localhost:~$ ls /fake /etc/ppp
ls: cannot access /fake: No such file or directory
/etc/ppp:
ip-down.d  ip-up.d
sysadmin@localhost:~$ ls /fake /etc/ppp > example.txt
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ cat example.txt
/etc/ppp:
ip-down.d
ip-up.d
sysadmin@localhost:~$ ls /fake /etc/ppp 2> error.txt
/etc/ppp:
ip-down.d
ip-up.d
sysadmin@localhost:~$ cat error.txt
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ ls /fake /etc/ppp &> all.txt
sysadmin@localhost:~$ cat all.txt
ls: cannot access /fake: No such file or directory
/etc/ppp:
ip-down.d
ip-up.d
sysadmin@localhost:~$ ls /fake /etc/ppp /junk /etc/sound &> all.txt
sysadmin@localhost:~$ cat all.txt
ls: cannot access '/fake': No such file or directory
ls: cannot access '/junk': No such file or directory
ls: cannot access '/etc/sound': No such file or directory
/etc/ppp:
ip-down.d
ip-up.d
```

If you don't want STDERR and STDOUT to both go to the same file, they can be redirected to different files by using both > and 2>. For example, to direct STDOUT to example.txt and STDERR to error.txt execute the following: (order doesn't matter)

```bash
sysadmin@localhost:~$ ls /fake /etc/ppp > example.txt 2> error.txt
sysadmin@localhost:~$ cat error.txt
ls: cannot access /fake: No such file or directory
sysadmin@localhost:~$ cat example.txt
/etc/ppp:
ip-down.d
ip-up.d
```

### 10.3.4 STDIN

The concept of redirecting STDIN is a difficult one because it is more difficult to understand why you would want to redirect STDIN. With STDOUT and STDERR, their purpose is straightforward; sometimes it is helpful to store the output into a file for future use.

Most Linux users end up redirecting STDOUT routinely, STDERR on occasion, and STDIN very rarely.

There are very few commands that require you to redirect STDIN because with most commands if you want to read data from a file into a command, you can specify the filename as an argument to the command.

For some commands, if you don't specify a filename as an argument, they revert to using STDIN to get data. For example, consider the following cat command:

```bash
sysadmin@localhost:~$ cat
hello
hello‌⁠​​⁠​ 
how are you?
how are you?
goodbye
goodbye
```
Note: If you do attempt the cat command without arguments, kill the process and return to the prompt by using Ctrl+C.

In the preceding example, the cat command isn't provided a filename as an argument. So, it asks for the data to display on the screen from STDIN. The user types hello, and then the cat command displays hello on the screen. While this is mildly entertaining, it isn’t particularly useful.

However, if the output of the cat command were redirected to a file, then this method could be used either to add text to an existing file or to place text into a new file.

```bash
henridebel@DESKTOP-JRH2IMI:/mnt/f$ cat > example.txt
hello world
^C
henridebel@DESKTOP-JRH2IMI:/mnt/f$ cat example.txt 
hello world
```

While the previous example demonstrates another advantage of redirecting STDOUT, it doesn't address why or how STDIN can be directed. 

`tr`. This command takes a set of characters and translates them into another set of characters.

For example, to capitalize a line of text use the tr command as follows:

```bash
sysadmin@localhost:~$ tr 'a-z' 'A-Z'
watch how this works
WATCH HOW THIS WORKS
sysadmin@localhost:~$ cat example.txt
/etc/ppp:
ip-down.d
ip-up.d
sysadmin@localhost:~$ tr 'a-z' 'A-Z' example.txt
tr: extra operand `example.txt'
Try `tr --help' for more information
```

The tr command took the STDIN from the keyboard and converted all lower-case letters before sending STDOUT to the screen.

It would seem that a better use of the tr command would be to perform translation on a file, not keyboard input. However, the tr command does not support file name arguments:

It is possible, however, to tell the shell to get STDIN from a file instead of from the keyboard by using the `<` character:

Most commands do accept file names as arguments, so this use case is relatively rare. However, for those that do not, this method could be used to have the shell read from the file instead of relying on the command to have this ability.

One last note to save the resulting output, redirect it into another file:

```bash
sysadmin@localhost:~$ tr 'a-z' 'A-Z' < example.txt
/ETC/PPP:
IP-DOWN.D
IP-UP.D
sysadmin@localhost:~$ tr 'a-z' 'A-Z' < example.txt > newexample.txt
sysadmin@localhost:~$ cat newexample.txt
/ETC/PPP:
IP-DOWN.D
IP-UP.D
```

## 10.4 Sorting Files or Input

The sort command can be used to rearrange the lines of files or input in either dictionary or numeric order. The following example creates a small file, using the head command to grab the first 5 lines of the /etc/passwd file and send the output to a file called mypasswd.


```bash
sysadmin@localhost:~$ head -5 /etc/passwd > mypasswd
sysadmin@localhost:~$ cat mypasswd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
Now we will sort the mypasswd file:
sysadmin@localhost:~$ sort mypasswd
bin:x:2:2:bin:/bin:/usr/sbin/nologin
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
sys:x:3:3:sys:/dev:/usr/sbin/nologin
```

the `sort` command has arranged the lines of the file in alphabetical order. Compare this output to the output of the previous cat command.

### 10.4.1 Fields and Sort Options

The sort command can rearrange the output based on the contents of one or more fields. Fields are determined by a **field delimiter** contained on each line. In computing, a delimiter is a character that separates a string of text or data --> it defaults to whitespace, like spaces or tabs.

The following command can be used to sort the third field of the mypasswd file numerically. Three options are used to achieve this sort:

Option | Function : 
- t | The -t option specifies the field delimiter. If the file or input is separated by a delimiter other than whitespace, for example a comma or colon, the -t option will allow for another field separator to be specified as an argument. (The mypasswd file used in the previous example uses a colon : character as a delimiter to separate the fields, so the following example uses the -t: option.)
- k3 | The -k option specifies the field number. To specify which field to sort by, use the -k option with an argument to indicate the field number, starting with 1 for the first field. (The following example uses the -k3 option to sort by the third field.)
- n	| This option specifies the sort type. (The third field in the mypasswd file contains numbers, so the -n option is used to perform a numeric sort.)
- r | which is used to perform a reverse sort. 

Lastly, you may want to perform more complex sorts, such as sorting by a primary field and then by a secondary field. For example, consider the following comma-separated value file, a file where the comma character is the field delimiter: (To sort first by the operating system (field #2) and then year (field #1) and then by last name (field #3))

```bash
sysadmin@localhost:~$ sort -t: -n -k3 mypasswd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
sysadmin@localhost:~$ sort -t: -n -r -k3 mypasswd
sync:x:4:65534:sync:/bin:/bin/sync 
sys:x:3:3:sys:/dev:/usr/sbin/nologin  
bin:x:2:2:bin:/bin:/usr/sbin/nologin  
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
root:x:0:0:root:/root:/bin/bash   
sysadmin@localhost:~$ sort -t, -k2 -k1n -k3 os.csv
1991,Linux,Torvalds
1987,Minix,Tanenbaum
1970,Unix,Richie
1970,Unix,Thompson
```

The following table breaks down the options used in the previous example:

Option	Function
-t,	Specifies the comma character as the field delimiter
-k2	Sort by field #2
-k1n	Numerically sort by field #1
-k3	Sort by field #3


## 10.5 Viewing File Statistics 

The `wc` command provides the number of lines, words and bytes (1 byte = 1 character in a text file) for a file, and a total line count if more than one file is specified. --> By default, the wc command allows for up to three statistics to be printed for each file provided, as well as the total of these statistics if more than one filename is provided:

Number of lines
Number of words
Number of bytes
File name

- l option to show just the number of lines
- w option to show just the number of words
- c option to show just the number of bytes, or any combination of these options.

The wc command can be useful for counting the number of lines output by some other command through a pipe. For example, if you wanted to know the total number of files in the /etc directory, pipe the output of ls to wc and count only the number of lines:


```bash
sysadmin@localhost:~$ wc /etc/passwd /etc/passwd-
  35   56 1710 /etc/passwd
  34   55 1665 /etc/passwd-
  69  111 3375 total                                                      
The output of the previous example has four columns:
sysadmin@localhost:~$ ls /etc/ | wc -l
142
```

## 10.6 Filter File Sections

The `cut` command 
- extract columns of text from a file or standard input. 
- It’s primarily used for working with delimited database files. **delimited files** are files that contain columns separated by a delimiter. These files are very common on Linux systems. --> By default, the cut command expects its input to be separated by the tab character

- the `-d` option can specify alternative delimiters such as the colon or comma.
- the `-f` option can specify which fields to display, either as a hyphenated range or a comma-separated list.
- the `-c` option extract columns of text based upon character position , useful when working with fixed-width database files or command outputs.

In the following example, the first, fifth, sixth and seventh fields from the mypasswd database file are displayed:

For example, the fields of the ls -l command are always in the same character positions. The following will display just the file type (character 1), permissions (characters 2-10), a space (character 11), and filename (characters 50+):

```bash
sysadmin@localhost:~$ cut -d: -f1,5-7 mypasswd
root:root:/root:/bin/bash
daemon:daemon:/usr/sbin:/usr/sbin/nologin
bin:bin:/bin:/usr/sbin/nologin
sys:sys:/dev:/usr/sbin/nologin
sync:sync:/bin:/bin/sync
sysadmin@localhost:~$ ls -l | cut -c1-11,50-
total 44
drwxr-xr-x Desktop
drwxr-xr-x Documents
drwxr-xr-x Downloads
drwxr-xr-x Music
drwxr-xr-x Pictures
drwxr-xr-x Public
drwxr-xr-x Templates
drwxr-xr-x Videos
-rw-rw-r-- all.txt
-rw-rw-r-- example.txt
-rw-rw-r-- mypasswd
-rw-rw-r-- new.txt
```

## 10.7 Filter File Contents

The grep command can be used to filter lines in a file or the output of another command that matches a specified pattern. That pattern can be as simple as the exact text that you want to match or it can be much more advanced through the use of regular expressions.

For example, to find all the users who can log in to the system with the BASH shell, the grep command can be used to filter the lines from the /etc/passwd file for the lines containing the pattern bash:

To make it easier to see what exactly is matched, use the --color option. This option will highlight the matched items in red:

> Note: On our virtual machines, the grep command is aliased to include the --color option automatically.In some cases 

- The -c option provides a count of how many lines match:
- The -n option to the grep command will display original line numbers. To display all lines and their line numbers in the /etc/passwd file which contain the pattern bash: When viewing the output from the grep command, it can be hard to determine the original line numbers. This information can be useful when going back into the file (perhaps to edit the file) to quickly find one of the matched lines.
- The -v option inverts the match, outputting all lines that do not contain the pattern. To display all lines not containing nologin in the /etc/passwd file:
- The -i option ignores the case (capitalization) distinctions. The following searches for the pattern the in newhome.txt, allowing each character to be uppercase or lowercase:
- The -w option only returns lines which contain matches that form whole words. To be a word, the character string must be preceded and followed by a non-word character. Word characters include letters, digits, and the underscore character.

  
```bash
sysadmin@localhost:~$ grep --color bash /etc/passwd
root:x:0:0:root:/root:/bin/bash
sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash
sysadmin@localhost:~$ grep -c bash /etc/passwd
2
sysadmin@localhost:~$ grep -n bash /etc/passwd                          
1:root:x:0:0:root:/root:/bin/bash                                       
27:sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bashs
sysadmin@localhost:~$ grep -v nologin /etc/passwd
root:x:0:0:root:/root:/bin/bash
sync:x:4:65534:sync:/bin:/bin/sync
operator:x:1000:37::/root:/bin/sh
sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$ grep -i the newhome.txt
**The**re are three bathrooms.
Beware of **the** ghost in **the** bedroom.
**The** kitchen is open for entertaining.
Caution **the** spirits dont like guests.
sysadmin@localhost:~/Documents$ grep are newhome.txt
There **are** three bathrooms.
Bew**are** of the ghost in the bedroom.
sysadmin@localhost:~/Documents$ grep -w are newhome.txt
There **are** three bathrooms.
```

## 10.8 Basic Regular Expressions

Regular expressions, also referred to as regex, are a collection of normal and special characters that are used to find simple or complex patterns, respectively, in files. These characters are characters that are used to perform a particular matching function in a search.

Normal characters are alphanumeric characters which match themselves. For example, an a would match an a. Special characters have special meanings when used within patterns by commands like the grep command. They behave in a more complex manner and do not match themselves.

There are both Basic Regular Expressions (available to a wide variety of Linux commands) and Extended Regular Expressions (available to more advanced Linux commands). Basic Regular Expressions include the following:

Character | Matches
- `.` | Any single character
- `[]` | A list or range of characters to match one character
  - If the first character within the brackets is the caret ^, it means any character not in the list
- `*` | The previous character repeated zero or more times
- `^` | If the first character in the pattern, the pattern must be at the beginning of the line to match, otherwise just a literal ^ character
- `$` | If the last character in the pattern, the pattern must be at the end of the line to match, otherwise just a literal $ character
  
> The grep command is just one of the many commands that support regular expressions. Some other commands include the more and less commands. While some of the regular expressions are unnecessarily quoted with single quotes, it is good practice to use single quotes around regular expressions to prevent the shell from trying to interpret special meaning from them.

### 10.8.1 The Period . Character

One of the most useful expressions is the period . character. It matches any character except for the new line character. Consider the unfiltered contents of the ~/Documents/red.txt file

- The pattern r..f would find any line that contained the letter r followed by exactly two characters and then the letter f:
- The line does not have to be an exact match, it simply must contain the pattern, as seen here when r..t is searched for in the /etc/passwd file:
- The period character can be used any number of times. To find all words that have at least four characters, the following pattern can be used:
  
```bash
sysadmin@localhost:~/Documents$ cat red.txt
red
reef
rot
reeed
rd
rod
roof
sysadmin@localhost:~/Documents$ grep 'r..f' red.txt
reef
roof
sysadmin@localhost:~/Documents$ grep 'r..t' /etc/passwd
**root**:x:0:0:**root**:/**root**:/bin/bash
operator:x:1000:37::/**root**:
sysadmin@localhost:~/Documents$ grep '....' red.txt
reef
reeed
roof
reed
root
reel
```

### 10.8.2 The Bracket [ ] Characters

When using the . character, any possible character could match it. In some cases, you want to specify exactly which characters you want to match, such as a lowercase alphabet character or a number character.

The square brackets [ ] match a single character from the list or range of possible characters contained within the brackets. For example, given the profile.txt file:

To find all the lines in profile.txt which have a number in them, use the pattern [0123456789] or [0-9]:

Note that each possible character can be listed out [abcd] or provided as a range [a-d], as long as the range is in the correct order. For example, [d-a] wouldn't work because it isn't a valid range:

The range is specified by a standard called the ASCII table. This table is a collection of all printable characters in a specific order. You can see the ASCII table with the ascii command. A small sample:

      041  33  21  !                                 141   97  61  a 
      042  34  22  “                                 142   98  62  b
      043  35  23  #                                 143   99  63  c
      044  36  24  $                                 144   100 64  d
      045  37  25  %                                 145   101 65  e
      046  38  26  &                                 146   102 66  f

The octal value of a is 141 and the numeric value of d is 144. The numeric value of a is smaller than the numeric value of d; therefore the range a-d is a valid range.

What about exempting characters?, For instance, to match a character that can be anything except an x, y or z? It would be inefficient to provide a set with all of the characters except x, y or z.

To match a character that is not one of the listed characters, start the set with a `^` symbol. To find all the lines which contain any non-numeric characters, insert a ^ as the first character inside the brackets. This character negates the characters listed:

```bash
sysadmin@localhost:~/Documents$ cat profile.txt
Hello my name is Joe.
I am 37 years old.
3121991
My favorite food is avocados.
I have 2 dogs.
123456789101112
sysadmin@localhost:~/Documents$ grep '[0-9]' profile.txt
I am 37 years old.
3121991
I have 2 dogs.
123456789101112
sysadmin@localhost:~/Documents$ grep '[d-a]' profile.txt
grep: Invalid range end
sysadmin@localhost:~/Documents$ grep '[^0-9]' profile.txt
Hello my name is Joe.
I am 37 years old.
My favorite food is avocados.
I have 2 dogs.
Consider This
```

> Do not mistake [^0-9] to match lines which do not contain numbers. It actually matches lines which contain non-numbers. Look at the original file to see the difference. The third and sixth lines only contain numbers; they do not contain non-numbers, so those lines do not match.

### 10.8.3 The Asterisk * Character

The asterisk `*` character is used to match zero or more occurrences of a character or pattern preceding it. For example, e* would match zero or more occurrences of the letter e:

It is also possible to match zero or more occurrences of a list of characters by utilizing the square brackets. The pattern [oe]* used in the following example matches zero or more occurrences of the o character or the e character:


When used with only one other character, * isn't very helpful. Any of the following patterns would match every string or line in the file: '.*' 'e*' 'b*' 'z*' because the asterisk * character can match zero occurrences of a pattern.

To make the asterisk character useful, it is necessary to create a pattern which includes more than just the one character preceding it. For example, the results below can be refined by adding another e to make the pattern ee* effectively matching every line which contains at least one e.


```
sysadmin@localhost:~/Documents$ cat red.txt
red
reef
rot
reeed
rd
rod
roof
reed
root
reel
read
sysadmin@localhost:~/Documents$ grep 're*d' red.txt
red
reeed
rd
reed
sysadmin@localhost:~/Documents$ grep 'r[oe]*d' red.txt
red
reeed
rd
rod
reed
sysadmin@localhost:~/Documents$ grep 'z*' red.txt
red
reef
rot
reeed
rd
rod
roof
reed
root
reel
read
sysadmin@localhost:~/Documents$ grep 'e*' red.txt
red
reef
rot
reeed
rd
rod
roof
reed
root
reel
sysadmin@localhost:~/Documents$ grep 'ee*' red.txt
red
reef
reeed
reed
reel
read
```

### 10.8.4 Anchor Characters

When performing a pattern match, the match could occur anywhere on the line. Anchor characters are one of the ways regular expressions can be used to narrow down search results. They specify whether the match occurs at the beginning of the line or the end of the line.

The caret (circumflex) `^` character is used to ensure that a pattern appears at the beginning of the line. For example, to find all lines in /etc/passwd that start with root use the pattern ^root. Note that ^ must be the first character in the pattern to be effective:

The second anchor character `$` can be used to ensure a pattern appears at the end of the line, thereby effectively reducing the search results. To find the lines that end with an r in the alpha-first.txt file, use the pattern r$:

Again, the position of this character is important. The $ must be the last character in the pattern to be effective as an anchor.

```bash
sysadmin@localhost:~/Documents$ grep 'root' /etc/passwd
root:x:0:0:root:/root:/bin/bash
operator:x:1000:37::/root:
sysadmin@localhost:~/Documents$ grep '^root' /etc/passwd
root:x:0:0:root:/root:/bin/bash
sysadmin@localhost:~/Documents$ cat alpha-first.txt
A is for Animal
B is for Bear
C is for Cat
D is for Dog
E is for Elephant
F is for Flower
sysadmin@localhost:~/Documents$ grep 'r$' alpha-first.txt
B is for Bear
F is for Flower
```

### 10.8.5 The Backslash \ Character

In some cases, you may want to match a character that happens to be a special regular expression character. For example, consider the following:

In the output of the grep command below, the search for re* matched every line which contained an r followed by zero or more of the letter e. To look for an actual asterisk * character, place a backslash \ character before the asterisk * character:

 ```bash
sysadmin@localhost:~/Documents$ cat newhome.txt
Thanks for purchasing your new home!!
**Warning** it may be haunted.
There are three bathrooms.
**Beware** of the ghost in the bedroom.
The kitchen is open for entertaining.
**Caution** the spirits dont like guests.
Good luck!!!
sysadmin@localhost:~/Documents$ grep 're*' newhome.txt
Thanks for purchasing your new home!!
**Warning** it may be haunted.
There are three bathrooms.
**Beware** of the ghost in the bedroom.
The kitchen is open for entertaining.
**Caution** the spirits dont like guests.
sysadmin@localhost:~/Documents$ grep 're\*' newhome.txt
**Beware** of the ghost in the bedroom.
```

### 10.8.6 Extended Regular Expressions

The use of extended regular expressions often requires a special option be provided to the command to recognize them. 
- there is a command called egrep, which is similar to grep, but can understand extended regular expressions. 
- the egrep command is deprecated in favor of using grep with the -E option.

The following regular expressions are considered extended:

Character | Meaning
- `?` | Matches previous character zero or one time, so it is an optional character
- `+`	| Matches previous character repeated one or more times
- `|`	| Alternation or like a logical "or" operator

To match colo followed by zero or one u character followed by an r character:
To match one or more e characters:
To match either gray or grey:

```bash
sysadmin@localhost:~/Documents$ grep -E 'colou?r' spelling.txt
American English: Do you consider gray to be a color or a shade?
British English: Do you consider grey to be a colour or a shade?
sysadmin@localhost:~/Documents$ grep -E 'e+' red.txt
red
reef
reeed
reed
reel
read                     
sysadmin@localhost:~/Documents$ grep -E 'gray|grey' spelling.txt
American English: Do you consider gray to be a color or a shade?
British English: Do you consider grey to be a colour or a shade?
```



















