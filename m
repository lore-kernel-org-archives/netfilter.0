From: Jason Opperisano <opie@817west.com>
Subject: RE: Accessing physical subnets with same address range via asingle
	gateway
Date: Wed, 24 Nov 2004 10:45:07 -0500
Message-ID: <1101311107.3687.37.camel@hubcap.ljm.dom>
References: <1C888AFC989D0E45BA0417091408E23199F097@saturne.volubill.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1C888AFC989D0E45BA0417091408E23199F097@saturne.volubill.com>
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

On Wed, 2004-11-24 at 04:50, CARRY Gilles wrote:
> Hi,
> 
> After a long time ...
> 
> Actually, I did this:
> 
> Eth0 is 192.168.1.62/24 (GN)
> 
> >From eth0 172.20.32.0/24 NAT to 172.16.32.0/24 via eth1
> >From eth0 172.24.32.0/24 NAT to 172.16.32.0/24 via eth2
> 
> I set eth1 to 172.16.32.101 and eth2 to 172.16.32.102
> The devices I try to reach are from eth1 and eth2 are on different lans
> but have both same IP: 172.16.32.10
> 
> # iptables -t mangle -L PREROUTING -n -v
> Chain PREROUTING (policy ACCEPT 4976 packets, 332K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>   104  4428 MARK       all  --  eth0   *       0.0.0.0/0
> 172.20.32.0/24      MARK set 0x1
>    21  1008 MARK       all  --  eth0   *       0.0.0.0/0
> 172.24.32.0/24      MARK set 0x2
> 
> # iptables -t nat -L PREROUTING -n -v
> Chain PREROUTING (policy ACCEPT 3425 packets, 179K bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     5   240 NETMAP     all  --  eth0   *       0.0.0.0/0
> 172.20.32.0/24      172.16.32.0/24
>     7   336 NETMAP     all  --  eth0   *       0.0.0.0/0
> 172.24.32.0/24      172.16.32.0/24
> 
> # ip rule sh
> 0:      from all lookup local
> 32764:  from all fwmark        2 lookup dup2
> 32765:  from all fwmark        1 lookup dup1
> 32766:  from all lookup main
> 32767:  from all lookup default
> 
> # ip route sh
> 192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.62
> 172.16.32.0/24 dev eth1  proto kernel  scope link  src 172.16.32.101
> 172.16.32.0/24 dev eth2  proto kernel  scope link  src 172.16.32.102

i *think* you need to delete those two routes (per my original post).

> default via 192.168.1.254 dev eth0
> # ip route sh table dup1
> 172.16.32.0/24 dev eth1  scope link
> # ip route sh table dup2
> 172.16.32.0/24 dev eth2  scope link
> 
> 
> 
> I had to add this because the 172.16.32.10 devices don't now about the
> GN IP
> # iptables -t nat -L POSTROUTING -n -v
> Chain POSTROUTING (policy ACCEPT 22 packets, 1541 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     5   240 SNAT       all  --  *      eth1    0.0.0.0/0
> 172.16.32.0/24      to:172.16.32.101
>     7   336 SNAT       all  --  *      eth2    0.0.0.0/0
> 172.16.32.0/24      to:172.16.32.102

eek...ok...

> >From GN, accessing 172.20.32.10 (eth1) works fine but accessing
> 172.24.32.10 (eth2) hangs.
> tcpdump -i eth2 net 172.16.32.0/24
> keep saying :
> 09:36:12.367244 IP 172.16.32.102.29484 > 172.16.32.10.telnet: S
> 4289271084:4289271084(0) win 65535 <mss 1380,nop,nop,sackOK>
> 09:36:12.370088 arp who-has 172.16.32.102 tell 172.16.32.10
> 09:36:14.369237 arp who-has 172.16.32.102 tell 172.16.32.10

i would venture to guess that if you tcpdump on eth1--you'll see that
the arp replies are going out eth1 because of the route above.

if a local link route doesn't exist for the source IP in an arp
request--it will just respond out the interface the request was received
on.  i just tested this on a 2.4.27 kernel, and it worked that way at
least.

-j

--
"'Wet Cement' - is there any sweeter sign?  Maybe 'High Voltage.'"
	--The Simpsons


