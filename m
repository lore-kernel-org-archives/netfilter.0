From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 14:53:22 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFD62@p001ex03.porta.local>
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
To: Henrik Nordstrom <hno@marasystems.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

hm i have to correct my previous post..
i copied the discussed rule and it works fine...
there must be an other mistake maybe something missing in the kern

greets

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Henrik
> Nordstrom
> Sent: Friday, September 30, 2005 2:45 PM
> To: sebastian.ionita@focomunicatii.ro
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Iptables and vlan interfaces
>=20
>=20
> On Fri, 30 Sep 2005 sebastian.ionita@focomunicatii.ro wrote:
>=20
> > Why doesn't iptables works with vlans interfaces?=20
> > iptables -t mangle -A FORWARD -i eth0 -o eth1.11 -j MARK=20
> --set-mark 4
> > Gives me the error:
> > host/network eth1.11 not found.
>=20
> Sounds like there may be a bug in your iptables command.
>=20
> Are you sure the command line given above is what you tried=20
> to use? The=20
> error seems to suggest a -s/-d option was used instead of -o.
>=20
> Regards
> Henrik
>=20
>=20

