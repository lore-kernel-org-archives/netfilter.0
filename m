From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: help iptables queuing
Date: Wed, 18 Jun 2003 21:36:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDCEONNEAA.georgev@citadelcomputer.com.au>
References: <20030618104833.68889.qmail@mail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
in-reply-to: <20030618104833.68889.qmail@mail.com>
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
To: Paridhi Bansal <paridhibansal@mail.com>, IPtables <netfilter@lists.netfilter.org>

embeded

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Paridhi Bansal
Sent: Wednesday, June 18, 2003 8:49 PM
To: IPtables
Subject: Re: help iptables queuing


hi

>how do i check that whether conn tracking module is installed or not??
do a `lsmod` and check the list

Actually, this problem was not coming earlier..suddenly has it statred
coming..now what is really puzzling me is that when i also queue packets
from FORWARD chain(i did this just to check in case pkts were being directly
sent to this chain instead of prerouting), i receive all the packets through
prerouting, forward and postrouting chains..and when i change the FORWARD
back to ACCEPT all without queuing, again,the same problem..i receive only
the first pktof every TCP session in prerouting and postrouting chains....
> Don't know what exactly the problem is but I use MRTG with Iptables so I
can graph all traffic based on rules in the -N MRTG space... and it all
works fine for me.
I use `-I INPUT 1 -j MRTG` , `-I FORWARD 1 -j MRTG` , `-I OUTPUT 1 -j MRTG`
and that grabs everything.

So I don't know why yours doesn't....


