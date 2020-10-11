# Chapter 5 - Command Line Skills

## 5.2 Shell

> Once a user has entered a command the terminal then accepts what the user has typed and passes it to a shell.

**shell** is the command line interpreter that translates commands entered by a user into actions to be performed by the operating system. 
- If output is produced by the command, then text is displayed in the terminal.
- If problems with the command are encountered, an error message is displayed.

> The Linux environment allows the use of many different shells, some of which have been around for many years. The most commonly-used shell for Linux distributions is called the **Bash** shell.

The Bash shell many popular features :

- **Scripting:** The ability to place commands in a file and then interpret (effectively use Bash to execute the contents of) the file, resulting in all of the commands being executed. This feature also has some programming features, such as conditional statements and the ability to create functions (AKA subroutines).
- **Aliases:** The ability to create short nicknames for longer commands.
- **Variables:** Used to store information for the Bash shell and for the user. These variables can be used to modify how commands and features work as well as provide vital system information.



**prompt** : When a terminal application is run, and a shell appears, displaying an important part of the interface—the prompt. 
- there to indicate that commands can be run
- conveys useful information to the user. 

> The structure of the prompt may vary between distributions, but typically contains information about the user and the system. Below is a common prompt structure:

```
sysadmin@localhost:~$
```

The prompt shown contains the following information:
1. **User Name:**
2. **System Name:**
3. **Current Directory:**

> The `~` symbol is used as shorthand for the user's home directory. Typically the home directory for the user is under the `/home` directory and named after the user account name; for example, `/home/sysadmin`.

## 5.3 Commands

deifnition :  a software program that, when executed on the CLI, performs an action on the computer.

```bash
sysadmin@localhost:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

Many commands can be used by themselves with no further input. Some commands require additional input to run correctly. This additional input comes in two forms:
- options
- arguments.

The typical format for a command is as follows:

```bash
command [options] [arguments]
```
- **Options** are used to modify the behavior of a command 
- **arguments** are used to provide additional information (such as a filename or a username). 

> Each option and argument is normally separated by a space, although options can often be combined.

## 5.3.1 Arguments

An argument can be used to specify something for the command to act upon. 

👨‍💻 `ls` command : with a directory name lists the contents of that directory.

```
sysadmin@localhost:~$ ls /etc/ppp                                 
ip-down.d  ip-up.d                                                
```

- `ls` command also accepts multiple arguments. To list the contents of both the `/etc/ppp` and `/etc/ssh` directories, pass them both as arguments:

```
sysadmin@localhost:~$ ls /etc/ppp /etc/ssh         
/etc/ppp:                       
ip-down.d  ip-up.d                                  
/etc/ssh:                                                         
moduli               ssh_host_dsa_key.pub     ssh_host_rsa_key      sshd_configssh_config
ssh_host_ecdsa_key   ssh_host_rsa_key.pub         
ssh_host_dsa_key     ssh_host_ecdsa_key.pub   ssh_import_id            
```

## 5.3.2 Options

options expand or modify the way a command behaves. 

eg. using the `-l` option for long of the `ls` command results in a long listing, providing additional information about the files that are listed, such as the permissions, the size of the file and other information:

```bash
sysadmin@localhost:~$ ls -l                                       
total 0
drwxr-xr-x 1 sysadmin sysadmin 0 Jan 29  20:13 Desktop             
drwxr-xr-x 1 sysadmin sysadmin 0 Jan 29  20:13 Documents           
drwxr-xr-x 1 sysadmin sysadmin 0 Jan 29  20:13 Downloads           
```

👨‍💻 `-r` option for reverse : prints the results in reverse alphabetical order.

```bash
sysadmin@localhost:~$ ls -r
Videos  Templates  Public  Pictures  Music  Downloads  Documents  Desktop
```

In most cases, options can be used in conjunction with other options. They can be given

- separate options, as in `-l -r`, 
- combined, as in `-lr`. 

```bash
sysadmin@localhost:~$ ls -lr                                                    
total 32                                                                        
drwxr-xr-x 2 sysadmin sysadmin 4096 Oct 31 20:13 Videos                         
drwxr-xr-x 2 sysadmin sysadmin 4096 Oct 31 20:13 Templates                      
drwxr-xr-x 2 sysadmin sysadmin 4096 Oct 31 20:13 Public                         
```

The order of the combined options isn't important. The output of all of these examples would be the same:

```bash
ls -l -r
ls -rl
ls -lr
```

By default the `-l` option of the `ls` command displays files sizes in bytes:

```bash
sysadmin@localhost:~$ ls -l /usr/bin/perl                         
-rwxr-xr-x 2 root root 10376 Feb  4  2018 /usr/bin/perl         
```

👨‍💻 `-h` option : file sizes will be displayed in human-readable format:

```bash
sysadmin@localhost:~$ ls -lh /usr/bin/perl                        
-rwxr-xr-x 2 root root 11K Feb  4  2018 /usr/bin/perl
```

Options are mostly single letters but sometimes they are words or phrases. Typically, older = single letters | newer = complete words for options. 

- Single-letter options are preceded by a single dash `-` character, like the `-h` option. 
- Full-word options are preceded by two dash `--` characters.

eg. The `-h` option also has an equivalent full-word form; the `--human-readable` option.

## 5.3.3 History

When a command is executed in the terminal, it is stored in a history list.

- **Up Arrow ↑** key displays the previous command on the prompt line.
- When the desired command is located, the **Left Arrow ←** and **Right Arrow →** keys can position the cursor for editing. 
- Other useful keys for editing include the **Home**, **End**, **Backspace** and **Delete** keys.

👨‍💻  `history` command: to view history of commands

```bash
sysadmin@localhost:~$ date                                       
Wed Dec 12 04:28:12 UTC 2018                                   
sysadmin@localhost:~$ ls                                           
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos       
sysadmin@localhost:~$ cal 5 2030                                  
     May 2030                                                                  
Su Mo Tu We Th Fr Sa                                                            
          1  2  3  4  ...                                                                                                                 
sysadmin@localhost:~$ history                                   
    1  date                                                       
    2  ls                                                      
    3  cal 5 2030                                             
    4  history                                                 
```

If the desired command is in the list that the `history` command generates

👨‍💻  `!` character and then the number next to the command to execute a command listed in history

ef. to execute the `cal` command again:

```bash
sysadmin@localhost:~$ history                                     
    1  date                                                      
    2  ls                                                         
    3  cal 5 2030                                                 
    4  history                                                    
sysadmin@localhost:~$ !3                                        
cal 5 2030                                                        
     May 2030                                                                  
Su Mo Tu We Th Fr Sa                                                            
          1  2  3  4  ...                                                         
```

👨‍💻  If the `history` command is passed a number as an argument, it outputs that number of previous commands from the history list. 

```bash
sysadmin@localhost:~$ history 3
    6  date                                                                     
    7  ls /home                                                                   
    8  history 3
```

👨‍💻  To execute the nth command from the bottom of the history list, type `!-n` and hit Enter.

```bash
sysadmin@localhost:~$ !-3                                                       
date                                                                            
Wed Dec 12 04:31:55 UTC 2018 
```

👨‍💻  To execute the most recent command type `!!` and hit **Enter**:

```bash
sysadmin@localhost:~$ date                                                      
Wed Dec 12 04:32:36 UTC 2018                                                    
sysadmin@localhost:~$ !!                                                        
date
Wed Dec 12 04:32:38 UTC 2018
```

👨‍💻  To execute the most recent iteration of a specific command, type `!` followed by the name of the command and hit **Enter**. For example, to execute the most recent `ls` command:

```bash
sysadmin@localhost:~$ !ls                                                       
ls /home                                                                        
sysadmin 
```

## 5.4 Variables

A variable is a feature that allows the user or the shell to store data. Variables are given names and stored temporarily in memory. 

There are two types of variables used in the Bash shell: 
- local
- environment

## 5.4.1 Local Variables

- exist only in the current shell
- cannot affect other commands or applications. 

* When the user closes a terminal window or shell, all of the variables are lost. 


```bash
variable=value
```

- The following example creates a local variable named `variable1` and assigns it a value of `Something`:
- `echo` command is used to display output in the terminal. To display the value of the variable, use a dollar sign `$` character followed by the variable name as an argument to the `echo` command:

```bash
sysadmin@localhost:~$ variable1='Something'
sysadmin@localhost:~$ echo $variable1                                   
Something
```

## 5.4.2 Environment Variables

also called **global variables**, are available system-wide, in all shells used by Bash when interpreting commands and performing tasks. The system automatically recreates environment variables when a new shell is opened. Examples include the `PATH`, `HOME`, and `HISTSIZE` variables. 

- The `HISTSIZE` variable defines how many previous commands to store in the history list. The command in the example below displays the value of the `HISTSIZE` variable:

```bash
sysadmin@localhost:~$ echo $HISTSIZE
1000
```

To modify the value of an existing variable, use the assignment expression:

```bash
sysadmin@localhost:~$ HISTSIZE=500                                            
sysadmin@localhost:~$ echo $HISTSIZE                              
500  
```

👨‍💻 the `env` command outputs a list of the environment variables. 

Because the output of the `env` command can be quite long, the following examples use a text search to filter that output. In a previous example `variable1` was created as a local variable, so the following search in the environment variables results in no output:

```bash
sysadmin@localhost:~$ env | grep variable1                              
```

- 👨‍💻 The pipe `|` character passes the output of the `env` command to the `grep` command, which searches the output.
- 👨‍💻 The `export` command is used to turn a local variable into an environment variable.

```bash
export variable
```

- After exporting `variable1`, it is now an environment variable. It is now found in the search through the environment variables:
- The `export` command can also be used to make a variable an environment variable upon its creation by using the assignment expression as the argument:
- exported variables can removed by using the `unset` command
```bash
sysadmin@localhost:~$ export variable1                                  
sysadmin@localhost:~$ env | grep variable1
variable1=Something
sysadmin@localhost:~$ export variable2='Else'                           
sysadmin@localhost:~$ env | grep variable2                             
variable2=Else
sysadmin@localhost:~$ unset variable2    
sysadmin@localhost:~$ echo $variable2 

```

## 5.4.3 Path Variable

One of the most important Bash shell variables to understand is the `PATH` variable. 

- It contains a list that defines which directories the shell looks in to find commands.
> If a valid command is entered and the shell returns a "command not found" error, it is because the Bash shell was unable to locate a command in any of the directories included in the path. 
- The following command displays the path of the current shell: `echo $PATH`

```bash
sysadmin@localhost:~$ echo $PATH                                        
/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Each directory in the list is separated by a colon `:` character. Based on the preceding output, the path contains the following directories. The shell will check the directories in the order they are listed:
/home/sysadmin/bin
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin
/usr/games

