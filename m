From: "CARRY Gilles" <gilles.carry@volubill.com>
Subject: RE: Accessing physical subnets with same address range via asingle
	gateway
Date: Wed, 24 Nov 2004 10:50:10 +0100
Message-ID: <1C888AFC989D0E45BA0417091408E23199F097@saturne.volubill.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

Hi,

After a long time ...

Actually, I did this:

Eth0 is 192.168.1.62/24 (GN)

From eth0 172.20.32.0/24 NAT to 172.16.32.0/24 via eth1
From eth0 172.24.32.0/24 NAT to 172.16.32.0/24 via eth2

I set eth1 to 172.16.32.101 and eth2 to 172.16.32.102
The devices I try to reach are from eth1 and eth2 are on different lans
but have both same IP: 172.16.32.10

# iptables -t mangle -L PREROUTING -n -v
Chain PREROUTING (policy ACCEPT 4976 packets, 332K bytes)
 pkts bytes target     prot opt in     out     source
destination
  104  4428 MARK       all  --  eth0   *       0.0.0.0/0
172.20.32.0/24      MARK set 0x1
   21  1008 MARK       all  --  eth0   *       0.0.0.0/0
172.24.32.0/24      MARK set 0x2

# iptables -t nat -L PREROUTING -n -v
Chain PREROUTING (policy ACCEPT 3425 packets, 179K bytes)
 pkts bytes target     prot opt in     out     source
destination
    5   240 NETMAP     all  --  eth0   *       0.0.0.0/0
172.20.32.0/24      172.16.32.0/24
    7   336 NETMAP     all  --  eth0   *       0.0.0.0/0
172.24.32.0/24      172.16.32.0/24

# ip rule sh
0:      from all lookup local
32764:  from all fwmark        2 lookup dup2
32765:  from all fwmark        1 lookup dup1
32766:  from all lookup main
32767:  from all lookup default

# ip route sh
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.62
172.16.32.0/24 dev eth1  proto kernel  scope link  src 172.16.32.101
172.16.32.0/24 dev eth2  proto kernel  scope link  src 172.16.32.102
default via 192.168.1.254 dev eth0
# ip route sh table dup1
172.16.32.0/24 dev eth1  scope link
# ip route sh table dup2
172.16.32.0/24 dev eth2  scope link



I had to add this because the 172.16.32.10 devices don't now about the
GN IP
# iptables -t nat -L POSTROUTING -n -v
Chain POSTROUTING (policy ACCEPT 22 packets, 1541 bytes)
 pkts bytes target     prot opt in     out     source
destination
    5   240 SNAT       all  --  *      eth1    0.0.0.0/0
172.16.32.0/24      to:172.16.32.101
    7   336 SNAT       all  --  *      eth2    0.0.0.0/0
172.16.32.0/24      to:172.16.32.102






From GN, accessing 172.20.32.10 (eth1) works fine but accessing
172.24.32.10 (eth2) hangs.
tcpdump -i eth2 net 172.16.32.0/24
keep saying :
09:36:12.367244 IP 172.16.32.102.29484 > 172.16.32.10.telnet: S
4289271084:4289271084(0) win 65535 <mss 1380,nop,nop,sackOK>
09:36:12.370088 arp who-has 172.16.32.102 tell 172.16.32.10
09:36:14.369237 arp who-has 172.16.32.102 tell 172.16.32.10

And then telnet times out.

The gateway does not answer to the arp requests from the B device.
Is there any kind of arp conflict in the gateway (2 MAC for 1 IP)?

Any clue?


> >                      gateway
> >
> > (general network:GN) - eth0
> >
> >                        eth1  ---- (equipments A: subnet=3D
172.16.32.0/24)
> >
> >                        eth2  ---- (equipments B: subnet=3D
172.16.32.0/24)



