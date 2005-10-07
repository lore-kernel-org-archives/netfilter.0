From: Marek Zachara <marek.zachara@conexe.pl>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Fri, 7 Oct 2005 14:07:58 +0200
Message-ID: <200510071407.58851.marek.zachara@conexe.pl>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510041237.57236.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510061846210.31577@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510061846210.31577@filer.marasystems.com>
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

On Thursday 06 of October 2005 18:47, you wrote:
> On Tue, 4 Oct 2005, Marek Zachara wrote:
> > Just to make sure, i have compiled kernel 2.4.31 and also switched back
> > to 1.2.11 iptables. But nothing changed. Still the packets don't get
> > SNAT-ed and there has been no hit on SNAT rule for about an hour (packets
> > are sent every ten seconds or so). This only applies to UDP packets.
>
> Any more details on these UDP packets, combined with what matching
> sessions you have in /proc/net/ip_conntrack?
>

Here is hex packet dump at outgoing interface:
irongate:~# tcpdump -xx -ni eth1 udp port 4569
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
13:54:00.826562 IP 10.0.0.250.4569 > 83.16.54.250.4569: UDP, length: 12
        0x0000:  0050 da48 557b 0050 ba54 c1e6 0800 4510  .P.HU{.P.T....E.
        0x0010:  0028 19f0 4000 3f11 8cc1 0a00 00fa 5310  .(..@.?.......S.
        0x0020:  36fa 11d9 11d9 0014 70d9 8001 0000 0000  6.......p.......
        0x0030:  4e33 0200 0602                           N3....
13:54:00.826663 IP 10.0.0.250.4569 > 83.16.54.250.4569: UDP, length: 12
        0x0000:  0050 da48 557b 0050 ba54 c1e6 0800 4510  .P.HU{.P.T....E.
        0x0010:  0028 19f1 4000 3f11 8cc0 0a00 00fa 5310  .(..@.?.......S.
        0x0020:  36fa 11d9 11d9 0014 6fcd 8001 0000 0000  6.......o.......
        0x0030:  4e36 0300 060b                           N6....
13:54:02.828069 IP 10.0.0.250.4569 > 83.16.54.250.4569: UDP, length: 12
        0x0000:  0050 da48 557b 0050 ba54 c1e6 0800 4510  .P.HU{.P.T....E.
        0x0010:  0028 19f2 4000 3f11 8cbf 0a00 00fa 5310  .(..@.?.......S.
        0x0020:  36fa 11d9 11d9 0014 f0d8 8001 8000 0000  6...............
        0x0030:  4e33 0200 0602                           N3....
13:54:02.828163 IP 10.0.0.250.4569 > 83.16.54.250.4569: UDP, length: 12
        0x0000:  0050 da48 557b 0050 ba54 c1e6 0800 4510  .P.HU{.P.T....E.
        0x0010:  0028 19f3 4000 3f11 8cbe 0a00 00fa 5310  .(..@.?.......S.
        0x0020:  36fa 11d9 11d9 0014 efcc 8001 8000 0000  6...............
        0x0030:  4e36 0300 060b                           N6....
13:54:02.828239 IP 10.0.0.250.4569 > 83.16.54.250.4569: UDP, length: 12
        0x0000:  0050 da48 557b 0050 ba54 c1e6 0800 4510  .P.HU{.P.T....E.
        0x0010:  0028 19f4 4000 3f11 8cbd 0a00 00fa 5310  .(..@.?.......S.
        0x0020:  36fa 11d9 11d9 0014 18e0 8001 8000 0000  6...............
        0x0030:  2723 0100 060b                           '#....
13:54:02.828316 IP 10.0.0.250.4569 > 83.16.54.250.4569: UDP, length: 25
        0x0000:  0050 da48 557b 0050 ba54 c1e6 0800 4510  .P.HU{.P.T....E.
        0x0010:  0035 19f5 4000 3f11 8caf 0a00 00fa 5310  .5..@.?.......S.
        0x0020:  36fa 11d9 11d9 0021 4581 8001 8000 0000  6......!E.......
        0x0030:  0012 0000 060d 0607 7065 7267 6f6c 6513  ........pergole.
        0x0040:  0200 3c                                  ..<

6 packets captured
387 packets received by filter
0 packets dropped by kernel

here is the conntrack entry:
irongate:~# cat /proc/net/ip_conntrack |grep 4569
udp      17 28 src=10.0.0.250 dst=83.16.54.250 sport=4569 dport=4569 
[UNREPLIED] src=83.16.54.250 dst=10.0.0.250 sport=4569 dport=4569 use=1

the counter at iptables got only 8 packets, but the router has been up for 
about 6 hours and these packets are being sent every few seconds:

Chain POSTROUTING (policy ACCEPT 73434 packets, 3691K bytes)
 pkts bytes target     prot opt in     out     source              destination
    8   704 SNAT       udp  --  *      eth1    0.0.0.0/0            0.0.0.0/0           
udp dpt:4569 to:192.168.100.1


thanks for the help
Marek

P.S. Here are more details if you need them:
https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=390