sysadmin@localhost:~$ zed                                              
-bash: zed: command not found 
```

Each of these directories is represented by a path. A path is a list of directories separated by the / character. If you think of the filesystem as a map, paths are the directory addresses, which include step-by-step navigation directions; they can be used to indicate the location of any file within the filesystem. For example, `/home/sysadmin` is a path to the home directory:

![img](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/home_directory.png)

‌⁠⁠ If custom software is installed on the system it may be necessary to modify the `PATH` to make it easier to execute these commands. 
👨‍💻 add to the path ​eg, the following will add and verify the `/usr/bin/custom` directory to the `PATH` variable:

```bash
sysadmin@localhost:~$ PATH=/usr/bin/custom:$PATH                        
sysadmin@localhost:~$ echo $PATH                                       
/usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games                                              
```

> When updating the `PATH` variable **always include the current path**, so as not to lose access to commands located in those directories. This can be accomplished by appending `$PATH` to the value in the assignment expression. Recall that a variable name preceded by a dollar sign represents the value of the variable.

## 5.5 Command Types

👨‍💻 One way to learn more about a command is to look at where it comes from. The `type` command can be used to determine information about command type.

```bash
type command
```

There are several different sources of commands within the shell of your CLI including

- internal commands
- external commands
- aliases
- functions.


```bash
sysadmin@localhost:~$ type cd                                     
cd is a shell builtin
sysadmin@localhost:~$ type cal                                      
cal is /usr/bin/cal
sysadmin@localhost:~$ type ll                                     
ll is aliased to `ls -alF`
```

**Internal Commands / built-in commands**

internal commands are built into the shell itself. A good example is the `cd` (change directory) command as it is part of the Bash shell. When a user types the `cd` command, the Bash shell is already executing and knows how to interpret it, requiring no additional programs to be started.

**External Commands**

External commands are stored in files that are searched by the shell. If a user types the `ls` command, then the shell searches through the directories that are listed in the `PATH` variable to try to find a file named `ls` that it can execute.

If a command does not behave as expected or if a command is not accessible that should be, it can be beneficial to know where the shell is finding the command or which version it is using. It would be tedious to have to manually look in each directory that is listed in the `PATH` variable. 

👨‍💻 use the `which` command to display the full path to the command in question: The `which` command searches for the location of a command by searching the `PATH` variable.
- External commands can also be executed by typing the complete path to the command. For example, to execute the `ls` command:

```bash
which command
sysadmin@localhost:~$ which ls                                       
/bin/ls                                                               
sysadmin@localhost:~$ which cal                                        
/usr/bin/cal
sysadmin@localhost:~$ /bin/ls                                                   
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

> In some cases the output of the `type` command may differ significantly from the output of the `which` command:
> Using the `-a` option of the `type` command displays all locations that contain the command named:

```bash
sysadmin@localhost:~$ type echo                                     
echo is a shell builtin
sysadmin@localhost:~$ which echo                                        
/bin/echo
sysadmin@localhost:~$ type -a echo                                      
echo is a shell builtin                                                
echo is /bin/echo
```

**Aliases**

An alias can be used to map longer commands to shorter key sequences. When the shell sees an alias being executed, it substitutes the longer sequence before proceeding to interpret commands.

For example, the command `ls -l` is commonly aliased to `l` or `ll`. Because these smaller commands are easier to type, it becomes faster to run the `ls -l` command line.

👨‍💻 To determine what aliases are set on the current shell use the `alias` command:

```bash
sysadmin@localhost:~$ alias                                             
alias egrep='egrep --color=auto'                                       
alias fgrep='fgrep --color=auto'                                        
alias grep='grep --color=auto'                                          
alias l='ls -CF'                                                       
alias la='ls -A'                                                       
alias ll='ls -alF'                                                     
alias ls='ls --color=auto'
```

The aliases from the previous examples were created by **initialization files**. These files are designed to make the process of creating aliases automatic.

👨‍💻 New aliases can be created using the following format, where `name` is the name to be given the alias and `command` is the command to be executed when the alias is run.

For example, the `cal 2019` command displays the calendar for the year 2019. Suppose you end up running this command often. Instead of executing the full command each time, you can create an alias called `mycal` and run the alias, as demonstrated in the following graphic:

```bash terminal
alias name=command
sysadmin@localhost:~$ alias mycal="cal 2019"                                    
sysadmin@localhost:~$ mycal           
```

- Once the shell is closed, the new aliases are lost. 
- each shell has its own aliases, so aliases created in one shell won’t be available in a new shell that’s opened.


> **Functions** can also be built using existing commands to either create new commands, or to override commands built-in to the shell or commands stored in files. Aliases and functions are normally loaded from the **initialization files** when the shell first starts.

## 5.6 Quoting

Quotation marks are used throughout Linux administration and most computer programming languages to let the system know that the information contained within the quotation marks should either be ignored or treated in a way that is very different than it would normally be treated. There are three types of quotes that have special significance to the Bash shell: 

- double quotes `"`
- single quotes `'`
- back quotes `

Each set of quotes alerts the shell not to treat the text within the quotes in the normal way.

## 5.6.1 Double Quotes

- Double quotes stop the shell from interpreting some metacharacters (special characters), including glob characters.
- **Glob characters**, also called wild cards, are symbols that have special meaning to the shell; they are interpreted by the shell itself before it attempts to run any command. Glob characters include the 
  - asterisk `*` character
  - the question `?` mark character
  - the brackets `[ ]`, among others.

```bash
sysadmin@localhost:~$ echo "The glob characters are *, ? and [ ]"      
The glob characters are *, ? and [ ]
```

Double quotes still allow for **command substitution**, **variable substitution**, and permit some other shell metacharacters that haven't been discussed yet. The following demonstration shows that the value of the `PATH` variable is still displayed:

```bash
sysadmin@localhost:~$ echo "The path is $PATH"                          
The path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/
```

## 5.6.2 Single Quotes

Single quotes prevent the shell from doing any interpreting of special characters, including globs, variables, command substitution and other metacharacters that have not been discussed yet.

```bash
sysadmin@localhost:~$ car=porsche                                     
sysadmin@localhost:~$ echo '$car'                     
$car
```

## 5.6.3 Backslash Character

There is also an alternative technique to essentially single quote a single character. Consider the following message:

```
The service costs $1 and the path is $PATH 
```

If this sentence is placed in double quotes, `$1` and `$PATH` are considered variables.

```
sysadmin@localhost:~$ echo "The service costs $1 and the path is $PATH"

‌⁠⁠The service costs  and the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games 
```

If it is placed in single quotes, `$1` and `$PATH` are not considered variables.

```
sysadmin@localhost:~$ echo 'The service costs $1 and the path is $PATH' 
The service costs $100 and the path is $PATH 
```

But what if you want to have `$PATH` treated as a variable and `$1` not?

use a backslash `\` character in front of the dollar sign `$` character to prevent the shell from interpreting it.
```bash
sysadmin@localhost:~$ echo The service costs \$1 and the path is $PATH
The service costs $1 and the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

## 5.6.4 Backquotes

Backquotes, or backticks, are used to specify a command within a command, a process called **command substitution**. 

- the same can be achieved using `$( )`

```
sysadmin@localhost:~$ date                                           
Mon Nov  4 03:35:50 UTC 2018
sysadmin@localhost:~$ echo Today is date                               
Today is date
sysadmin@localhost:~$ echo Today is `date`                         
Today is Mon Nov 4 03:40:04 UTC 2018
sysadmin@localhost:~$ echo Today is $(date)                         
Today is Mon Nov 4 03:40:04 UTC 2018
```

## 5.7 Control Statements

Control statements allow you to use multiple commands at once or run additional commands, depending on the success of a previous command. Typically these control statements are used within scripts, but they can also be used on the command line as well.

## 5.7.1 Semicolon

```
command1; command2; command3
```

The semicolon `;` character can be used to run multiple commands, one after the other. Each command runs independently and consecutively; regardless of the result of the first command, the second command runs once the first has completed, then the third and so on.

```bash
sysadmin@localhost:~$ cal 1 2030; cal 2 2030             
    January 2030                                                       
Su Mo Tu We Th Fr Sa                                                            
       1  2  3  4  5                                                            
 6  7  8  9 10 11 12                                                            
13 14 15 16 17 18 19                                                            
20 21 22 23 24 25 26                                                            
27 28 29 30 31                                                                  
                                                                                
   February 2030                                                                
Su Mo Tu We Th Fr Sa                                                            
                1  2                                                            
 3  4  5  6  7  8  9                                                            
10 11 12 13 14 15 16                                                            
17 18 19 20 21 22 23                                                            
24 25 26 27 28                                                                  
                                                                                      
```

## 5.7.2 Double Ampersand

```bash
command1 && command2
```

The double ampersand `&&` acts as a logical "and"; if the first command is successful, then the second command will also run. If the first command fails, then the second command will not run.

To better understand how this works, consider first the concept of failure and success for commands. Commands succeed when they work properly and fail when something goes wrong. For example, consider the `ls` command. The command succeeds if the given directory is accessible and fails if it isn't.

In the following example, the first command succeeds because the `/etc/ppp` directory exists and is accessible while the second command fails because there is no `/junk` directory:

```
sysadmin@localhost:~$ ls /etc/ppp                  
ip-down.d  ip-up.d           
sysadmin@localhost:~$ ls /etc/junk                             
ls: cannot access /etc/junk: No such file or directory
```

To use the success or failure of the `ls` command in conjunction with `&&` execute commands like the following. In the first example, the `echo` command is executed because the `ls` command succeeds:

```bash
sysadmin@localhost:~$ ls /etc/ppp && echo success          
ip-down.d  ip-up.d        
success                                              
```

In the second example, the `echo` command isn't executed because the `ls` command fails:

```bash
sysadmin@localhost:~$ ls /etc/junk && echo success          
ls: cannot access /etc/junk: No such file or directory
```

## 5.7.3 Double Pipe

```bash
command1 || command2
```

The double pipe `||` is a logical "or". Depending on the result of the first command, the second command will either run or be skipped.

With the double pipe, if the first command runs successfully, the second command is skipped; if the first command fails, then the second command is run. In other words, you are essentially telling the shell, "Either run this first command or the second one”.

In the following example, the `echo` command only executes if the `ls` command fails:

```bash
sysadmin@localhost:~$ ls /etc/ppp || echo failed                 
ip-down.d  ip-up.d              
sysadmin@localhost:~$ ls /etc/junk || echo failed                  
ls: cannot access /etc/junk: No such file or directory             
failed
```

## key-terms

Bash

The most commonly used shell for Linux distributions.
[Section 5.2](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.2)

