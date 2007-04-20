From: "Simon Olofsson" <simon.olofsson@gmail.com>
Subject: Failed to establish TCP connection when Masqueradeing
Date: Fri, 20 Apr 2007 16:45:55 +0200
Message-ID: <600b8cdc0704200745x5509ccdw807a866f997224b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=XyVDDkNToaMPshNrFzFSqOwRjrfmKvkBFxdSCkoMdFzWV8AnSmhaFr9LF+KW/wNytoPORawtPG30QjJwD1x3sHzRAlhXuBMdGHwr9myKvqLHouQXhzZ0XzMgwPqt16PjVBFqO4YlApPBlvw14OpTiM2N/m9wxPo29b2W2LOxHNE=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I have a problem with my configuration that I need some help with.

The host I am using have two interfaces, one ethernet interface and
one ppp interface.

I would like all traffic to use the ethernet interface except traffic
from a specific user. I would like the traffic from this specific user
to use the ppp interface.

When I try to establish a TCP connection from the specified user I see
that the syn packet is sent out on the correct interface with the
correct source address and the syn,ack is received, but it seems like
the syn,ack is lost somewhere on my host because a new syn is sent
after a while.

What is missing?
/Simon


My configuration:

# Add  rule that marked traffic shall used the table
ip rule add prio 200 fwmark 1 table 1

# Add default route to a new routing table.
ip route add default dev ppp0 tab 1

# Add NAT to ppp interface
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

# Specify which packets should use the table specified above.
iptables -t mangle -A OUTPUT -m owner --uid-owner tcg -j MARK --set-mark 1

NAT table:
Chain PREROUTING (policy ACCEPT 148 packets, 7512 bytes)
pkts bytes target     prot opt in     out     source
destination

Chain POSTROUTING (policy ACCEPT 113 packets, 11828 bytes)
pkts bytes target     prot opt in     out     source
destination
    0     0 MASQUERADE  all  --  *      ppp0    0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 164 packets, 14983 bytes)
pkts bytes target     prot opt in     out     source
destination



MANGLE table
Chain PREROUTING (policy ACCEPT 217K packets, 61M bytes)
pkts bytes target     prot opt in     out     source
destination

Chain INPUT (policy ACCEPT 223K packets, 61M bytes)
pkts bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 281K packets, 38M bytes)
pkts bytes target     prot opt in     out     source
destination
    0     0 MARK       all  --  *      *       0.0.0.0/0
0.0.0.0/0           OWNER UID match 1000 MARK set 0x1

Chain POSTROUTING (policy ACCEPT 281K packets, 38M bytes)
pkts bytes target     prot opt in     out     source
destination

ifconfig:
eth0      Link encap:Ethernet  HWaddr 00:40:63:E8:11:6A
          inet addr:192.168.115.4  Bcast:192.168.115.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:233357 errors:0 dropped:0 overruns:0 frame:0
          TX packets:269612 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:64151807 (61.1 Mb)  TX bytes:40208375 (38.3 Mb)
          Interrupt:16 Base address:0xe000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:23 errors:0 dropped:0 overruns:0 frame:0
          TX packets:23 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:1468 (1.4 Kb)  TX bytes:1468 (1.4 Kb)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:10.145.56.112  P-t-P:10.0.0.2  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:9 errors:0 dropped:0 overruns:0 frame:0
          TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:84 (84.0 b)  TX bytes:96 (96.0 b)


ip rule show:
0: from all lookup local
200: from all fwmark 0x1 lookup 1
32766: from all lookup main
32767: from all lookup default


route:
10.0.0.2 dev ppp0  proto kernel  scope link  src 10.145.56.112
192.168.115.0/24 dev eth0  proto kernel  scope link  src 192.168.115.4
default via 192.168.115.1 dev eth0


ip route show table 1:
default dev ppp0  scope link

