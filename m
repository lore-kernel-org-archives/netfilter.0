From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: are these enough now?
Date: Mon, 7 Oct 2002 10:53:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210070953.g979rnL13980@vulcan.rissington.net>
References: <200210041218.26636@.> <20021004191400.YGEY459.mta02-svc.ntlworld.com@there> <20021004203205.GA21206@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021004203205.GA21206@Ajftl1.ajfthome.on.ca>
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

On Friday 04 October 2002 9:32 pm, Alistair Tonner wrote:

> 	Antony ... My icmp chain ... (seems to work for me,
> 	and you can toss in limit rules as well)
>
>
> # $IPTABLES -A icmp_packets -j LOG --log-level 4 --log-prefix "IPT icmp
> IN:"
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 0 -j ACCEPT
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 3 -j ACCEPT
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 5 -j ACCEPT
> $IPTABLES -A icmp_packets -p ICMP -s 0/0 --icmp-type 11 -j ACCEPT
> # $IPTABLES -A icmp_packets -j LOG --log-level DEBUG --log-prefix "IPT
> icmp DROP :"
> $IPTABLES -A icmp_packets -j DROP

Interesting.   You're allowing ICMP message types 0, 3, 5 and 11....

0 is echo reply
3 is destination unreachable
5 is redirect
11 is time exceeded

Comments:

1. Why allow echo reply if you don't also allow echo request (type 8) ?

2. I think you should also allow source quench (type 4) so that systems can 
slow each other down if they start sending too fast.

Out of interest, what sort of log entries do you see from the "log just 
before dropping the rest" rule ?

Antony.

-- 

Most people have more than the average number of legs.

