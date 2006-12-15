From: "Snyder, Brian" <bsnyder@idirect.net>
Subject: Question about iptables and bridging
Date: Fri, 15 Dec 2006 15:23:02 -0500
Message-ID: <C874DBE9D30B584587F8CD0EC34DA8BE0377F879@EX00.idirect.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi all,
=20
I am currently using iptablesv1.3.5 on fedora core 5.  At this point I
am just playing around and trying to learn the system, but my general
idea is to setup my linux box as a bridge.  Ultimatly I then plan on
using firewalling to redirect/drop whatever traffic is deemed worthy.
=20
So I have linux setup correctly as a bridge as so:
=20
br0    :   inet addr - 172.20.134.7
eth0  and eth1 are unaddressed and part of the bridge.
=20
I set this up as follows:
sudo ifdown eth1
sudo ifdown eth1
sudo ifconfig eth0 0.0.0.0
sudo ifconfig eth1 0.0.0.0
sudo brctl addbr "br0"
sudo brctl setfd br0 0
sudo brctl addif br0 eth1
sudo brctl addif br0 eth0
sudo ifup br0
sudo ifconfig  br0 172.20.134.7 netmask 255.255.0.0
sudo ip route add default 172.20.255.254
=20
=20
=20
Now my problem with iptable is the following:
=20
I tried to setup a rule to look for ICMP from a particular interface as
such.
=20
iptables -t filter -A FORWARD -p icmp -i eth0
iptables -t filter -A FORWARD -p icmp -i eth1
iptables -t filter -A FORWARD -p icmp -i br0
=20
Now, the only filter that ever matches any packets is br0.  So because
of the way the bridge works, if I can't use eth0 or eth1 as input/output
interfaces, then I can't really tell 'direction' of traffic between my
lan and my wan. =20
=20
Is there something I am missing here? I would assume there is a way to
do this (tell direction over bridge) but I don't know what it is.... so
any help or pointers would be greatly appreciated.
=20
Thanks,
Brian

