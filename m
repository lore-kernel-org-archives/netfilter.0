From: "James Bowling" <jbowling@alchemy.net>
Subject: RDP and iptables ruleset
Date: Wed, 8 Dec 2004 10:06:25 -0800
Message-ID: <17F5DA2FB6F18744BA13C2197738727CD19AC1@alchmail.alch-la-dc.alchemy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

I seem to be having some issues with iptables 1.2.11 and getting RDP to
be allowed through.  My windows box is NAT'd behind my Gentoo 2004.3
box.  Here is my NAT Tables:

# iptables -t nat -L
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination        =20
DNAT       tcp  --  anywhere             anywhere            tcp
dpt:3389 to:10.0.1.2:3389=20

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination        =20
SNAT       tcp  --  anywhere             anywhere            tcp
dpt:3389 to:10.0.1.2:3389=20
MASQUERADE  all  --  anywhere             anywhere           =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination  =20


Here is my iptables rules:

# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination        =20
ACCEPT     all  --  anywhere             anywhere           =20
REJECT     udp  --  anywhere             anywhere            udp
dpt:bootps reject-with icmp-port-unreachable=20
REJECT     udp  --  anywhere             anywhere            udp
dpt:domain reject-with icmp-port-unreachable=20
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh

ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp

ACCEPT     tcp  --  anywhere             anywhere            tcp
dpt:ftp-data=20
ACCEPT     tcp  --  anywhere             anywhere            tcp
dpt:8245=20
DROP       tcp  --  anywhere             anywhere            tcp
dpts:0:1023=20
DROP       udp  --  anywhere             anywhere            udp
dpts:0:1023=20

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination        =20
DROP       all  --  anywhere             10.0.1.0/24        =20
ACCEPT     all  --  10.0.1.0/24          anywhere           =20
ACCEPT     all  --  anywhere             10.0.1.0/24        =20
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED=20
ACCEPT     all  --  anywhere             anywhere           =20

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination        =20

This is just a very basic rule set as you can see.  What happens is when
I connect with RDP it goes through to the login and then after
authentication it just sits there and eventually times out.  Any ideas
on what is going on?  Any help would be appreciated.


Regards,
James Bowling

