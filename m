From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: redesigning my firewall -- concepts and suggestions for a more
	structured layout
Date: 26 Sep 2003 07:09:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064574552.1067.25.camel@valhalla>
References: <200309260031.17968.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309260031.17968.Alistair@nerdnet.ca>
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
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

On Fri, 2003-09-26 at 00:31, Alistair Tonner wrote:
>
> 	My firewall has over time 	
> 	modified and grown, and twiddled its way into a morass of rules that last
> 	week gave me utter fits when I inserted a rule in which I goofed, and b0rked
> 	the internal network filesharing system.  And couldn't see it right off as to 
> 	why ... 

One of the things I'm big on is testing policies when ever changes get
made. The old "nmap on one side, tcpdump on the other" to verify the
policy is what you expect it to be. I've caught a lot of nasty stuff
that way (like accidentally permitting the DNS on the DMZ to access
TCP/UDP 53 on all internal systems).

> 	I am endevouring to remake the basic "my multi-pc home lan needs
> 	a firewall" firewall into something more organized, and I intend, as an
> 	exercise to write it *cough* myself.  My question is .... given the above
> 	basic premise, and a DROP default policy across all chains, Is it more
> 	effcient, processing wise, to have all the rules in a flat line, or, since it
> 	can make things easier to debug, have it parsed up in user chains.

Unless you are talking a lot of rules (like a few hundred given decent
hardware) I think this is a personal choice. Really it comes down to
your thought process, is it liniar or multitask? If the former, keep the
rules in a row. If the latter, break them up what ever way makes the
most sense to you. The idea is to keep the rule base clear enough that
you don't shoot yourself in the foot. ;-)

> 	My logic is this.  I can break my network traffic flow into 6 directionally
> 	oriented chains ( internet to server, internet to lan, lan to server, lan to
> 	internet, server to internet, and server to lan) ... I *feel* that it makes
> 	better logical sense to setup user chains for each direction, and 
> 	*then* have, at the top of each directional chain a jump to a chain
> 	that handles things that go in all directions ( i.e. established related 
> 	and dns and things), then append rules that apply to that specific direction.

If this makes the most sense to you and will help you keep the flow
straight, do it this way. :-)

> 	From a system load perspective I recall that minimizing the number of rules
> 	a packet must traverse lowers load.  Does my logic fall down somehwere here
> 	that I am missing? 

Not at all. First off, this rule is a little fuzzy in that the break
point is at different spots for different firewalls. For example I've
seen a performance increase with Cisco IOS by reordering as few as 50
rules. I've reordered 500+ rules on Netscreen 1000's with no noticable
difference in performance.

The break point for Netscreen (in my experience) is around 150-200
rules. Hit that number of rules and it might make sense to reorder for
performance reasons. Your mileage may vary. 

Now with all that said, I think your idea makes a lot of sense and would
certainly help to minimize the number of rules that get processed.
Again, unless you are talking 150+ rules, the big thing you want to
focus on is setting up the rules in a way that makes sense to you. If
breaking it out by direction fits that for you, then that's the way to
go.

> 	Is the use of -m multiport to put several accepted ports into one rule an 
> 	imporovement in efficiency (a la fewer rules to traverse) or a burden based
> 	on something in the multiport code adding load?

Its a different purpose. If you are looking to process connection
establishment to multiple ports in a single rule, something like:
iptables -A INPUT -i eth0 -p tcp -d 0/0 --dport 135:139 -j LOG
--log-prefix " MS_CRAP "

will do the trick. The multiport option is designed to match people
hitting multiple server ports, for example during a port scan.

> 	Please don't suggest any packages that setup rules for me.  I want the
> 	challenge of doing this m'self. (with a little input from the list of course)

Would not think of it. ;-)

One thing I would suggest however is a set of rules that makes the log
review process a bit easier however. I have a bunch of rules like this:

iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN -d 0/0 --dport
17300 -j LOG --log-prefix " KUANG2_SCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN -d 0/0 --dport
17300 -j REJECT --reject-with icmp-host-unreachable
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j LOG
--log-prefix " SYNFINSCAN "
iptables -A FORWARD -i eth0 -p tcp --tcp-flags ALL SYN,FIN -j REJECT
--reject-with icmp-host-unreachable

Now each morning I run a cron job that is basically a bunch of grep
commands that puts all kang2 traffic in a single file, synfinscans in a
single file, etc. I then focus on the interesting stuff that is left
over that I don't have a label for. This makes log review go 8much*
faster.

HTH,
C



