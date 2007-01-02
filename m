From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Distro Choice for iptables as Enterprise Firewall
Date: Tue, 2 Jan 2007 12:51:55 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024EF31@pxtbenexd01.pxt.primeexalia.com>
References: <4597E5CD.8050104@rackage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <4597E5CD.8050104@rackage.com>
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
To: randles@rackage.com, netfilter@lists.netfilter.org

I've played around with using rPath.  It allows for distro's of 200mb
and runs with 64mb ram.  Bare install is just that, almost nothing but
basic kernel components and a few essentials. =20

Now at the enterprise level you can also include the optional components
that you might want.

Seems to work well for me.

We also use RHEL4 for some of our bigger environments but the min
install there includes the kitchen sink.

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Rackage | Randles
> Sent: Sunday, December 31, 2006 8:31 AM
> To: netfilter@lists.netfilter.org
> Subject: Distro Choice for iptables as Enterprise Firewall
>=20
> Hi,
>=20
> I'm new to iptables and this list so forgive me if this subject has
been
> covered previously.
>=20
> I'm sure this topic is a cause for much debate with no definitive
answer
> however I would be glad to hear suggestions never the less.
>=20
> What Distro's are recommended for deploying iptables as a dedicated
> firewall?
>=20
> What server hardening steps would you recommend? (/Bastille?)
>=20
> Thx in advance.
>=20
> Regards
>=20
> Ben
>=20
>=20
>=20
>=20
>=20


