From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: putting all logs in a file
Date: Wed, 10 Sep 2003 13:53:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5F650B.3080404@Loudoun-Fairfax.com>
References: <Pine.LNX.4.44.0309100644040.15305-100000@cic-mail.lanl.gov>	 <3F5F3F2E.70102@Loudoun-Fairfax.com> <1063208370.4771.30.camel@smoogen1.lanl.gov>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------060502010909030601030006"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063208370.4771.30.camel@smoogen1.lanl.gov>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Stephen Smoogen <smoogen@lanl.gov>
Cc: akshaysalkar <akshaysalkar@indiatimes.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------060502010909030601030006
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


>It should be use something like info and then put a line in syslog.conf
>for 
>
>kern.info /var/log/iptables
>

Ahhh, but this is the command he started with, and it logs to both files 
by default. I've wanted to do this for some time so I did a little 
hacking of syslog.conf file and here's what I've got so far:

1.   Log level "info" is used by the kernel pretty regularly, so I 
changed my iptables log levels to "debug". Since every kernel message 
with a log level of debug will show up in this file, I selected a log 
level that my system rarely uses. Your mileage may vary.

iptables . . .   -j LOG --log-level debug --log-prefix "your_prefix:"

2.   Add a statement in your syslog.conf file:

kern.=debug      -/var/log/iptables.log

This will send only kernel debug level messages to your file. If you 
don't use the "=" then all messages at debug level or higher 
(everything) will go to your file. The "-" before the log file name 
allows the system to delay logging to this file during times of heavy 
kernel load.

3.   Modify the syslog.conf line that points to your /var/log/messages 
file by adding "kern.!=debug" to exclude (only) debug messages. In my 
case the line now looks like this:

*.*;mail.none;news.none;kern.!=debug      -/var/log/messages

4.    Restart syslog (this may not be necessary but it's a quick way to 
see if thing are going where you expected) and reload your iptables rules.

>My apologies for the early morning stupidity.
>  
>

I've found another cup of coffee often relieves this condition  ;-)   
I'm not much of a script writer on a good day (after coffee) so I 
welcome any suggested corrections or improvements.

Jeff

--------------060502010909030601030006
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
<br>
<blockquote type="cite"
 cite="mid1063208370.4771.30.camel@smoogen1.lanl.gov">
  <pre wrap="">It should be use something like info and then put a line in syslog.conf
for 

kern.info /var/log/iptables</pre>
</blockquote>
<br>
Ahhh, but this is the command he started with, and it logs to both
files by default. I've wanted to do this for some time so I did a
little hacking of syslog.conf file and here's what I've got so far:<br>
<br>
1.&nbsp;&nbsp; Log level "info" is used by the kernel pretty regularly, so I
changed my iptables log levels to "debug". Since every kernel message
with a log level of debug will show up in this file, I selected a log
level that my system rarely uses. Your mileage may vary.<br>
<br>
iptables . . .&nbsp;&nbsp; -j LOG --log-level debug --log-prefix "your_prefix:"<br>
<br>
2.&nbsp;&nbsp; Add a statement in your syslog.conf file:<br>
<br>
kern.=debug&nbsp;&nbsp; &nbsp;&nbsp; -/var/log/iptables.log<br>
<br>
This will send only kernel debug level messages to your file. If you
don't use the "=" then all messages at debug level or higher
(everything) will go to your file. The "-" before the log file name
allows the system to delay logging to this file during times of heavy
kernel load.<br>
<br>
3.&nbsp;&nbsp; Modify the syslog.conf line that points to your /var/log/messages
file by adding "kern.!=debug" to exclude (only) debug messages. In my
case the line now looks like this:<br>
<br>
*.*;mail.none;news.none;kern.!=debug&nbsp;&nbsp; &nbsp;&nbsp; -/var/log/messages<br>
<br>
4.&nbsp;&nbsp;&nbsp; Restart syslog (this may not be necessary but it's a quick way to
see if thing are going where you expected) and reload your iptables
rules.<br>
<br>
<blockquote type="cite"
 cite="mid1063208370.4771.30.camel@smoogen1.lanl.gov">
  <pre wrap="">
My apologies for the early morning stupidity.
  </pre>
</blockquote>
<br>
I've found another cup of coffee often relieves this condition&nbsp; ;-)&nbsp;&nbsp;
I'm not much of a script writer on a good day (after coffee) so I
welcome any suggested corrections or improvements.<br>
<br>
Jeff<span style="font-family: monospace;"></span>
</body>
</html>

--------------060502010909030601030006--


