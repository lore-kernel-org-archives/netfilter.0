From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: Slow connection on Mac OSX
Date: Tue, 6 Sep 2005 18:03:03 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFCBB@p001ex03.porta.local>
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
To: David Leangen <dleangen@canada.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

hi,

a possibility could also be wrong or no dns settings.
this could slow down your system too..

greets=20

matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of=20
> David Leangen
> Sent: Monday, September 05, 2005 7:14 AM
> To: netfilter@lists.netfilter.org
> Subject: NAT: Slow connection on Mac OSX
>=20
>=20
>=20
> Hello!
>=20
> I have set up NAT/masquerading on my router box.
>=20
> Everything seems to be working fine on my Linux client host.=20
> However, my=20
> Mac is having a lot of trouble: the connection is very slow=20
> and I can't=20
> even finish loading, for example, the google home page.
>=20
>=20
> Is there something else I need to do to get this going right?
>=20
>=20
> Mac: 192.168.2.4
> Client Linux: 192.168.2.2
> Linux firewall (eth1): 192.168.2.1
> Linux firewall (eth0): 192.168.1.2
>=20
> ip_forward is set to "1".
>=20
> In my iptables "nat" table, I have:
>=20
> -A POSTROUTING -o ppp0 -j MASQUERADE
>=20
>=20
> Thanks for any advice you can give me!
>=20
>=20
>=20
>=20

