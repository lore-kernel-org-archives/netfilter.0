From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: PPTP Server and PPTP clients on a firewalled gateway
Date: Sun, 5 Dec 2004 16:58:32 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019816@pxtvjoexd01.pxt.primeexalia.com>
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
To: "A. Sayler" <asayler@qorvus.net>, netfilter@lists.netfilter.org

Ran into this problem recently (search the archives about 1-2 weeks
back).  Drop ip_nat_* from the load unless you are routing those
protocols to an internally NAT'd VPN server.  Since your firewall is
your VPN you do not need to route those.



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of A. Sayler
> Sent: Saturday, December 04, 2004 4:30 PM
> To: netfilter@lists.netfilter.org
> Subject: PPTP Server and PPTP clients on a firewalled gateway
>=20
> Hi,
>=20
> If anybody might some insight into this problem I would certainly
> appreciate it.
>=20
> I have multiple wireless clients that need access to outside corporate
VPN
> servers through my system.  I also have a PPTP server listening on the
> local gateway host for other users to connect to our internal network
from
> outside.
>=20
> I have a 2 NIC system.
>=20
> I have an internal interface of WLAN0 and the external interface of
ETH0.
>=20
> I have made sure to load the following modules...
> ip_conntrack_proto_gre
> ip_conntrack_pptp
> ip_nat_pptp
> ip_nat_proto_gre
>=20
> I have added the following commands to the rest of my firewall rules
>=20
> iptables -I INPUT -p 47 -j ACCEPT
> iptables -I INPUT -p tcp --dport 1723 -j ACCEPT
>=20
> iptables -I OUTPUT -p 47 -j ACCEPT
> iptables -I OUTPUT -p tcp --dport 1723 -j ACCEPT
>=20
> iptables -I FORWARD -p 47 -j ACCEPT
> iptables -I FORWARD -p tcp --dport 1723 -j ACCEPT
>=20
> iptables -I FILTER -p 47 -j ACCEPT
> iptables -I FILTER -p tcp --dport 1723 -j ACCEPT
>=20
> I'm masquerading all connections out.
>=20
> currently the clients can get out and connect properly but the outside
> clients trying to connect to our local system via the PPTP server on
the
> gateway box can not get a connection.
>=20
> I think it has something to do with how I'm routing the connection to
the
> local host but I'm not sure what I need to change. Or is this even
> possible?
>=20
> Any thoughts?
>=20
> Thanks,
> Adam

