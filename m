From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Dropping SYN with FIN flag set
Date: 21 Oct 2003 17:35:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066772154.1557.106.camel@valhalla>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>
	 <1066754393.1557.29.camel@valhalla> <3F95721F.2050905@Loudoun-Fairfax.com>
	 <1066762574.1557.62.camel@valhalla> <3F959889.8040507@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F959889.8040507@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-10-21 at 16:35, Jeffrey Laramie wrote:
>
> I only wish I had time to review my logs in that kind of detail. If I'm 
> blocking the bad stuff, I'm happy!

Actually, that's kind of the point. I used to use Nokia boxes at my
secure ISP and reviewing the logs was an all day event. By switching to
iptables I was collecting more information, but spending about 1/10 the
amount of time doing log review.

It takes time to setup your logging rules and the cron script I
described. Once its done however performing log review is a breeze.

Let me give you (yet another) example. My perimeter includes all my
accept rules for all legitimate FTP servers. After that, I have this set
of rules:

iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN -d 0/0 --dport 21
-j LOG --log-prefix " FTP_SCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN -d 0/0 --dport 21
-j REJECT --reject-with icmp-host-unreachable

My script then parses the traffic like so:
grep FTP_SCAN cb19.txt > ftp-scan.txt
grep -v FTP_SCAN cb19.txt> cb20.txt

Now, I know on a daily basis this ftp-scan.txt file is normally 40-75 KB
in size (there are always script kiddies poking at FTP). When I see a
file size in this range, I don't even bother looking at it. If one day I
check the file and its 1 MB however, then I take the time to see if its
one persistent IP (in which case I ban it) or from a number of different
IPs (in which case there is a new tool and possibly a 0-day so I start
investigating what's going on and if my FTP servers need patching).

Log review really is a critical part of keeping your perimeter secure.
There are lots of tricks you can play to help minimize the time you
spend doing it.

> Actually it was a couple of previous posts, including one of your's, 
> that got me thinking about logging. There were several questions about 
> directing the iptables logs from /var/log/messages to a different file 
> and the difficulty in splitting out the other kernel traffic.

This is another "salt to taste" kind of thing. Some people do prefer to
dump the firewall log entries to their own file. I personally do not.

When I teach firewall log review my golden rule is "move aside
everything you expect, focus on the stuff you do not". For example the
script I keep mentioning pulls out all the traffic I expect my firewall
to record. The last temp file gets renamed "interesting.txt" and that's
the first file to get reviewed. Let's say someone SSH's to the box or
assumes root level privileges. These log entires will end up in that
"interesting.txt" file. Granted these are not true firewall log entries
but if someone has whacked this critical piece of my infrastructure, I
want to know about it ASAP. So leaving all the log entries in messages
helps to facilitate this process.

> I have 3 files to review each morning. The /var/log/messages file has 
> pure kernel entries in it. If things are going ok this file is pretty 
> short and boring. If there's a kernel problem it's real obvious. The 
> iptables.report shows all the traffic by rule.

This is totally cool. Again, one of the things thats nice about a
flexible tool is that everyone can customize it to suit the way they
like to review the data. :)

Thanks for the info!
C



