From: "semi linux" <linuxsemi@gmail.com>
Subject: Bridge, DNAT, New Tables and ip rules
Date: Fri, 15 Jun 2007 12:04:58 -0700
Message-ID: <e53321d30706151204x295b6282we82287bf0f685bdd@mail.gmail.com>
References: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>
	<466DE959.8020609@riverviewtech.net>
	<e53321d30706121212r3dabccb2na62e2c07c2b3902b@mail.gmail.com>
	<4670BA44.9010802@riverviewtech.net>
	<e53321d30706151152h1d395529iabb310024017096@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=NMJXb901HnWGLULGhIvHc0Ho0vNiNl97K3aL2whprYhLJHxvDbkeQ1r+wHeH1azVYFwxL+7pXe+Y1vd59UFYvS4+Dk2vFr7WhzXSuWu5lSLVq/2GrQ47zBPCt1hZVlJ5cTY2VAM3BouD/IoV+lHmLrXR4B+OvYsraEjRnBhQPBU=
In-Reply-To: <e53321d30706151152h1d395529iabb310024017096@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>
Cc: Grant Taylor <gtaylor@riverviewtech.net>

Sorry, I sent this in HTML first by mistake... needed to switch to a
block font to do the ASCII art.

On 6/13/07, Grant Taylor <gtaylor@riverviewtech.net> wrote:
 > Do you really have that many interfaces, or are you just skipping a
> bunch of interfaces?

Oh, I'm skipping a bunch... 50 and 51 just denote the interfaces we
always use for the bridge.

> Does this rule ever match any packets?

 Not in my current setup, but I think it's for an alternate setup, in
any case, I'm not worried about it right now.

> Baring in mind that (by default) Linux will (primarily) use one
> interface on a subnet unless you do something to alter it.  To this end
> I think you will need to match based on Dan's IP be it source or
> destination.

Hrmm, that _might_ be it but I'm not convinced.  There are three
conditions which need to be satisfied:
 - bridge traffic is bridged w/o interruption
- all traffic from localhost uses eth0
- traffic from one port on the localhost uses br0 instead of eth0

> I'm still not convinced that you need to mark the packets.  In my
> opinion it is so much easier to match the source or destination IP.

 Ugg, I hate ASCII art, but here go my Picasso skills...

  ______             ______             _____
|      |-->--1-->--|      |-->--2-->--|     |
| Jack |           | Jose |           | Dan |
|______|           |______|--<--3--<--|_____|
                     |  |
                      |  |
                     5  4
                      |  |
                     V  V

This makes you appreciate whiteboards on a whole new level.

Assuming eth0 and br0 are on the same network, this is what I'm seeing:
 1 - packets from Jack flow in on the bridge (eth50).
2 - packets from localhost go out on the bridge (eth51).
3 - response is received from Dan on the bridge (eth51).
 4 - packets from localhost match both the eth0 and br0 networks, eth0
takes the cake and the packet is sent out the wrong interface.
5 - all other traffic.

 All packets from me, destined to that network should use eth0, with
the exception of packets like "4" (as described above).  Those packets
should use br0.  We've tried modifying our software to force an
interface but it looks like Java under Linux is incapable - the
packets seem to hit the routing rules anyway.  I only know the source
port of these packets; SRC IP is going to be one of mine, DST IP is
unknown (except to the software) and DST port is random (per
connection).

> Ok, I feel like I'm missing your config.  Will you please list out your
> interfaces (logical and physical) as well as subnets.  Granted the
> subnets can be a.b.c.x, d.e.f.x, g.h.i.x, etc.

 Sure -

JACK -
IP: 37.2.18.205 / 255.255.254.0
GW: 37.2.18.1 / 255.255.254.0
Sends 1, expects 4 in diagram above.

DAN -
IP: 72.2.2.80 / 255.255.254.0
GW: 72.2.2.1 /  255.255.254.0
Receives 2, Sends 3.

JOSE -
BR0: 72.2.2.92 / 255.255.254.0
GW: 72.2.2.1 /  255.255.254.0
Receives 1, Sends 2, Receives 3.

ETH0: 72.2.4.109  / 255.255.254.0
GW: 72.2.4.1 / 255.255.254.0
Sends 4

In this scenario, ETH0 in Jose is on a different subnet.  It is
feasible that it is on the same subnet as DAN/BR0.

Jose's IPTables:
[root@SES network-scripts]# iptables -L -t nat
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             72.2.2.80             tcp
dpt:5000 to: 72.2.2.92:2037
DNAT       tcp  --  72.2.2.80            anywhere              tcp
spt:5000 to:72.2.2.92

***** All other chains are empty *****


Jose's routing tables:
You'll find that these are pretty-much the default routing tables:

[root@SES network-scripts]# ip route list table local
local 72.2.4.109  dev eth0  proto kernel  scope host  src 72.2.4.109
local 72.2.2.92 dev br0  proto kernel  scope host  src 72.2.2.92
broadcast  127.255.255.255 dev lo  proto kernel  scope link  src 127.0.0.1
broadcast 72.2.4.0 dev eth0  proto kernel  scope link  src  72.2.4.109
broadcast 72.2.5.255 dev eth0  proto kernel  scope link  src 72.2.4.109
broadcast  127.0.0.0 dev lo  proto kernel  scope link  src 127.0.0.1
broadcast 72.2.2.0 dev br0  proto kernel  scope link  src 72.2.2.92
broadcast 72.2.3.255 dev br0  proto kernel  scope link  src 72.2.2.92
local 127.0.0.1 dev lo  proto kernel  scope host  src  127.0.0.1
local 127.0.0.0/8 dev lo  proto kernel  scope host  src 127.0.0.1

[root@JOSE network-scripts]# ip route list table main
72.2.2.80 via 72.2.2.92 dev br0
72.2.4.0/23 dev eth0  proto kernel  scope link  src 72.2.4.109
72.2.2.0/23 dev br0  proto kernel  scope link  src 72.2.2.92
169.254.0.0/16 dev eth0  scope link
default via  72.2.4.1 dev eth0


OR in the old-fashion style:

[root@JOSE network-scripts]# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
72.2.4.0        *               255.255.254.0   U     0      0        0 eth0
72.2.2.0        *                255.255.254.0   U     0      0        0 br0
169.254.0.0     *               255.255.0.0     U     0      0        0 eth0
default          72.2.4.1        0.0.0.0         UG    0      0        0 eth0


[root@JOSE network-scripts]# ip route list table default
[root@JOSE network-scripts]#


> You will probably have to use custom routing tables including the tables
> including link addresses.

 I'm not sure what this means...  Since I want all traffic to go to
eth0, except for the traffic with a given source port, how are the
routing tables going to help me?

I did notice one interesting thing last night...  My Cisco RV042
that's used as a router in the middle is sending a lot of Gratuitous
ARP packets for an interface which itself owns... I'm guessing this is
a firmware bug of some kind and probably wouldn't affect my setup
anyway so I'm going to ignore it.

- Gareth

