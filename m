From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Quick Routing question
Date: Tue, 4 Mar 2003 21:47:31 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303042141190.7613@dns.toxicfilms.tv>
References: <016701c2e28a$239fbab0$1f0016ac@daviddesktop>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <016701c2e28a$239fbab0$1f0016ac@daviddesktop>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Ruggles <david@safedatausa.com>
Cc: netfilter@lists.netfilter.org

> I would expect to see the POSTROUTING chain counter increment for each ping
> packet, but it doesn't. (It will increment if I ping from the Linux box to
> B)
So maybe the router does not have
/proc/sys/net/ipv4/ip_forward turn on?
and /proc/sys/net/ipv4/conf/*/forwarding on.

> Any suggestions?
Doing NAT is here unnecesary, but i think you are playing with it to test
NAT. :)
Do you have ipt_conntrack loaded?
Check forwarding in sysctl.
Check the default routes on the boxes.
Tcpdump the traffic on the router once on eth1, then on eth2, you'll find
out where the problem is: is the router routing the packets, or maybe when
the replies come back, they do not get routed.

> David Ruggles
Maciej Soltysiak

-----BEGIN GEEK CODE BLOCK-----
VERSION: 3.1
GIT/MU d-- s:- a-- C++ UL++++$ P L++++ E- W- N- K- w--- O! M- V- PS+ PE++
Y+ PGP- t+ 5-- X+ R tv- b DI+ D---- G e++>+++ h! y?
-----END GEEK CODE BLOCK-----

