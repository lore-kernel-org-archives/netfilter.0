From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Sat, 1 Oct 2005 20:03:35 +0200
Message-ID: <200510012003.35387.marek.zachara@conexe.pl>
References: <200510011806.52191.marek.zachara@conexe.pl>
	<200510011827.15384.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510011859560.15331@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510011859560.15331@filer.marasystems.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Saturday 01 of October 2005 19:06, you wrote:
> On Sat, 1 Oct 2005, Marek Zachara wrote:
> > Anyway, i have just noticed that not only POSTROUTING but also PREROUTING
> > in the NAT table don't match packets as they should. So probably the
> > issue is related to NAT table.
>
> The NAT table is a bit special. This table only sees the very first packet
> of each new conntrack session. For all consequtive packets of the same
> session the same NAT rules is automatically used.
>
OK, i understand this. But still can't it make to work.
I'm trying to get asterisk IAX protocol to be routed properly. This is UDP 
packets destined for port 4569. I need them to be sent out from the box at 
eth1 with source 192.168.100.1 (internal net at eth0 is 10.0.0.0/24)

the nat/postrouting table looks like this (i waited for about 10 minutes to 
make sure the UDP conntrack 'session' is reseted):

Chain POSTROUTING (policy ACCEPT 2454 packets, 136K bytes)
 pkts bytes target     prot opt in     out     source               
destination
    0     0 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpt:1194 to:192.168.100.1
    0     0 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpt:5060 to:192.168.100.1
    1    53 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 to:192.168.100.1
    0     0 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpt:3478 to:192.168.100.1
   84  5040 SNAT       tcp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
tcp dpts:1024:32000 to:192.168.100.2
  248 13976 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpts:1024:32000 to:192.168.100.2
    0     0 SNAT       all  --  *      eth1    10.0.0.251           0.0.0.0/0           
to:192.168.100.2
  106  6783 SNAT       all  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
to:192.168.100.3

but if i run a tcpdump:

irongate:~# tcpdump -ni eth1 udp port 4569
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
19:56:41.784463 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP, length: 25
19:56:43.785641 IP 10.0.0.250.4569 > 84.16.64.240.4569: UDP, length: 25

2 packets captured
2 packets received by filter
0 packets dropped by kernel


so the packets still leave the box with the source 10.0.0.250 (and not 
192.168.100.1 as I want them to). 

Any suggestions what i could be doing wrong?

Marek


