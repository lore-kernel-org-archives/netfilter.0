From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: transparent tcp proxy
Date: Sat, 24 May 2003 12:05:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: ml-netfilter@adtech.be, netfilter@lists.netfilter.org

Hmm. I don't think bridging copies the packets MAC address over. it just =
copies the packet data with it's source and destination IPs.

Can I ask what the mac address is used for, or needed for? Is it for =
some authenticity reasons?

-----Original Message-----
From: Michael Stilmant [mailto:ml-netfilter@adtech.be]
Sent: Saturday, May 24, 2003 1:07 AM
To: netfilter@lists.netfilter.org
Subject: transparent tcp proxy


Hello,

First of all, an hello from a new user on this mailing list.

and finally my actual problem.

I'm need to make a transparent proxy for an billing application. To to
that I need to put myself in the middle point of a protocol exchange not
thinked to be easy done with a proxy.

So to do that I've done this installation:

I've have a computer where I place transparent proxy via ebtables this
is B. (no special rules : just ones to activate a transparent proxy:
                brctl addbr mybridge
                brctl addif mybridge eth0
                brctl addif mybridge eth1
                ifconfig eth0 0.0.0.0
                ifconfig eth1 0.0.0.0
                ifconfig mybridge up
                ifconfig mybridge 10.0.0.225
                route add default gw 10.0.0.254 )

A and C communicate with all normal exchange

                     10.0.0.225
                     +--------+
                     |   B    |
   +-----+           |        |          +-----+
   |  A  +-----------[ebtables]----------|  C  |
   +-----+           +--------+          +-----+
   10.0.0.3                             10.0.0.32        =20

I've place this Iptables rules

iptables -t nat -A PREROUTING -i eth1 -d 10.0.0.3 -p tcp --dport 3435 -j
DNAT --to-destination 10.0.0.225:3625

iptables -t nat -A POSTROUTING -o eth0 -d 10.0.0.3 -p tcp --dport 3435
-j SNAT --to-source 10.0.0.32

so with that when C want to connect the A:3435 service all traffic is
oriented to B and when B send traffic to A: A see C ip address. -> full
transparent.

But there are a big problem:

Address Mac used from B to A is not the MAC address. Not a problem since
i don't want really be transparent but other traffic form C go to A
directly with the good MAC and traffic from B to A have an other MAC. so
switch or other router in the A side see 10.0.0.32 sometime with C Mac
and other time with B MAC .. gloupspss ?? .. :-D

I need to find a way to read mac address from a connection from C and
set this MAC when I start a connection to A from B=20

have you some clues ? (allready send the same question on the ebtables
ailin list .. perhaps with a function from there there are a solution
... )

thanks


Michael Stilmant



