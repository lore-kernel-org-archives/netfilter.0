From: "Massimo Balestra" <m.balestra@reply.it>
Subject: udp packet on port 111
Date: Wed, 14 May 2003 15:29:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004401c31a1c$d16b6a30$01640d0a@replynet.prv>
References: <004001c31a0a$5cf103c0$09603fca@Housecall>
Reply-To: <m.balestra@reply.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004001c31a0a$5cf103c0$09603fca@Housecall>
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
To: netfilter@lists.samba.org


Hi everybody,

I have problem with iptables and maybe somebody can help me to find a
solution.

I need to connect to another network through a ppp connection.

What I did has been: to set the ppp connection and set iptables to forward
the packets with the remote network as destination to the ppp.
Then I set the route of my pc using the linux machine as the gateway.

Everything works well, http, ssh, xwindows, is all OK. I can also enter into
a Cisco VPN in the remote network.
There is only one application that does not work.

I don't know how this application is done. I simply did a tcpdump while I
was using this application.
Note: the ping from my pc to the destination server works. Only this
application doesn't. Unfortunately it is a windows application. Looks that
this application receives and sends udp packets but they are not forwarded
correctly.

Here is the tcpdump / windump result. (sunrpc is port 111)

------------------------------
on the gateway machine:
tcpdump -i ppp0

15:02:30.528227 10.5.17.21.1491 > 10.21.109.84.sunrpc:  udp 56
15:02:30.675801 10.21.109.46.sunrpc > 10.5.17.21.1491:  udp 28 (DF)
15:02:30.675840 10.5.17.21 > 10.21.109.46: icmp: 10.5.17.21 udp port 1491
unreachable [tos 0xc0]
15:02:45.530046 10.5.17.21.1491 > 10.21.109.84.sunrpc:  udp 56
15:02:45.728534 10.21.109.46.sunrpc > 10.5.17.21.1491:  udp 28 (DF)
15:02:45.728564 10.5.17.21 > 10.21.109.46: icmp: 10.5.17.21 udp port 1491
unreachable [tos 0xc0]
15:03:15.548364 10.5.17.21.1491 > 10.21.109.84.sunrpc:  udp 56
15:03:15.683612 10.21.109.46.sunrpc > 10.5.17.21.1491:  udp 28 (DF)
15:03:15.683641 10.5.17.21 > 10.21.109.46: icmp: 10.5.17.21 udp port 1491
unreachable [tos 0xc0]

-----------------------
On my pc:
windump -p udp
15:03:10.320679 IP platone.replynet.prv.1491 > ttsat.111: udp 56
15:03:25.319739 IP platone.replynet.prv.1491 > ttsat.111: udp 56
15:03:55.332502 IP platone.replynet.prv.1491 > ttsat.111: udp 56

Can someone help me?
Thanks

Massimo