PATH environment variable

Variable containing a list that defines which directories the shell looks in for commands.
[Section 5.4.3](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.4.3)

echo

Command that displays output in the terminal.
[Section 5.4.1](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.4.1)

export

Command that turns a local variable into an environment variable.
[Section 5.4.2](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.4.2)

history

Command that outputs a list of previously executed commands.
[Section 5.3.3](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.3.3)

type

Command that determines information about command type.
[Section 5.5](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.5)



# Chapter 6 - Getting Help

## 6.1 Introduction

There are thousands of commands available with many options, making the command line a powerful tool. However, with this power comes complexity. Complexity, in turn, can create confusion. As a result, knowing how to find help while working in Linux is an essential skill for any user. Referring to help provides a quick reminder of how a command works, as well as being an information resource when learning new commands.

## 6.2 Man Pages

UNIX is the operating system that Linux was modeled after. The developers of UNIX created help documents called man pages (short for manual pages).

Man pages are used to describe the features of commands. They provide a basic description of the purpose of the command, as well as details regarding available options.

## 6.2.1 Viewing Man Pages

To view a man page for a command, use the `man` command:

```
man command
```

For example, the following displays the man page for the `ls` command:

```
sysadmin@localhost:~$ man ls
```

Navigate the document using the arrow keys:

```
LS(1)                            User Commands                           LS(1)  
                                                                                
NAME                                                                            
       ls - list directory contents                                             
                                                                                
SYNOPSIS                                                                        
       ls [OPTION]... [FILE]...                                                 
                                                                                
DESCRIPTION                                                                     
       List  information  about  the FILEs (the current directory by default).  
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci-  
       fied.                                                                    
                                                                                
       Mandatory  arguments  to  long  options are mandatory for short options  
       too.                                                                     
                                                                                
       -a, --all                                                                
              do not ignore entries starting with .                             
```

👨‍💻 To exit viewing a man page, use the **Q** key.

> **Consider This**
>
> The `man` command uses a pager to display documents. Usually, this pager is the `less` command, but on some distributions, it may be the `more` command. Both are very similar in how they perform.
>
> To view the various movement commands that are available, use the **H** key while viewing a man page. This displays a help page.
>
> Pagers will be discussed in more detail later in the course.

## 6.2.2 Sections Within Man Pages

Man pages are broken into sections. Each section is designed to provide specific information about a command. While there are common sections seen in most man pages, some developers also create sections only available on specific man pages.

The following describes some of the more common sections found in man pages:

**NAME**

Provides the name of the command and a very brief description.

```
NAME                                                                            
       ls - list directory contents   
```

**SYNOPSIS**

Provides examples of how the command is executed.

```
SYNOPSIS                                                                        
       ls [OPTION]... [FILE]...   
```

The `SYNOPSIS` section of a man page can be difficult to understand but is very important because it provides a concise example of how to use the command. For example, consider the `SYNOPSIS` of the man page for the `cal` command:

```
SYNOPSIS 
     cal [-31jy] [-A number] [-B number] [-d yyyy-mm] [[month] year] 
```

The square brackets `[ ]` are used to indicate that this feature is not required to run the command. For example, `[-31jy]` means options `-3`, `-1`, `-j`, or `-y` are available, but not required for the `cal` command to function properly.

The last set of square brackets `[[month] year]` demonstrates another feature; it means a year can be specified by itself, but to specify a month the year must also be specified.

Another component of the `SYNOPSIS` that might cause some confusion can be seen in the man page of the `date` command:

```
SYNOPSIS                                                              
       date [OPTION]... [+FORMAT]                                      
       date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
```

‌⁠⁠ 

In this `SYNOPSIS` there are two syntaxes for the `date` command. The first one is used to display the date on the system while the second is used to set the date.

The ellipsis `...` following `[OPTION]` indicates that one or more of the items before it may be used.

Additionally, the `[-u|--utc|--universal]` notation means that either the `-u` option or the `--utc` option or the `--universal` option may be used. Typically this means that all three options really do the same thing, but sometimes the use of the `|` character is used to indicate that the options can't be used in combination, like a logical “or".

**DESCRIPTION**

Provides a more detailed description of the command.

```
DESCRIPTION  
       List  information  about  the FILEs (the current directory by default).  
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci-  
       fied.   
```

**OPTIONS**

Lists the options for the command as well as a description of how they are used. Often this information is found in the `DESCRIPTION` section and not in a separate `OPTIONS` section.

```
       -a, --all                                                                
              do not ignore entries starting with .  
 
       -A, --almost-all                                                         
              do not list implied . and ..                                      
                                                                                
       --author                                                                 
              with -l, print the author of each file                            
                                                                                
       -b, --escape                                                             
              print C-style escapes for nongraphic characters                   
                                                                                
       --block-size=SIZE                                                        
              scale sizes by SIZE before printing them; e.g., '--block-size=M'  
              prints sizes in units of 1,048,576 bytes; see SIZE format below   
```

**FILES**

Lists the files that are associated with the command as well as a description of how they are used. These files may be used to configure the command's more advanced features. Often this information is found in the `DESCRIPTION` section and not in a separate `FILES` section.

**AUTHOR**

Provides the name of the person who created the man page and (sometimes) how to contact the person.

```
AUTHOR                                                                          
       Written by Richard M. Stallman and David MacKenzie.
```

**REPORTING BUGS**

Provides details on how to report problems with the command.

```
REPORTING BUGS                                                                  
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>      
       Report ls translation bugs to <http://translationproject.org/team/>
```

**COPYRIGHT**

Provides basic copyright information.

```
COPYRIGHT                                                                       
       Copyright (C) 2017 Free Software Foundation, Inc.  License GPLv3+:  GNU  
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.               
       This  is  free  software:  you  are free to change and redistribute it.  
       There is NO WARRANTY, to the extent permitted by law.   
```

**SEE ALSO**

Provides you with an idea of where you can find additional information. This often includes other commands that are related to this command.

```
SEE ALSO                                                                        
       Full documentation at: <http://www.gnu.org/software/coreutils/ls>        
       or available locally via: info '(coreutils) ls invocation'  
```

## 6.2.3 Searching Man Pages

To search a man page for a term, type the `/` character followed by a search term, then hit the **Enter** key. The program searches from the current location down towards the bottom of the page to try to locate and highlight the term.

If a match is found, it will be highlighted. To move to the next match of the term, press **n**. To return to a previous match of the term, press **Shift**+**N**. If the term is not found, or upon reaching the end of the matches, the program will report `Pattern not found (press Return)`.

‌⁠⁠

![A gif depicting a user searching a man page for a keyword.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_6_1.gif)

## 6.2.4 Man Pages Categorized by Sections

Until now, we have been displaying man pages for commands. However, there are several different types of commands (user commands, system commands, and administration commands), configuration files and other features, such as libraries and kernel components, that require documentation.

As a result, there are thousands of man pages on a typical Linux distribution. To organize all of these man pages, they are categorized by sections.

By default, there are nine sections of man pages:

1. General Commands
2. System Calls
3. Library Calls
4. Special Files
5. File Formats and Conventions
6. Games
7. Miscellaneous
8. System Administration Commands
9. Kernel Routines

The `man` command searches each of these sections in order until it finds the first match. For example, if you execute the command `man cal`, the first section (General Commands) is searched for a man page called `cal`. If not found, then the second section is searched. If no man page is found after searching all sections, an error message is returned:

```
sysadmin@localhost:~$ man zed                                          
No manual entry for zed                                               
```

To determine which section a specific man page belongs to, look at the numeric value on the first line of the output of the man page. For example, the `cal` command belongs to the first section of man pages:

```
CAL(1)                    BSD General Commands Manual             CAL(1)
```

Sometimes there are man pages with the same name in different sections. In these cases, it may be necessary to specify the section of the correct man page.

For example, there is a command called `passwd` that allows you to change your password. There is also a file called `passwd` that stores account information. Both the command and the file have a man page.

The `passwd` command is a user command, so the associated man page is in the first section. The `man` command displays the man page for the `passwd` command by default:

```
sysadmin@localhost:~$ man passwd
PASSWD(1)                        User Commands                 PASSWD(1)
```

So how do you display the man page for the passwd file? First, determine in which section the man page is located. To search for man pages by name, use the `-f` option to the `man` command. It displays man pages that match, or partially match, a specific name and provide the section number and a brief description of each man page:

```
sysadmin@localhost:~$ man -f passwd                                    
passwd (5)           - the password file                              
passwd (1)           - change user password                           
passwd (1ssl)        - compute password hashes                         
```

**Note:** On most Linux distributions, the `whatis` command does the same thing as `man -f`. On those distributions, both will produce the same output.

To specify a different section, provide the number of the section as the first argument of the man command. The following command displays the passwd man page located in section 5, which is associated with the `passwd` file:

```
sysadmin@localhost:~$ man 5 passwd
PASSWD(5)                File Formats and Conversions          PASSWD(5)
```

Unfortunately, you won't always remember the exact name of the man page that you want to view. Fortunately, each man page has a short description associated with it. The `-k` option to the `man` command searches both the names and descriptions of the man pages for a keyword.

For example, to find a man page that displays how to copy directories, search for the keyword `copy`:

```
sysadmin@localhost:~$ man -k copy                                               
cp (1)               - copy files and directories                               
cpgr (8)             - copy with locking the given file to the password or gr...
cpio (1)             - copy files to and from archives                          
cppw (8)             - copy with locking the given file to the password or gr...
dd (1)               - convert and copy a file                                  
debconf-copydb (1)   - copy a debconf database                                  
install (1)          - copy files and set attributes                            
scp (1)              - secure copy (remote file copy program)                   
ssh-copy-id (1)      - use locally available keys to authorize logins on a re...
```

Recall that there are thousands of man pages, so when searching for a keyword, be as specific as possible. Using a generic word, such as "the", could result in hundreds or even thousands of results.

> **Note:** On most Linux distributions, the `apropos` command does the same thing as `man -k`. On those distributions, both produce the same output.

## 6.3 Finding Commands and Documentation

The `whatis` command (or `man -f`) returns what section a man page is stored in. This command occasionally returns unusual output, such as the following:

```
sysadmin@localhost:~$ whatis ls                                              
ls (1)               - list directory contents 
ls (lp)              - list directory contents
```

**Note**

The example above is designed to demonstrate a scenario where two commands list directory contents. The output in the example terminal above may not match the output in the VM.

Based on this output, there are two `ls` commands that list directory contents. The simple reason for this is that UNIX had two main variants, which resulted in some commands being developed "in parallel" and therefore behaving differently on different variants of UNIX. Many modern distributions of Linux include commands from both UNIX variants.

