From: <bigman@monster-solutions.net>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Sun, 27 Oct 2002 03:58:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c27d96$fafd0ed0$8f33e40f@lsmith5953>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <20021027080906.OMSF9836.mta01-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

I am running DHCRELAY as below

dhcrelay -i eth2 192.168.1.70

192.168.1.70    DHCP Server (W2K)
LAN1 192.168.1.0
LAN2 192.168.2.0

Here is my routing tables
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.2.0     *               255.255.255.0   U     0      0        0 eth2
192.168.1.0     *               255.255.255.0   U     0      0        0 eth1
x.x.x.x (ISP Subnet)     *               255.255.252.0   U     0      0
0 eth0
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
default         x.x.x.x (ISP Assigned IP) 0.0.0.0         UG    0      0
0 eth0

Here are my Netfilter settings

Chain INPUT (policy DROP 84 packets, 6522 bytes)
 pkts bytes target     prot opt in     out     source
destination
 2402  839K lan1-in    all  --  eth1   *       0.0.0.0/0
0.0.0.0/0
 4468  730K ext-int-in  all  --  eth0   *       0.0.0.0/0
0.0.0.0/0
 9283 1160K lan2-in    all  --  eth2   *       0.0.0.0/0
0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
67892   42M lan1-lan2-fwd  all  --  eth1   eth2    0.0.0.0/0
0.0.0.0/0
54339 7531K lan2-lan1-fwd  all  --  eth2   eth1    0.0.0.0/0
0.0.0.0/0
 133K  153M ext-int-fwd  all  --  eth0   *       0.0.0.0/0
0.0.0.0/0
50699 4126K lan1-ext-fwd  all  --  eth1   *       0.0.0.0/0
0.0.0.0/0
35220   30M lan2-ext-fwd  all  --  eth2   *       0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy DROP 172 packets, 19408 bytes)
 pkts bytes target     prot opt in     out     source
destination
  817  133K lan1-lan2  all  --  *      eth2    0.0.0.0/0
0.0.0.0/0
 2507  381K ACCEPT     all  --  *      eth0    0.0.0.0/0
0.0.0.0/0
 1351  337K ACCEPT     all  --  *      *       192.168.1.0/24
0.0.0.0/0
   60  3600 ACCEPT     tcp  --  *      *       0.0.0.0/0            x.x.x.x
(ISP Assigned IP)

Chain ext-int-fwd (1 references)
 pkts bytes target     prot opt in     out     source
destination
    133K  153M ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED
    0     0 DROP       all  --  eth0   *       0.0.0.0/0
0.0.0.0/0

Chain ext-int-in (1 references)
 pkts bytes target     prot opt in     out     source
destination
  2681  201K ACCEPT     all  --  eth0   *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED
    1432  483K DROP       all  --  eth0   *       0.0.0.0/0
0.0.0.0/0

Chain lan1-ext-fwd (1 references)
 pkts bytes target     prot opt in     out     source
destination
50699 4126K ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED
    0     0 DROP       all  --  eth1   *       0.0.0.0/0
0.0.0.0/0

Chain lan1-in (1 references)
 pkts bytes target     prot opt in     out     source
destination
 2387  834K ACCEPT     all  --  eth1   *       192.168.1.0/24
0.0.0.0/0
   15  4920 DROP       all  --  eth1   *       0.0.0.0/0
0.0.0.0/0

Chain lan1-lan2 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     udp  --  *      eth2    0.0.0.0/0
0.0.0.0/0          udp dpt:68
  595 99614 ACCEPT     all  --  *      eth2    0.0.0.0/0
192.168.2.0/24     state RELATED,ESTABLISHED
  222 33821 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain lan1-lan2-fwd (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     udp  --  *      eth2    0.0.0.0/0
192.168.2.105      udp dpt:6257
    0     0 ACCEPT     tcp  --  *      eth2    0.0.0.0/0
192.168.2.105      tcp dpt:6699
67463   42M ACCEPT     all  --  *      eth2    0.0.0.0/0
192.168.2.0/24     state RELATED,ESTABLISHED
  429  385K DROP       all  --  *      eth2    0.0.0.0/0
0.0.0.0/0

Chain lan2-ext-fwd (1 references)
 pkts bytes target     prot opt in     out     source
destination
35220   30M ACCEPT     all  --  eth2   *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED
    0     0 DROP       all  --  eth2   *       0.0.0.0/0
0.0.0.0/0

Chain lan2-in (1 references)
 pkts bytes target     prot opt in     out     source
destination
  109 37146 ACCEPT     udp  --  eth2   *       0.0.0.0/0
0.0.0.0/0          udp dpt:67
 9173 1123K ACCEPT     all  --  eth2   *       192.168.2.0/24
0.0.0.0/0
    1   328 DROP       all  --  eth2   *       0.0.0.0/0
0.0.0.0/0

Chain lan2-lan1-fwd (1 references)
 pkts bytes target     prot opt in     out     source
destination
54339 7531K ACCEPT     all  --  eth2   eth1    0.0.0.0/0
0.0.0.0/0
    0     0 DROP       all  --  eth2   eth1    0.0.0.0/0
0.0.0.0/0

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, October 27, 2002 3:09 AM
Subject: Re: DHCRELAY through IPTABLES Firewall


> On Sunday 27 October 2002 4:33 am, bigman@monster-solutions.net wrote:
>
> > All,
> >     I am wondering if someone out there would be so kind as to help me
> > figure out why I cannot get DHCRELAY to relay DHCP requests from one LAN
> > segment to another LAN segment where a Windows 2000 DHCP server resides.
I
> > have verified that the requests are hitting the DHCRELAY on 67/UDP and
then
> > the DHCRELAY is trying to send back out on ETH2 (LAN2 Segment) to the
DHCP
> > Server on LAN1, but there is nothing after that. I have used Snort in
> > sniffer mode and I can see UDP traffic on 68/UDP and 67/UDP on LAN2, but
I
> > never see any on LAN1. So my guess is that for some reason it is not
> > routing through the firewall correctly. Any help would be greatly
> > appreciated.
>
> Tell us:
>
> 1. Your netfilter rules
>
> 2. Your network addresses for LAN1 and LAN2.
>
> 3. The routing table on the firewall.
>
> 4. Your dhcrelay command line.
>
> Antony.
>
> --
>
> If at first you don't succeed, destroy all the evidence that you tried.
>


