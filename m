From: "akshaysalkar" <akshaysalkar@indiatimes.com>
Subject: Re: Re: putting all logs in a file
Date: Thu, 11 Sep 2003 10:24:53 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309110437.KAA05285@WS0005.indiatimes.com>
Reply-To: "akshaysalkar"<akshaysalkar@indiatimes.com>
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>, Stephen Smoogen <smoogen@lanl.gov>
Cc: netfilter@lists.netfilter.org

thanks a lot for all the help guys...

i will try out those modifications...

regards.






"Jeffrey Laramie" wrote:


  It should be use something like info and then put a line in syslog.conf
for 

kern.info /var/log/iptables



Ahhh, but this is the command he started with, and it logs to both
files by default. I've wanted to do this for some time so I did a
little hacking of syslog.conf file and here's what I've got so far:



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
see if thing are going where you expected) and reload your iptables
rules.




  
My apologies for the early morning stupidity.
  



I've found another cup of coffee often relieves this condition  ;-)  
I'm not much of a script writer on a good day (after coffee) so I
welcome any suggested corrections or improvements.



Jeff



Get Your Private, Free E-mail from Indiatimes at http://email.indiatimes.com

 Buy The Best In BOOKS at http://www.bestsellers.indiatimes.com

Bid for for Air Tickets on Air Sahara Flights at Prices Lower Than Before. Just log on to http://airsahara.indiatimes.com and Bid Now!