This does, however, pose a bit of a problem: when the `ls` command is typed, which command is executed?

## 6.3.1 Where Are These Commands Located?

To search for the location of a command or the man pages for a command, use the `whereis` command. This command searches for commands, source files and man pages in specific locations where these files are typically stored:

```
sysadmin@localhost:~$ whereis ls 
ls: /bin/ls /usr/share/man/man1p/ls.1.gz /usr/share/man/man1/ls.1.gz
```

Man pages are easily distinguished from commands as they are typically compressed with a program called `gzip`, resulting in a filename that ends in `.gz`. Notice there are two man pages listed above, but only one command: `/bin/ls`. This is because the `ls` command can be used with the options/features that are described by either man page. So, when learning what can be done with the `ls` command, it may be interesting to explore both man pages. Fortunately, this is more of an exception as most commands only have one man page.



## 6.3.2 Find Any File or Directory

The `whereis` command is specifically designed to find commands and man pages. While this is useful, it is often necessary to find a file or directory, not just files that are commands or man pages.

👨‍💻 To find any file or directory, use the `locate` command. This command searches a database of all files and directories that were on the system when the database was created. Typically, the command to generate this database is run nightly.

```
sysadmin@localhost:~$ locate gshadow                                   
/etc/gshadow                                                           
/etc/gshadow-                                                          
/usr/include/gshadow.h                                                
/usr/share/man/cs/man5/gshadow.5.gz                                   
/usr/share/man/da/man5/gshadow.5.gz                                                       
```

Any files created today will not be searchable with the `locate` command. If root access is available, it’s possible to update the `locate` database manually by running the `updatedb` command. Regular users cannot update the database file.

Also note that when using the `locate` command as a regular user, the output may be limited due to file permissions. If the user that is logged in doesn’t have access to a file or directory on the filesystem due to permissions, the `locate` command won't return those names. This security feature is designed to keep users from "exploring" the filesystem by using the `locate` database. The `root` user can search for any file in the `locate` database.

The output of the locate command can be quite large. When searching for a filename, such as `passwd`, the `locate` command produces every file that contains the string `passwd`, not just files named passwd.

In many cases, it is helpful to start by finding out how many files match. Do this by using the `-c` option to the `locate` command:

```
sysadmin@localhost:~$ locate -c passwd                                 
98
```

To limit the output produced by the `locate` command use the `-b` option. This option only includes listings that have the search term in the basename of the filename. The basename is the portion of the filename not including the directory names.

```
sysadmin@localhost:~$ locate -c -b passwd                              
83                                                                     
```

As you can see from the previous output, there will still be many results when the `-b` option is used. To limit the output even further, place a `\` character in front of the search term. This character limits the output to filenames that exactly match the term:

```
sysadmin@localhost:~$ locate -b "\passwd"                              
/etc/passwd                                                                     
/etc/pam.d/passwd                                                               
/usr/bin/passwd                                                                 
/usr/share/doc/passwd                                                           
/usr/share/lintian/overrides/passwd
```

## 6.4 Info Documentation

Man pages are excellent sources of information, but they do tend to have a few disadvantages. One example is that each man page is a separate document, not related to any other man page. While some man pages have a `SEE ALSO` section that may refer to other man pages, they tend to be independent sources of documentation.

The `info` command also provides documentation on operating system commands and features. The goal is slightly different from man pages: to provide a documentation resource that gives a logical organizational structure, making reading documentation easier.

All of the documentation is merged into a single "book" representing all of the documentation available. Within info documents, information is broken down into categories that work much like a table of contents in a book. Hyperlinks are provided to pages with information on individual topics for a specific command or feature.

Another advantage of info over man pages is that the writing style of info documents is typically more conducive to learning a topic. Consider man pages to be more of a reference resource and info documents to be more of a learning guide.

## 6.4.1 Viewing Info Documentation

To display the info documentation for a command, use the `info` command.

```
info command
```

For example, to display the info page of the `ls` command:

```bash
sysadmin@localhost:~$ info ls    
Next: dir invocation,  Up: Directory listing

10.1 `ls': List directory contents                                     
==================================  

    The `ls' program lists information about files (of any type, including directories).  Options and file arguments can be intermixed arbitrarily, as usual. 

    For non-option command-line arguments that are directories, by    
default `ls' lists the contents of directories, not recursively, and   
omitting files with names beginning with `.'.  For other non-option    
arguments, by default `ls' lists just the file name.  If no non-option 
argument is specified, `ls' operates on the current directory, acting  
as if it had been invoked with a single argument of `.'.                        
                                                                       
    By default, the output is sorted alphabetically, according to the  
locale settings in effect.(1) If standard output is a terminal, the    
output is in columns (sorted vertically) and control characters are    
output as question marks; otherwise, the output is listed one per line 
and control characters are output as-is.

-----Info: (coreutils)ls invocation, 57 lines --Top-----------------------------
Welcome to Info version 6.5.  Type H for help, h for tutorial.
```

This documentation is broken up into nodes, and in the example above the line highlighted in white shows it’s currently in the `ls invocation` node. The first line provides index information about the current location within the document. The next node, like the next chapter in a book, would be the `dir invocation` node. Going up one level is the `Directory listing` node.

Scrolling through the document, notice the menu for the `ls` command:

```
* Menu:                                                                         
                           
* Which files are listed::                     
* What information is listed::                 
* Sorting the output::                          
* Details about version sort::                   
* General output formatting::                    
* Formatting file timestamps::                    
* Formatting the file names::                                                   
                                         
   ---------- Footnotes ----------                                              
          
 (1) If you use a non-POSIX locale (e.g., by setting `LC_ALL' to 
`en_US'), then `ls' may produce output that is sorted differently than
you're accustomed to.  In that case, set the `LC_ALL' environment     
variable to `C'.                     
                                           
-----Info: (coreutils)ls invocation, 57 lines --Bot-----------------------------
```

The items under the menu are hyperlinks that link to nodes that describe more about the `ls` command. For example, placing the cursor on the line `* Sorting the output::` and pressing the **Enter** key, leads to a node that describes sorting the output of the `ls` command:

> Note that going into the node about sorting leads into a sub-node of the original. To go back to the previous node, use the **U** key. While **U** leads to the start of the node one level up, the **L** key returns to the same location as before entering the sorting node

## 6.4.2 Navigating Info Documents

Like the `man` command, a listing of movement commands is available by hitting the **Shift**+**H** key while reading the info documentation:

```
Basic Info command keys                                                         
                                                                                
l           Close this help window.                                             
q           Quit Info altogether.                                               
h           Invoke the Info tutorial.                                           
                                                                                
Up          Move up one line.                                                   
Down        Move down one line.                                                 
PgUp        Scroll backward one screenful.                                      
PgDn        Scroll forward one screenful.                                       
Home        Go to the beginning of this node.                                   
End         Go to the end of this node.                                         
                                                                                
TAB         Skip to the next hypertext link.                                    
RET         Follow the hypertext link under the cursor.                         
l           Go back to the last node seen in this window.                       
                                                                                
[           Go to the previous node in the document.                            
]           Go to the next node in the document.                                
p           Go to the previous node on this level.                              
n           Go to the next node on this level.                                  
u           Go up one level.                                                    
-----Info: *Info Help*, 302 lines -- Top--------------------------------------
```

Note that to close the help screen type the **L** key, which brings back the current document. To quit entirely, use the **Q** key.

## 6.4.3 Exploring Info Documentation

Instead of using info documentation to look up information about a specific command or feature, consider exploring the capabilities of Linux by reading through the info documentation. Execute the `info` command without any arguments to be taken to the top level of the documentation. This is a good starting point to explore many of the features offered:

```
File: dir,      Node: Top,      This is the top of the INFO tree.               
                                                                                
This is the Info main menu (aka directory node).                                
A few useful Info commands:                                                     
                                                                                
  'q' quits;                                                                    
  'H' lists all Info commands;                                                  
  'h' starts the Info tutorial;                                                 
  'mTexinfo RET' visits the Texinfo manual, etc.                                
                                                                                
* Menu:                                                                         
                                                                                
Basics                                                                          
* Common options: (coreutils)Common options.                                    
* Coreutils: (coreutils).       Core GNU (file, text, shell) utilities.         
* Date input formats: (coreutils)Date input formats.                            
* File permissions: (coreutils)File permissions.                                
                                Access modes.                                   
* Finding files: (find).        Operating on files matching certain criteria.   
                                                                                
C++ libraries                                                                   
* autosprintf: (autosprintf).   Support for printf format strings in C++.       
-----Info: (dir)Top, 211 lines --Top--------------------------------------------
Welcome to Info version 6.5.  Type H for help, h for tutorial. 
```

## 6.5 Additional Sources of Help

In many cases, the man pages or info documentation provide needed information in an efficient manner. However, there are other sources for help to be aware of.

## 6.5.1 Using the Help Option

Many commands will provide basic information, very similar to the `SYNOPSIS` found in man pages, by simply using the `--help` option to the command. This option is useful to learn the basic usage of a command quickly without leaving the command line:

```
sysadmin@localhost:~$  cat --help                                                
Usage: cat [OPTION]... [FILE]...                                                
Concatenate FILE(s) to standard output.                                         
                                                                                
With no FILE, or when FILE is -, read standard input.                           
                                                                                
  -A, --show-all           equivalent to -vET                                   
  -b, --number-nonblank    number nonempty output lines, overrides -n           
  -e                       equivalent to -vE                                    
  -E, --show-ends          display $ at end of each line                        
  -n, --number             number all output lines                              
  -s, --squeeze-blank      suppress repeated empty output lines                 
  -t                       equivalent to -vT                                    
  -T, --show-tabs          display TAB characters as ^I                         
  -u                       (ignored)                                            
  -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB        
      --help     display this help and exit                                     
      --version  output version information and exit                            
                                                                                
Examples:                                                                       
  cat f - g  Output f's contents, then standard input, then g's contents.       
  cat        Copy standard input to standard output.                            
                                                                                
GNU coreutils online help: <http://www.gnu.org/software/coreutils/>             
Report cat translation bugs to <http://translationproject.org/team/>            
Full documentation at: <http://www.gnu.org/software/coreutils/cat>              
or available locally via: info '(coreutils) cat invocation'  
```

## 6.5.2 Additional System Documentation

On most systems, there is a directory where additional documentation (such as documentation files stored by third-party software vendors) is found.

‌⁠

These documentation files are often called readme files since the files typically have names such as `README` or `readme.txt`. The location of these files can vary depending on the distribution that you are using. Typical locations include `/usr/share/doc` and `/usr/doc`.

Typically, this directory is where system administrators go to learn how to set up more complex software services. However, sometimes regular users also find this documentation to be useful.



