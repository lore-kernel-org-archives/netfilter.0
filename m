From: "Martin Bene" <martin.bene@icomedias.com>
Subject: Problem with pptp nat/contrack
Date: Thu, 23 Oct 2003 00:20:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4D618F6493CE064A844A5D496733D66704E247@freedom.icomedias.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Trying to use pptp nat/contrack modules to access VPN server on the =
internet
from a client(W2k, SP2) behind my nat/firewall iptables machine.

Versions used: iptables 1.2.9rc1
pom from cvs snapshot (20031007)

Network setup:
192.168.168.175 (netmask 255.255.255.0) =3D=3D> cisco1 192.168.168.1 =
=3D=3D>
cisco2 192.168.120.2 =3D=3D> linux nat box 192.168.120.1 =3D=3D> =
(internet) =3D=3D> VPN
PPTP Server (WatchGuard Technologies, Inc.)

WITHOUT ip_nat_pptp, ip_conntrack_pptp, ip_conntrack_proto_gre,
ip_nat_proto_gre loaded:=20
Connection to external VPN Server works, but just one client at a time =
may
access the VPN server.

WITH the above modules loaded:=20
Connection can't be established. Packet dump shows: gre encapsulated ppp =
conf
req going out; returning (ppp conf rej) packets show up on the firewall
external interface, but don't show up on  the internal =
interface/network;
instead they end up being blocked by INPUT firewall - rules; looks like =
they
aren't correctly associated with the gre expectation and end up being =
treated
as destined for the firewall locally. iptables configuration/rules were =
not
changed from previous test, so I'd expect the ruleset to be OK.

Any Idea where to start looking?


Yours, Martin


