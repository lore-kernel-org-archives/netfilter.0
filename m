From: "=?ISO-8859-1?Q?AkiL_Muss=E1?=" <akilmussa@gmail.com>
Subject: Help with NAT and port translation
Date: Sat, 30 Sep 2006 09:22:00 +0200
Message-ID: <900f379d0609300022p27182e03mc516570d50e16ca3@mail.gmail.com>
References: <900f379d0609300020u25d1ef89k912fb031cd72897c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <900f379d0609300020u25d1ef89k912fb031cd72897c@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I need some help setting up iptables with NAT and port translation.

I need to redirect all traffic comming to 41.220.40.183:80 to 10.0.0.1:8080

The netfilter HOWTO says that its possible using the following rule,
but it isn't working for me:
 iptables -A PREROUTING -t nat -p tcp -i eth0 --dport 80 -j DNAT --to
10.0.0.1:8080

When I setup NAT using the same port (port 80 to 80), it works
perfectly. The problem is when redirecting from port 80 to 8080

Note:
- 10.0.0.1 is a virtual machine created using Xen VMM


My actual configuration is:
# iptables -L -t nat -nv
 Chain PREROUTING (policy ACCEPT 1659 packets, 143K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
    0     0 DNAT       tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:80 to:10.0.0.1:8080

 Chain POSTROUTING (policy ACCEPT 28126 packets, 1747K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion
17560 1110K MASQUERADE  all  --  *      eth0    0.0.0.0/0             0.0.0=
.0/0

Chain OUTPUT (policy ACCEPT 45638 packets, 2854K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

##### ##### ##### ##### #####

#  iptables -L -nv
 Chain INPUT (policy ACCEPT 3470K packets, 374M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion

Chain FORWARD (policy ACCEPT 3212 packets, 1440K bytes)
  pkts bytes target     prot opt in     out     source               destin=
ation
     0     0 ACCEPT     all  --  *      *       10.0.0.1
0.0.0.0/0           PHYSDEV match --physdev-in vif5.0
     0     0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in  vif5.0 udp spt:68
dpt:67
    0     0 ACCEPT     all  --  *      *       10.0.0.2
0.0.0.0/0           PHYSDEV match --physdev-in vif6.0
    0     0 ACCEPT     udp  --  *      *        0.0.0.0/0
0.0.0.0/0           PHYSDEV match --physdev-in vif6.0 udp spt:68
dpt:67

 Chain OUTPUT (policy ACCEPT 3465K packets, 353M bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion


Thanks for any help...
--=20
AkiL Muss=E1
Software is like SEX, it is better when it is FREE (Linus Torvalds)

