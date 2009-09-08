From: Jason Frisvold <xenophage0@gmail.com>
Subject: Re: ulogd compile problems
Date: Tue, 08 Sep 2009 17:13:55 -0400
Message-ID: <4AA6C913.504@gmail.com>
References: <4F548017-89C1-42AE-87F1-68F92C62A8D4@gmail.com> <22C0D408-B9FD-4B04-9CD8-E077E45C7F3A@gmail.com> <4AA68560.1080006@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA68560.1080006@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

On 09/08/2009 12:25 PM, Michele Petrazzo - Unipex wrote:
> I think that it's the right one, but the developers can be busy sometime...

Understood.  I didn't see any comments on it, so I figured I'd ask.

> However, "ld: bad -rpath option " can be only a linker option so trying
> to googleing a bit, I found this: http://tinyurl.com/nqewau

> Modify the Makefile with that options and, if it work, try to submit a
> patch to the devels.

I did modify the makefile and change the -rdynamic flag to -rpath.  I
compiled and it seems to run now, though I need to test more.

I'm a bit confused, though, because mysql_config defined -rdynamic,
which I'm inclined to believe.

Also, configure seems to be "broken" when it comes to mysql anyway
because of this :

checking for mysql_real_escape_string support... strings: invalid option
-- r
Usage: strings [option(s)] [file(s)]
 Display printable strings in [file(s)] (stdin by default)
 The options are:
  -a - --all                Scan the entire file, not just the data section
  -f --print-file-name      Print the name of the file before each string
  -n --bytes=[number]       Locate & print any NUL-terminated sequence of at
  -<number>                 least [number] characters (default 4).
  -t --radix={o,d,x}        Print the location of the string in base 8,
10 or 16
  -o                        An alias for --radix=o
  -T --target=<BFDNAME>     Specify the binary file format
  -e --encoding={s,S,b,l,B,L} Select character size and endianness:
                            s = 7-bit, S = 8-bit, {b,l} = 16-bit, {B,L}
= 32-bit
  @<file>                   Read options from <file>
  -h --help                 Display this information
  -v --version              Print the program's version number
strings: supported targets: elf32-i386 a.out-i386-linux efi-app-ia32
elf32-little elf32-big srec symbolsrec tekhex binary ihex trad-core


The source of this problem is line 1750 of configure :

   MYSQL_FUNCTION_TEST=`strings ${MYSQLLIBS}/libmysqlclient.so | grep
mysql_real_escape_string`

This would work, if MYSQLLIBS wasn't defined above as :

MYSQLLIBS=`$d/mysql_config --libs`

I'm not sure why they would try to use MYSQLLIBS as a path in the
function test as mysql_config --libs returns something similar to this:

[user@example ulogd-1.24]$ /usr/bin/mysql_config --libs
-rdynamic -L/usr/lib/mysql -lmysqlclient -lz -lcrypt -lnsl -lm

And there's that pesky -rdynamic, too.  I wonder, perhaps, if it should
be -Bdynamic instead.. that would make more sense to me..

Actually, the -rdynamic is ok for GCC, but not LD ...  So perhaps the
Makefile is wrong?  Or outdated?

> Michele

-- 
---------------------------
Jason Frisvold
xenophage0@gmail.com
---------------------------
"I love deadlines. I like the whooshing sound they make as they fly by."
   - Douglas Adams