# Chapter 7 - Navigating the Filesystem

## 7.1 Introduction

In Linux, everything is considered a file. Files are used to store data such as text, graphics, and programs. Directories are a type of file used to store other files; Windows and Mac OS X users typically refer to them as folders. In any case, directories are used to provide a hierarchical organization structure. However, this structure may be somewhat different depending on the type of system in use.

When working in a Linux operating system, it is important to know how to manipulate files and directories. Some Linux distributions have GUI-based applications that allow you to manage files, but it is advantageous to know how to perform these operations via the command line.

## 7.2 Directory Structure

On a Windows system, the top level of the directory structure is called My Computer. Physical devices, such as hard drives, USB drives, network drives, show up under My Computer and are each assigned a drive letter, such as C: or D:.

The directory structures shown below are provided as examples only. These directories may not be present within the virtual machine environment of this course.

A visual representation of a Windows directory structure:

![A basic WIndows filesystem has My Computer at the top level, and the contains three folders: DVD Drive D:, Hard Drive C:, and USB Disk E:. DVD Drive D: contains a folder called Data. Hard Drive C: contains three folders called Program Files, Users, and Windows. USB Disk E: contains a folder called Data.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_2.png)

Like Windows, the Linux directory structure, typically called a filesystem, also has a top level. However instead of My Computer, it is called the root directory, and it is symbolized by the slash `/` character. Additionally, there are no drives in Linux; each physical device is accessible under a directory, as opposed to a drive letter.

The following image shows a visual representation of a typical Linux filesystem:

![The Filesystem Hierarchy Standard defines four hierarchies of directories used in organizing the files of the filesystem. The root directory is to the top level of the Linux system, serving as the first hierarchy. It contains the following directories: /bin/ boot/, /dev, /etc, /home, /lib, /lib64, /media, /mnt, /opt, /proc, /root, /sbin, /srv, /sys, /tmp, /usr, and /var. The second and third hierarchies, located under the /usr and /usr/local directories, repeat the pattern of many of the key directories found under the first hierarchy or root filesystem. The fourth hierarchy, the /var directory, also repeats some of the top level directories such as lib, opt and tmp.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_3.png)

To view the contents of the root directory, use the `ls` command with the `/` character as the argument:

```
sysadmin@localhost:~$ ls /                                            
 bin    etc    lib     mnt    root  'sbin'$'\342\200\214'   tmp                 
 boot   home   lib64   opt    run    srv                    usr                 
 dev    init   media   proc   sbin   sys                    var 
```

Notice that there are many directories with descriptive names including `/boot`, which contains files to boot the computer.

## 7.2.1 Home Directory

The term home directory often confuses new Linux users. To begin with, on most Linux distributions there is a directory called `home` under the root `/` directory.

![A directory called home is located in the root directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_4.png)

Under this `/home` directory there is a directory for each user on the system. The directory name is the same as the name of the user, so a user named `sysadmin` would have a home directory called `/home/sysadmin`.

