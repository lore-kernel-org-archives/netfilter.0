From: "Uwe A. P. Wuerdinger" <wuerdinger@x-tec.de>
Subject: iptables problem with multible routes [sum]
Date: Fri, 05 Jul 2002 13:09:42 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D257E76.4080400@x-tec.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.samba.org

Hi list,
I have aproblem originally posted to debian-firewall@lists.debian.org
maybe you guys can help me

---snip---

-------- Original Message --------
Subject: iptables problem with multible routes
Date: Fri, 05 Jul 2002 12:10:07 +0200
From: "Uwe A. P. Wuerdinger" <wuerdinger@x-tec.de>
Organization: X-tec Institute for Computer and network Security GmbH
Newsgroups: mailinglist.debian.firewall

Hi List,
I have a problem with iptables (kernel 2.4.18)
and multible routes.

Setup:
My Firewall (FW) has 3 interfaces
eth0 =3D Internal
eth1 =3D dedicatet router connection
ppp0 (PPPoE DSL link on eth2)

a kernel default route pointing to ppp0
an a second routingtable (me-prov) with an other default route
pointing to the router connected to eth1.
I have a NAT rule in place for MASQing the networks on eth0.
For the nat Traffic I mark my packets that should use
the me-prov defaulttable with a 0x1

# iptables -t mangle -I PREROUTING 1 -p tcp -i eth0 --dport 22 \
-j MARK --set-mark 0x01

works like expected.
The packet gets NATed end send out to eth1.

My problem is when I do the same for localy generated packets
(e.g. the mailserver running on the FW) with
# iptables -t mangle -I OUTPUT 1 -p tcp --dport 25 \
-j MARK --set-mark 0x01

The packed got routed out to eth1, as expected but has the Source IP
of ppp0.
What can I do to get that packets the right source IP for eth1?

-------- Original Message --------
Subject: Re: iptables problem with multible routes
Date: Fri, 05 Jul 2002 12:36:12 +0200
From: "Uwe A. P. Wuerdinger" <wuerdinger@x-tec.de>
Organization: X-tec Institute for Computer and network Security GmbH
Newsgroups: mailinglist.debian.firewall
References: <3D25707F.8020002@x-tec.de> <20020705100805.GT31085@virus.home>

Jean Christophe ANDR=C30/00 wrote:

 > mlist-debianfirewall@x-tec.de =E9crivait :
 >
 >>The packed got routed out to eth1, as expected but has the Source IP of
 >>ppp0. What can I do to get that packets the right source IP for eth1
 >>
 >
 > Check your NAT rule: you probably need to precise the output interface as
 > "-o ppp0" to only NAT when it goes thought the DSL line.


NOP that would break the NATing of the internal traffic that should go
out to eth1:

iptables -t mangle -I PREROUTING 4 -p tcp -i eth0 --dport 22 \
-j MARK --set-mark 0x01

---snip---

greets Uwe
--=20
X-Tec GmbH
Institute for Computer and Network Security
WWW : http://www.x-tec.de/


