From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Dropping SYN with FIN flag set
Date: 21 Oct 2003 14:56:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066762574.1557.62.camel@valhalla>
References: <NDBBKABJBJCIJNAELLKEEEDOJDAA.jimm@simutronics.com>
	 <1066754393.1557.29.camel@valhalla>  <3F95721F.2050905@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F95721F.2050905@Loudoun-Fairfax.com>
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
To: netfilter@lists.netfilter.org

On Tue, 2003-10-21 at 13:51, Jeffrey Laramie wrote:
>
> Hey Chris -

Greetings! :)

> I've taken a rudimentary stab at these kinds of rules with mixed success 
> and your post brings up a couple of questions:
>
> Here are the rules I'm using now:
> 
> # Chain to trap bad packets before they enter the system.
> $iptables -A Bad_Packet -p tcp -m state --state INVALID -j LOG 
> --log-level debug
> $iptables -A Bad_Packet -p tcp -m state --state INVALID -j DROP

On the up side, this combo should catch all the stuff I mention in my
rules far more efficiently as you are only using a single rule. On the
downside, you'll see a lot of false positives (like state table
time-outs during the FIN/ACK exchange) and it does not categorize the
flag combo for easy review later (as mine does). 

Also, are you trying to use --log-level to increase the amount of
detail? If so, that switch actually sets the Syslog facility level. You
can try using the IP or TCP options switch instead to get more detail.

> $iptables -A Bad_Packet -p tcp --tcp-flags SYN,ACK SYN,ACK -m state 
> --state NEW
> $iptables -A Bad_Packet -p tcp ! --syn -m state --state NEW -j LOG 
> --log-level
> $iptables -A Bad_Packet -p tcp ! --syn -m state --state NEW -j DROP

This should work (I have not tried it). I do similar except I don't use
-m and place the rules after the state table gets processed (same effect
except my way is dependent on the rule order not getting messed up). I
also prefix the SYN/ACK log entries with " SPOOFING_FALLOUT " to make
them easier to extract from my logs.

> 1.  These obviously are different from your rules. Are these rules 
> useful or should I just replace them with rules similar to yours?

I actually have a method to my madness. Each morning I have a cron job
kicks off to process the logs from the day before. The script has a ton
of entires similar to the following:

grep SYNFINSCAN cb5.txt > synfin-scan.txt
grep -v SYNFINSCAN cb5.txt > cb6.txt
grep FINSCAN cb6.txt > finscan.txt
grep -v FINSCAN cb6.txt > cb7.txt
grep NULLSCAN cb7.txt > nullscan.txt
grep -v NULLSCAN cb7.txt > cb8.txt
grep NMAPXMAS cb8.txt > nmapxmas.txt
grep -v NMAPXMAS cb8.txt > cb9.txt

Pretty easy to see what I'm doing. I'm leveraging the prefixing I
mentioned in my last post to parse each traffic pattern into its own
text file. This makes figuring out what happened in the logs far easier.
It also helps to catch slow scans. For example if someone tries a FIN
scan but only sends a probe every two hours, it still sticks out like a
sore thumb using this method of review.

Now with that said, the nice thing about a flexible tool is that you can
use it any way that makes the most sense to you. The above works for me,
your mileage may vary. ;-)

> 2.  I tried applying rules like these with -p all and I ended up 
> trapping all kinds of local ICMP traffic and broke lots of things. 

Humm. TCP is the only protocol (that I'm aware of) that actually uses
flags, so this would be hard to do with other transports. For example
you can't identify state with UDP, just direction and port. The problem
with logging all invalid this way is that you end up throwing everything
that does not hit a permitted port into the same bit bucket. For
example:

iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 1024:65535 -d 0/0
--dport 1433:1434 -j LOG --log-prefix " MS_SQL "
iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 1024:65535 -d 0/0
--dport 1433:1434 -j REJECT --reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 500 -d 0/0 --dport 500
-j LOG --log-prefix " IPSEC_SCAN "
iptables -A FORWARD -i eth0 -p udp -s 0/0 --sport 500 -d 0/0 --dport 500
-j REJECT --reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p udp -d 0/0 --dport 135:139 -j LOG
--log-prefix " MS_CRAP "
iptables -A FORWARD -i eth0 -p udp -d 0/0 --dport 135:139 -j REJECT
--reject-with icmp-host-unreachable

Again, this just allows me to segregate all my traffic based on specific
patterns so its easier to review. I use grep to extract these entries in
a similar fashion to what I described about. 

To give you an idea how effective this is, on an average day I generate
70-80 MB worth of firewall log entries. Its not uncommon to have all of
this traffic, except for maybe 100 KB, extracted into its own file. This
means that I go from having 80 MB to 100 KB of log files that I actually
have to put my thinking cap on to review. The rest is done
automagically.

As for breaking ICMP and others, could be you ended up letting through
established traffic, but not related (related being ICMP type 3's, 4's,
5's and 11's). A quick review of your rules should show you if this is
the case.

HTH!
C