![A user's home directory is located within the /home directory, which in turn is located in the root directory symbolized by the / character. For example, the sysadmin user has a home directory also named sysadmin located in the /home directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_5.png)

The home directory is an important directory. To begin with, when a user opens a shell, they should automatically be placed in their home directory, as typically this is where they do most of their work.

Additionally, the home directory is one of the few directories where the user has full control to create and delete additional files and directories. On most Linux distributions, the only users who can access the files in a home directory are the owner and the administrator on the system. Most other directories in a Linux filesystem are protected with file permissions.

File permissions and ownership will be covered in detail later in the course.

The home directory has a special symbol used to represent it; the tilde `~` character. So if the sysadmin user is logged in, the tilde `~` character can be used in place of the `/home/sysadmin` directory.

It is also possible to refer to another user's home directory by using the tilde `~` character followed by the name of the user account. For example, `~bob` would be the equivalent of `/home/bob`.

## 7.2.2 Current Directory

To determine where the user is currently located within the filesystem, the `pwd` (print working directory) command can be used:

```
pwd [OPTIONS]
sysadmin@localhost:~$ pwd
/home/sysadmin
```

The `pwd` command prints the working directory, which is the current location of the user within the filesystem. The output of the above command indicates that the `sysadmin` user is currently in their home directory, shown in the filesystem below:

![According to the output of the previous example, the user is located in their home directory called sysadmin. It is located in the directory called /home. This map shows that the sysadmin directory contains eight directories: Desktop, Documents, Downloads, Music, Pictures, Public, Templates, and Videos.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_6.png)

## 7.2.3 Changing Directories

When a user opens a shell, they typically begin in their home directory. When you start a fresh virtual machine in our course, either by opening the course or after using the reset button, you are logged in as the `sysadmin` user, and you begin in the home directory for that user, highlighted in the image below.

![When opening a new shell the user is typically in their home directory called sysadmin. It is located in the directory called /home, which in turn is located in the root directory symbolized by the / character.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_6.png)

To navigate the filesystem, use the `cd` (change directory) command.

```
cd [options] [path]
```

There is a directory called `Documents` located in the home directory of the `sysadmin` user. To move from the home directory into the Documents directory use the directory name as an argument to the `cd` command:

```
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$
```

![The previous example moves the users from the sysadmin directory to the Documents directory contained within.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_7.png)

When used with no arguments, the `cd` command will take the user to their home directory.

```
sysadmin@localhost:~/Documents$ cd
sysadmin@localhost:~$
```

Notice our virtual machines employ a prompt that displays the current working directory, emphasized with the color blue. In the first prompt, the tilde `~` character is equivalent to `/home/sysadmin`, representing the user's home directory.

```
sysadmin@localhost:~$
```

After changing directories, the new location `~/Documents` can also be confirmed in the new prompt, again shown in blue.

```
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$
```

**Consider This**

For some commands, no news is good news; there is no output if the `cd` command is successful. If the user tries to change to a directory that does not exist, the command returns an error message:

```
sysadmin@localhost:~$ cd Junk
-bash: cd: Junk: No such file or directory
```

## 7.3 Paths

The argument to the `cd` command is more than just the name of a directory, it is actually a path. A path is a list of directories separated by the `/` character. If you think of the filesystem as a map, paths are the directory addresses, which include step-by-step navigation directions; they can be used to indicate the location of any file within the filesystem.

For example, `/home/sysadmin` is a path to the home directory:

![/home/sysadmin is a path to the home directory of the sysadmin user. This is like step-by-step navigation directions. To get to the sysadmin directory begin at the root directory (symbolized by the / character). Next move to the directory called home. Finally, move to the directory called sysadmin. You have arrived at your destination.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_8.png)

There are two types of paths: absolute and relative.

## 7.3.1 Absolute Paths

Absolute paths allow the user to specify the exact location of a directory. It always starts at the root directory, and therefore it always begins with the `/` character. The path `/home/sysadmin` is an absolute path; it tells the system to begin at the root `/` directory, move into the `home` directory, and then into the `sysadmin` directory.

If the path `/home/sysadmin` is used as an argument to the `cd` command, it moves the user into the home directory for the `sysadmin` user.

```
sysadmin@localhost:~/Documents$ cd /home/sysadmin
```

Again, no output means the command succeeded. This can be confirmed by looking at the prompt, or using the `pwd` command:

```
sysadmin@localhost:~$ pwd
/home/sysadmin
```

## 7.3.2 Relative Paths

Relative paths start from the current directory. A relative path gives directions to a file relative to the current location in the filesystem. They do not start with the / character. Instead, they start with the name of a directory. More specifically, relative paths start with the name of a directory contained within the current directory.

Take another look at the first `cd` command example. The argument is an example of the simplest relative path: the name of a directory within the current working directory.

```
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$ 
```

If the user is located in the `Documents` directory, moving to the `Art` directory can be accomplished in a number of ways.

![This map depicts an abbreviated version of the filesystem beginning at the sysadmin directory. It contains eight directories: Desktop, Documents, Downloads, Music, Pictures, Public, Templates, and Videos. The Documents direcotry contains two directories: School and Work. The School directory contains three directories: Art, Engineering, and Math. The Documents directory is highlighted to represent it is the user's initial location for the subsequent examples. The Art directory is highlighted to represent it will be the destination for the subsequent examples.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_9.png)

The absolute path to the `Art` directory can be used:

```
sysadmin@localhost:~/Documents$ cd /home/sysadmin/Documents/School/Art
sysadmin@localhost:~/Documents/School/Art$ 
```

Multiple relative paths can be used:

```
sysadmin@localhost:~/Documents$ cd School
sysadmin@localhost:~/Documents/School$ cd Art
sysadmin@localhost:~/Documents/School/Art$ 
```

However, the simplest method is to use a single relative path that covers the journey from the origin to the destination directory:

```
sysadmin@localhost:~/Documents$ cd School/Art
sysadmin@localhost:~/Documents/School/Art$ 
```

![If the user is located in the Documents directory, the relative path School/Art moves them to the School directory contained within the Documents directory, then to the Art directory contained within the School directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_10.png)

Use the `pwd` command to confirm the change:

```
sysadmin@localhost:~/Documents/School/Art$ pwd
/home/sysadmin/Documents/School/Art
```

## 7.3.3 Shortcuts

### The `..` Characters

Regardless of which directory the user is in, two period `..` characters always represents one directory higher relative to the current directory, sometimes referred to as the parent directory. To move from the `Art` directory back to the `School` directory:

```
sysadmin@localhost:~/Documents/School/Art$ cd ..
sysadmin@localhost:~/Documents/School$ 
```

The double dot can also be used in longer paths as well. The following relative path could be used to move from the `School` directory to the `Downloads` directory (both highlighted in the image below):

![The starting point for the next example is the School directory located in the Documents directory, which is located in the sysadmin directory. The destination is the Downloads directory located in the sysadmin directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_11.png)

```
sysadmin@localhost:~/Documents/School$ cd ../../Downloads
sysadmin@localhost:~/Downloads$
```

### The `.` Character

Regardless of which directory the user is in, the single period `.` character always represents the current directory. For the `cd` this shortcut is not very useful, but it comes in handy for commands covered in subsequent sections.

## 7.4 Listing Files in a Directory

For the previous examples, images were provided to show the layout of the filesystem. In practice, maps like these aren’t provided, and users must rely on what’s available in the command line, making the `ls` (list) command one of the most powerful for navigating the filesystem.

```
ls [OPTION]... [FILE]...
```

This `ls` command is used to display the contents of a directory and can provide detailed information about the files. By default, when it is used with no options or arguments, it lists the files in the current directory:

```
sysadmin@localhost:~$ ls                                               
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

The `ls` command can also be used to list the contents of any directory in the filesystem. Provide the path to the directory as an argument:

```
sysadmin@localhost:~$ ls /var                                                   
backups  cache  lib  local  lock  log  mail  opt  run  spool  tmp 
```

**Consider This**

On many Linux distributions, including the one used in our virtual machines, the `ls` command uses color to distinguish by file type. For example, directories may be displayed in blue, executable files may be displayed in green, and symbolic links may be displayed in cyan.

‌⁠

Colored output is not the default behavior for the `ls` command, but rather the effect of the `--color` option. The `ls` seems to perform this coloring automatically because there is an alias for the `ls` command, so it runs with the `--color` option.

```
sysadmin@localhost:~$ type ls
ls is aliased to `ls --color=auto'
```

To avoid using the alias, place a backslash character `\` in front of your command:

```
sysadmin@localhost:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos 
sysadmin@localhost:~$ \ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

## 7.4.1 Listing Hidden Files

When the `ls` command is used to display the contents of a directory, not all files are shown automatically. The `ls` command omits hidden files by default. A hidden file is any file (or directory) that begins with a dot `.` character.

‌⁠⁠

To display all files, including hidden files, use the `-a` option to the `ls` command:

```
sysadmin@localhost:~$ ls -a                                            
.             .bashrc   .selected_editor  Downloads  Public           
..            .cache    Desktop           Music      Templates         
.bash_logout  .profile  Documents         Pictures   Videos
```

Why are files hidden in the first place? Most of the hidden files are customization files, designed to customize how Linux, your shell or programs work. For example, the `.bashrc` file in the home directory customizes features of the shell, such as creating or modifying variables and aliases.

These customization files are not ones that you work with on a regular basis, and having them displayed makes it more difficult to find other files.

## 7.4.2 Long Display Listing

Each file has details associated with it called metadata. This can include information such as the size, ownership, or timestamps. To view this information, use the `-l` option to the `ls` command. Below, a listing of the `/var/log` directory is used as an example, since it provides a variety of output:

```
sysadmin@localhost:~$ ls -l /var/log/
total 900                                                                       
-rw-r--r-- 1 root   root  15322 Dec 10 21:33 alternatives.log
drwxr-xr-x 1 root   root   4096 Jul 19 06:52 apt
-rw-r----- 1 syslog adm     371 Dec 15 16:38 auth.log
-rw-r--r-- 1 root   root  35330 May 26  2018 bootstrap.log
-rw-rw---- 1 root   utmp      0 May 26  2018 btmp
-rw-r----- 1 syslog adm     197 Dec 15 16:38 cron.log
-rw-r--r-- 1 root   adm   85083 Dec 10 21:33 dmesg
-rw-r--r-- 1 root   root 351960 Jul 19 06:52 dpkg.log
-rw-r--r-- 1 root   root  32064 Dec 10 21:33 faillog
drwxr-xr-x 2 root   root   4096 Jul 19 06:51 journal
-rw-rw-r-- 1 root   utmp 292584 Dec 15 16:38 lastlog
-rw-r----- 1 syslog adm   14185 Dec 15 16:38 syslog
-rw------- 1 root   root  64128 Dec 10 21:33 tallylog
-rw-rw-r-- 1 root   utmp    384 Dec 15 16:38 wtmp
```

In the output above, each line displays metadata about a single file. The following describes each of the fields of data in the output of the `ls -l` command:

### File Type

```
-rw-r--r-- 1 root   root  15322 Dec 10 21:33 alternatives.log                   
drwxr-xr-x 1 root   root   4096 Jul 19 06:52 apt 
```

The first character of each line indicates the type of file. The file types are:

| Symbol | File Type      | Description                                                  |
| :----- | :------------- | :----------------------------------------------------------- |
| `d`    | directory      | A file used to store other files.                            |
| `-`    | regular file   | Includes readable files, images files, binary files, and compressed files. |
| `l`    | symbolic link  | Points to another file.                                      |
| `s`    | socket         | Allows for communication between processes.                  |
| `p`    | pipe           | Allows for communication between processes.                  |
| `b`    | block file     | Used to communicate with hardware.                           |
| `c`    | character file | Used to communicate with hardware.                           |

The first file `alternatives.log` is a regular file (`-`), while the second file `apt` is a directory (`d`).

### Permissions

```
drwxr-xr-x 2 root   root   4096 Jul 19 06:51 journal
```

The next nine characters demonstrate the permissions of the file. Permissions indicate how certain users can access a file.

Permissions will be covered in detail later in the course.

### Hard Link Count

```
-rw-r----- 1 syslog adm     371 Dec 15 16:38 auth.log
drwxr-xr-x 2 root   root   4096 Jul 19 06:51 journal
```

This number indicates how many hard links point to this file.

Links will be covered in detail later in the course.

### User Owner

```
-rw-r----- 1 syslog adm     197 Dec 15 16:38 cron.log
```

Every file is owned by a user account. This is important because the owner has the rights to set permissions on a file.

File ownership will be covered in detail later in the course.

### Group Owner

```
-rw-rw-r-- 1 root  utmp  292584 Dec 15 16:38 lastlog
```

Indicates which group owns this file. This is important because any member of this group has a set of permissions on the file.

File ownership will be covered in detail later in the course.

### File Size

```
-rw-r----- 1 syslog adm   14185 Dec 15 16:38 syslog
```

Displays the size of the file in bytes.

For directories, this value does not describe the total size of the directory, but rather how many bytes are reserved to keep track of the filenames in the directory. In other words, ignore this field for directories.

### Timestamp

```
 -rw-rw---- 1 root   utmp      0 May 26  2018 btmp  
```

Indicates the time that the file's contents were last modified. For directories, this timestamp indicates the last time a file was added or deleted from the directory.

### File Name

```
-rw-r--r-- 1 root   root  35330 May 26  2018 bootstrap.log
```

The final field contains the name of the file or directory.

In the case of symbolic links, the link name is displayed along with an arrow and the pathname of the original file.



```
lrwxrwxrwx. 1 root root 22 Nov 6 2018 /etc/grub.conf -> ../boot/grub/grub.conf
```



## 7.4.3 Human-Readable Sizes

The `-l` option to the `ls` command displays file sizes in bytes. For text files, a byte is 1 character. For smaller files, byte sizes are fine. However, for larger files, it is hard to comprehend how large the file is. For example, consider the output of the following command:

```
sysadmin@localhost:~$ ls -l /var/log/lastlog                                    
-rw-rw-r-- 1 root utmp 292584 Dec 15 16:38 /var/log/lastlog
```

The file size is hard to determine in bytes. Is `292584` a large file or small? It seems fairly large, but it is hard to determine using bytes.

Think of it this way: if someone were to give the distance between Boston and New York using inches, that value would be meaningless. Most people think in terms of miles or kilometers.

Sometimes it is preferable to present the file size in a more human-readable size, like megabytes or gigabytes. To accomplish this, add the `-h` option to the `ls` command:

```
sysadmin@localhost:~$ ls -lh /var/log/lastlog                                   
-rw-rw-r-- 1 root utmp 286K Dec 15 16:38 /var/log/lastlog
```

**Important:** The `-h` option must be used with the `-l` option.

## 7.4.4 Listing Directories

When the `-d` option is used, it refers to the current directory, and not the contents within it. Without any other options, it is rather meaningless. Recall that the current directory is always referred to with a single period `.` character:

```
sysadmin@localhost:~$ ls -d                                            
.                                                                      
```

To use the `-d` option in a meaningful way requires the addition of the `-l` option. In this case, note that the following command lists the details of the contents in the `/home/sysadmin` directory:

```
sysadmin@localhost:~$ ls -l                                            
total 32                                                                        
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Desktop
drwxr-xr-x 4 sysadmin sysadmin 4096 Dec 10 21:33 Documents
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Downloads
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Music
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Pictures
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Public
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Templates
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Videos
```

In comparison, the next command lists the `/home/sysadmin` directory itself:

```
sysadmin@localhost:~$ ls -ld                                           
drwxr-xr-x 1 sysadmin sysadmin 224 Nov  7 17:07 .
```

Note the single period at the end of the long listing. This indicates that the current directory is being listed, and not the contents.

## 7.4.5 Recursive Listing

There are times when you want to display all of the files in a directory as well as all of the files in all subdirectories under that directory. This is called a recursive listing.

To perform a recursive listing, use the `-R` option to the `ls` command:

```
sysadmin@localhost:~$ ls -R /etc/ppp
/etc/ppp:
ip-down.d  ip-up.d         

/etc/ppp/ip-down.d:
bind9

/etc/ppp/ip-up.d:
bind9
```

Note that in the previous example, the files in the `/etc/ppp` directory were listed first. After that, the contents of its subdirectories `/etc/ppp/ip-down.d` and `/etc/ppp/ip-up.d` were listed.

Be careful with this option; for example, running the command on the root directory would list every file on the file system, including all files on any attached USB device and DVD in the system. Limit the use of recursive listings to smaller directory structures.

## 7.4.6 Sort a Listing

By default, the `ls` command sorts files alphabetically by file name. Sometimes, it may be useful to sort files using different criteria.

To sort files by size, we can use the `-S` option. Note the difference in the output of the following two commands. The same files and directories are listed, but in a different order:

```
sysadmin@localhost:~$ ls /etc/ssh
moduli              ssh_host_ecdsa_key.pub    ssh_host_rsa_key      sshd_config
ssh_config          ssh_host_ed25519_key      ssh_host_rsa_key.pub
ssh_host_ecdsa_key  ssh_host_ed25519_key.pub  ssh_import_id
sysadmin@localhost:~$ ls -S /etc/ssh
moduli            ssh_host_ed25519_key  ssh_host_ecdsa_key.pub
sshd_config       ssh_host_rsa_key.pub  ssh_host_ed25519_key.pub
ssh_host_rsa_key  ssh_import_id
ssh_config        ssh_host_ecdsa_key
```

**Note**

The option above uses a capital letter s.

While the `-S` option works by itself, it is most useful when used with the `-l` option so the file sizes are visible. The following command lists files from largest to smallest and displays the actual size of the file.

```
sysadmin@localhost:~$ ls -lS /etc/ssh
total 580
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
```

It may also be useful to use the `-h` option to display human-readable file sizes:

```
sysadmin@localhost:~$ ls -lSh /etc/ssh                                
total 580K                                                                      
-rw-r--r-- 1 root root 541K Feb 10  2018 moduli
-rw-r--r-- 1 root root 3.2K Feb 10  2018 sshd_config
-rw------- 1 root root 1.7K Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root 1.6K Feb 10  2018 ssh_config
-rw------- 1 root root  411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root  399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root  338 Jul 19 06:52 ssh_import_id
-rw------- 1 root root  227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root  179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root   99 Jul 19 06:52 ssh_host_ed25519_key.pub
```

The `-t` option sorts files based on the time they were modified. It will list the most recently modified files first. This option can be used alone, but again, is usually more helpful when paired with the `-l` option:

```
sysadmin@localhost:~$ ls -tl /etc/ssh                                 
total 580
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
```

It is important to remember that the modified date on directories represents the last time a file was added to or removed from the directory.

If the files in a directory were modified many days or months ago, it may be harder to tell exactly when they were modified, as only the date is provided for older files. For more detailed modification time information you can use the `--full-time` option to display the complete timestamp (including hours, minutes, seconds). It will assume the `-l` option automatically:

```
sysadmin@localhost:~$ ls -t --full-time /etc/ssh
total 580
-rw------- 1 root root    227 2018-07-19 06:52:16.000000000 +0000 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    179 2018-07-19 06:52:16.000000000 +0000 ssh_host_ecdsa_key.pub
-rw------- 1 root root    411 2018-07-19 06:52:16.000000000 +0000 ssh_host_ed25519_key
-rw-r--r-- 1 root root     99 2018-07-19 06:52:16.000000000 +0000 ssh_host_ed25519_key.pub
-rw------- 1 root root   1679 2018-07-19 06:52:16.000000000 +0000 ssh_host_rsa_key
-rw-r--r-- 1 root root    399 2018-07-19 06:52:16.000000000 +0000 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root    338 2018-07-19 06:52:16.000000000 +0000 ssh_import_id
-rw-r--r-- 1 root root 553122 2018-02-10 02:31:46.000000000 +0000 moduli
-rw-r--r-- 1 root root   1580 2018-02-10 02:31:46.000000000 +0000 ssh_config
-rw-r--r-- 1 root root   3264 2018-02-10 02:31:46.000000000 +0000 sshd_config
```

It is possible to perform a reverse sort by using the `-r` option. It can be used alone, or combined with either the `-S` or `-t` options. The following command will sort files by size, smallest to largest:

```
sysadmin@localhost:~$ ls -lrS /etc/ssh
total 580
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli 
```

The following command will list files by modification date, oldest to newest:

```
sysadmin@localhost:~$ ls -lrt /etc/ssh                                 
total 580
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
```

# Chapter 8 - Managing Files and Directories

## 8.1 Introduction

When working in a Linux Operating System, it is important to know how to manipulate files and directories. Some Linux distributions have GUI-based applications that allow you to manage files, but it is advantageous to know how to perform these operations via the command line.

It is important to note that everything in Linux is case-sensitive, a feature carried over from Unix. This means that the shell recognizes a lowercase `a` character as completely different from an uppercase `A` character. When manipulating files, pay attention to your capitalization: the `hello.txt` file is different from the `HELLO.txt` and `Hello.txt` files.

## 8.2 Globbing

Glob characters are often referred to as wild cards. These are symbol characters that have special meaning to the shell.

Globs are powerful because they allow you to specify patterns that match filenames in a directory. So instead of manipulating a single file at a time, you can easily execute commands that affect many files. For instance, by using glob characters, it is possible to manipulate all files with a specific extension or with a particular filename length.

Unlike commands that the shell runs, or options and arguments that the shell passes to commands, glob characters are interpreted by the shell itself before it attempts to run any command. As a result, glob characters can be used with any command.

The examples provided in this chapter use the `echo` command for demonstration.

## 8.2.1 Asterisk * Character

The asterisk `*` character is used to represent zero or more of any character in a filename. For example, to display all of the files in the `/etc` directory that begin with the letter `t`:

```
sysadmin@localhost:~$ echo /etc/t*                              
/etc/terminfo /etc/timezone /etc/tmpfiles.d
```

The pattern `t*` matches any file in the `/etc` directory that begins with the character `t` followed by zero or more of any character. In other words, any files that begin with the letter `t`.

You can use the asterisk character at any place within the filename pattern. For example, the following matches any filename in the `/etc` directory that ends with `.d`:

```
sysadmin@localhost:~$ echo /etc/*.d                                 
/etc/apparmor.d /etc/binfmt.d /etc/cron.d /etc/depmod.d /etc/init.d /etc/insserv
.conf.d /etc/ld.so.conf.d /etc/logrotate.d /etc/modprobe.d /etc/modules-load.d /
etc/pam.d /etc/profile.d /etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d /etc/rc4.d 
/etc/rc5.d /etc/rc6.d /etc/rcS.d /etc/rsyslog.d /etc/sudoers.d /etc/sysctl.d /et
c/tmpfiles.d /etc/update-motd.d
```

In the next example, all of the files in the `/etc` directory that begin with the letter `r` and end with `.conf` are displayed:

```
sysadmin@localhost:~$ echo /etc/r*.conf                             
/etc/resolv.conf /etc/rsyslog.conf
```

## 8.2.2 Question Mark ? Character

The question mark `?` character represents any single character. Each question mark character matches exactly one character, no more and no less.

Suppose you want to display all of the files in the `/etc` directory that begin with the letter `t` and have exactly 7 characters after the `t` character:

```
sysadmin@localhost:~$ echo /etc/t???????      
/etc/terminfo /etc/timezone
```

Glob characters can be used together to find even more complex patterns. The pattern `/etc/*????????????????????` command only matches files in the `/etc` directory with twenty or more characters in the filename:

```
sysadmin@localhost:~$ echo /etc/*????????????????????            
/etc/bindresvport.blacklist /etc/ca-certificates.conf
```

The asterisk and question mark could also be used together to look for files with three-letter extensions by using the `/etc/*.???` pattern:

```
sysadmin@localhost:~$ echo /etc/*.???                
/etc/issue.net /etc/locale.gen
```

## 8.2.3 Bracket [ ] Characters

The bracket `[``]` characters are used to match a single character by representing a range of characters that are possible match characters. For example, the `/etc/[gu]*` pattern matches any file that begins with either a `g` or `u` character and contains zero or more additional characters:

```
sysadmin@localhost:~$ echo /etc/[gu]*                              
/etc/gai.conf /etc/groff /etc/group /etc/group- /etc/gshadow /etc/gshadow- /etc/
gss /etc/ucf.conf /etc/udev /etc/ufw /etc/update-motd.d /etc/updatedb.conf           
```

Brackets can also be used to a represent a range of characters. For example, the `/etc/[a-d]*` pattern matches all files that begin with any letter between and including a and d:

```
sysadmin@localhost:~$ echo /etc/[a-d]*
/etc/adduser.conf /etc/alternatives /etc/apparmor /etc/apparmor.d /etc/apt /etc/
bash.bashrc /etc/bind /etc/bindresvport.blacklist /etc/binfmt.d /etc/ca-certific
ates /etc/ca-certificates.conf /etc/calendar /etc/console-setup /etc/cron.d /etc
/cron.daily /etc/cron.hourly /etc/cron.monthly /etc/cron.weekly /etc/crontab /et
c/dbus-1 /etc/debconf.conf /etc/debian_version /etc/default /etc/deluser.conf /e
tc/depmod.d /etc/dhcp /etc/dpkg 
```

The `/etc/*[0-9]*` pattern displays any file that contains at least one number:

```
sysadmin@localhost:~$ echo /etc/*[0-9]*                            
/etc/X11 /etc/dbus-1 /etc/iproute2 /etc/mke2fs.conf /etc/python3 /etc/python3.6 
/etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d /etc/rc4.d /etc/rc5.d /etc/rc6.d  
```

The range is based on the **ASCII** text table. This table defines a list of characters, arranging them in a specific standard order. If an invalid order is provided, no matches will be made:

```
sysadmin@localhost:~$ echo /etc/*[9-0]*                           
/etc/*[9-0]*                                                       
```

**Note:** The ASCII text table can be viewed in our virtual machines by executing the `ascii` command.

## 8.2.4 Exclamation Point ! Character

The exclamation point `!` character is used in conjunction with the square brackets to negate a range. For example, the pattern `/etc/[!DP]*` matches any file that does not begin with a `D` or P.

```
sysadmin@localhost:~$ echo /etc/[!a-t]*
/etc/X11 /etc/ucf.conf /etc/udev /etc/ufw /etc/update-motd.d /etc/updatedb.conf 
/etc/vim /etc/vtrgb /etc/wgetrc /etc/xdg
```

## 8.2.5 Listing With Globs

The `ls` command is normally used to list files in a directory; as a result, using the `echo` command may seem to have been a strange choice. However, there is something about the `ls` command that causes problems when listing files using glob patterns.

Keep in mind that it is the shell, not the `echo` or `ls` command, that expands the glob pattern into corresponding file names. In other words, if the `echo /etc/a*` command is executed, what the shell did before executing the echo command was replace `a*` with all of the files and directories within the `/etc` directory that match the pattern.

So, if the `ls /etc/a*` command is run, what the shell would really run would be this:

```
ls /etc/adduser.conf  /etc/alternatives  /etc/apparmor  /etc/apparmor.d  /etc/apt
```

When the `ls` command sees multiple arguments, it performs a list operation on each item separately. In other words, `ls /etc/a*` is the same as running the following commands consecutively:

```
ls /etc/adduser.conf  
ls /etc/alternatives  
ls /etc/apparmor  
ls /etc/apparmor.d  
ls /etc/apt
```

Now consider what happens the `ls` command is passed a file, such as `/etc/adduser.conf`:

```
sysadmin@localhost:~$ ls /etc/adduser.conf
/etc/adduser.conf
```

Running the `ls` command on a single file results in the name of the file being printed; typically this is useful if the `-l` option is used to see details about a specific file:

```
sysadmin@localhost:~$ ls -l /etc/adduser.conf                                   
-rw-r--r-- 1 root root 3028 May 26  2018 /etc/adduser.conf
```

However, what if the `ls` command is given a directory name as an argument? In this case, the output of the command is different than if the argument was a regular file:

```
sysadmin@localhost:~$ ls /etc/apparmor                                          
init  parser.conf  subdomain.conf 
```

If the `ls` command is given a directory name, the command displays the contents of the directory (the names of the files in the directory), not just the directory name. The filenames in the previous example are the names of the files in the `/etc/apparmor` directory.

Why is this a problem when using globs? Consider the following output:

```
sysadmin@localhost:~$ ls /etc/ap*                                               
/etc/apparmor:                                                                  
init  parser.conf  subdomain.conf                                               
                                                                                
/etc/apparmor.d:                                                                
abstractions  disable         local          tunables     usr.sbin.named        
cache         force-complain  sbin.dhclient  usr.bin.man  usr.sbin.rsyslogd     
                                                                                
/etc/apt:                                                                       
apt.conf.d  preferences.d  sources.list  sources.list.d  trusted.gpg.d   
```

When the `ls` command sees a filename as an argument, it just displays the filename. However, for any directory, it displays the contents of the directory, not just the directory name.

This becomes even more confusing in a situation like the following:

```
sysadmin@localhost:~$ ls /etc/x*                                                
autostart  systemd  user-dirs.conf  user-dirs.defaults 
```

In the previous example, it seems like the `ls` command is just plain wrong. However, what really happened is that the only thing that matches the glob `/etc/x*` is the `/etc/xdg` directory.

So, the `ls` command only displayed the files in that directory!

There is a simple solution to this problem: always use the `-d` option with globs, which tells the `ls` command to display the name of directories, instead of their contents:

```
sysadmin@localhost:~$ls -d /etc/x*                                             
/etc/xdg
```

## 8.3 Copying Files

The `cp` command is used to copy files. It requires a source and a destination. The structure of the command is as follows:

```
cp [source] [destination]
```

The source is the file to be copied. The destination is where the copy is to be located. When successful, the `cp` command does not have any output (no news is good news). The following command copies the `/etc/hosts` file to your home directory:

```
sysadmin@localhost:~$ cp /etc/hosts ~                                     
sysadmin@localhost:~$ ls
Desktop    Downloads  Pictures  Templates  hosts                          
Documents  Music      Public    Videos                                    
```

**Reminder:** The `~` character represents your home directory.

## 8.3.1 Verbose Mode

The `-v` option causes the `cp` command to produce output if successful. The `-v` option stands for verbose:

```
sysadmin@localhost:~$ cp -v /etc/hosts ~                              
`/etc/hosts' -> `/home/sysadmin/hosts'
```

When the destination is a directory, the resulting new file keeps the same name as the original file. To give the new file a different name, provide the new name as part of the destination:

```
sysadmin@localhost:~$ cp /etc/hosts ~/hosts.copy                      
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  hosts                       
Documents  Music      Public    Videos     hosts.copy  
```

## 8.3.2 Avoid Overwriting Data

The `cp` command can be destructive to existing data if the destination file already exists. In the case where the destination file exists, the `cp` command overwrites the existing file's contents with the contents of the source file.

To illustrate this potential problem, first a new file is created in the home directory by copying an existing file:

```
sysadmin@localhost:~$ cp /etc/hostname example.txt
```

View the information about the file with `ls` command:

```
sysadmin@localhost:~$ ls -l example.txt                                         
-rw-r--r-- 1 sysadmin sysadmin 10 Dec 15 22:55 example.txt
```

View the contents of the file using the `cat` command:

```
sysadmin@localhost:~$ cat example.txt                                           
localhost     
```

In the next example, the `cp` command destroys the original contents of the `example.txt` file:

```
sysadmin@localhost:~$ cp /etc/timezone example.txt
```

Notice that after the `cp` command is complete, the size of the file has changed and the contents are different:

```
sysadmin@localhost:~$ ls -l example.txt                                         
-rw-r--r-- 1 sysadmin sysadmin 8 Dec 15 22:58 example.txt
sysadmin@localhost:~$ cat example.txt
Etc/UTC
```

Two options can be used to safeguard against accidental overwrites. With the `-i` interactive option, the `cp` command prompts the user before overwriting a file. The following example demonstrates this option, first restoring the content of the original file:

```
sysadmin@localhost:~$ cp -i /etc/hosts example.txt                   
cp: overwrite `/home/sysadmin/example.txt'? n                          
```

If a value of `y` (yes) were given, then the copy process would have taken place. However, the value of `n` (no) was given when prompted to overwrite the file, so no changes were made to the file.

The `-i` option requires you to answer `y` or `n` for every copy that could end up overwriting an existing file's contents. This can be tedious when a bunch of overwrites occur, such as the example demonstrated below:

```
sysadmin@localhost:~$ cp -i /etc/skel/.* ~                             
cp: -r not specified; omitting directory '/etc/skel/.'                          
cp: -r not specified; omitting directory '/etc/skel/..'                                   
cp: overwrite `/home/sysadmin/.bash_logout'? n                         
cp: overwrite `/home/sysadmin/.bashrc'? n                              
cp: overwrite `/home/sysadmin/.profile'? n                            
cp: overwrite `/home/sysadmin/.selected_editor'? n
```

As you can see from the example above, the `cp` command tried to overwrite four existing files, forcing the user to answer four prompts. If this situation happened for 100 files, it could become very annoying, very quickly.

To answer `n` to each prompt automatically, use the `-n` option. It stands for no clobber, or no overwrite.

```
sysadmin@localhost:~$ cp -n /etc/skel/.* ~                                      
cp: -r not specified; omitting directory '/etc/skel/.'                          
cp: -r not specified; omitting directory '/etc/skel/..'
```

## 8.3.3 Copying Directories

By default, the `cp` command will not copy directories; any attempt to do so results in an error message:

```
sysadmin@localhost:~$ cp -n /etc/skel/.* ~                                      
cp: -r not specified; omitting directory '/etc/skel/.'                          
cp: -r not specified; omitting directory '/etc/skel/..'                               
```

However, the `-r` option has the `cp` command copy both files and directories.

Be careful with this option. The entire directory structure will be copied which could result in copying a lot of files and directories!

## 8.4 Moving Files

To move a file, use the `mv` command. The syntax for the `mv` command is much like the `cp` command:

```
mv [source] [destination]
```

In the following example, the `hosts` file that was generated previously is moved from the current directory to the `Videos` directory:

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt  hosts.copy     
Documents  Music      Public    Videos     hosts                       
sysadmin@localhost:~$ mv hosts Videos                                  
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt                 
Documents  Music      Public    Videos     hosts.copy                 
sysadmin@localhost:~$ ls Videos                                        
hosts                                                                 
```

When a file is moved, the file is removed from the original location and placed in a new location. Moving files can be somewhat tricky in Linux because users need specific permissions to remove files from a directory. Without the right permissions, a `Permission denied` error message is returned:

```
sysadmin@localhost:~$ mv /etc/hosts .
mv: cannot move `/etc/hosts' to `./hosts': Permission denied
```

Permissions will be covered in detail later in the course.

## 8.4.1 Renaming Files

The `mv` command is not just used to move a file, but also to rename a file. If the destination for the `mv` command is a directory, the file is moved to the directory specified. The name of the file only changes if a destination file name is also specified.

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt                          
Documents  Music      Public    Videos     hosts.copy                 
sysadmin@localhost:~$ mv example.txt Videos/newexample.txt             
sysadmin@localhost:~$ ls
Desktop    Downloads  Pictures  Templates  hosts.copy                           
Documents  Music      Public    Videos                               
sysadmin@localhost:~$ ls Videos                                       
hosts  newexample.txt                                                  
```

If a destination directory is not specified, the file is renamed using the destination file name and remains in the source directory. For example, the following commands renames the `newexample.txt` file to `myfile.txt`:

```
sysadmin@localhost:~$ cd Videos                                        
sysadmin@localhost:~/Videos$ ls                                        
hosts  newexample.txt                                                  
sysadmin@localhost:~/Videos$ mv newexample.txt myfile.txt           
sysadmin@localhost:~/Videos$ ls
hosts  myfile.txt
```

Think of the previous `mv` example to mean move the `newexample.txt` file from the current directory to the current directory and give the new file the name `myfile.txt`.

## 8.4.2 Additional Move Options

Like the `cp` command, the `mv` command provides the following options:

‌⁠⁠

| Option | Meaning                                                     |
| :----- | :---------------------------------------------------------- |
| `-i`   | Interactive: Ask if a file is to be overwritten.            |
| `-n`   | No Clobber: Do not overwrite a destination file's contents. |
| `-v`   | Verbose: Show the resulting move.                           |

**Important:** There is no `-r` option as the `mv` command moves directories by default.

## 8.5 Creating Files

There are several ways of creating a new file, including using a program designed to edit a file (a text editor).

There is also a way to create an empty file that can be populated with data at a later time. This feature is useful for some operating systems as the very existence of a file could alter how a command or service works. It is also useful to create a file as a "placeholder" to remind you to create the file contents at a later time.

To create an empty file, use the `touch` command as demonstrated below:

```
sysadmin@localhost:~$ touch sample                                     
sysadmin@localhost:~$ ls -l sample                                     
-rw-rw-r-- 1 sysadmin sysadmin 0 Nov  9 16:48 sample
```

Notice the size of the new file is `0` bytes. As previously mentioned, the `touch` command doesn't place any data within the new file.

Text editors will be covered in detail later in the course.

## 8.6 Removing Files

To delete a file, use the `rm` command:

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  hosts.copy                           
Documents  Music      Public    Videos     sample                         
sysadmin@localhost:~$ rm sample    
sysadmin@localhost:~$ rm hosts.copy                                    
sysadmin@localhost:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos 
```

Note that the files were deleted with no questions asked. This could cause problems when deleting multiple files by using glob characters. Because these files are deleted without question, a user could end up deleting files that were not intended to be deleted.

**Warning:** The files are permanently deleted. There is no command to undelete a file and no trash can from which to recover deleted files.

As a precaution, users should use the `-i` option when deleting multiple files:

```
sysadmin@localhost:~$ touch sample.txt example.txt test.txt            
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt  test.txt       
Documents  Music      Public    Videos     sample.txt                 
sysadmin@localhost:~$ rm -i *.txt                                     
rm: remove regular empty file `example.txt'? y                         
rm: remove regular empty file `sample.txt'? n                          
rm: remove regular empty file `test.txt'? y                            
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  sample.txt                  
Documents  Music      Public    Videos                                 
```

## 8.6.1 Removing Directories

You can delete directories using the `rm` command. However, the default behavior (no options) of the `rm` command is to not delete directories:

```
sysadmin@localhost:~$ rm Videos                                        
rm: cannot remove `Videos': Is a directory                            
```

To delete a directory with the `rm` command, use the `-r` recursive option:

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  sample.txt                  
Documents  Music      Public    Videos                                 
sysadmin@localhost:~$ rm -r Videos                                     
sysadmin@localhost:~$ ls                                               
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  sample.txt 
```

When a user deletes a directory, all of the files and subdirectories are deleted without any interactive question. It is best to use the `-i` option with the `rm` command.

You can also delete a directory with the `rmdir` command, but only if the directory is empty.

```
sysadmin@localhost:~$ rmdir Documents                                           
rmdir: failed to remove 'Documents': Directory not empty
```

## 8.7 Creating Directories

To create a directory, use the `mkdir` command:

```
sysadmin@localhost:~$ ls                                               
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  sample.txt
sysadmin@localhost:~$ mkdir test                                       
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates   test                       
Documents  Music      Public    sample.txt
```