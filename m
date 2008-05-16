From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Fri, 16 May 2008 12:32:47 -0300
Message-ID: <1210951968.23968.2614.camel@kr0sty.1.com.ar>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
	 <482DA36B.6070801@plouf.fr.eu.org>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482DA36B.6070801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Fri, 2008-05-16 at 17:08 +0200, Pascal Hambourg wrote:
> Hello,
>=20
> Martin a =C3=A9crit :
> >=20
> > I use to have a 2.6.18 kernel with some patches, including POM and
> > netfilter ones. The modules I insmod are ip_conntrack_ftp,
> > ip_conntrack_irc, ip_conntrack_tftp, ip_conntrack_amanda and
> > ip_conntrack_sip.
> >=20
> > Asking around, have finally find that to get patches on mainstream,=
 some
> > names've changed and some code have been modified =C2=BFis that rig=
ht?
>=20
> nf_conntrack is layer 3-independent and works with both IPv4 and IPv6=
,=20
> while ip_conntrack was IPv4-only.
>=20
> > Anyway, there aren't nf_conntrack_amanda, nf_conntrack_irc, etc. =C2=
=BFare
> > there available by now, or need some extra patches or something els=
e?
>=20
> Most of them were introduced in kernel 2.6.20 along with IPv4 statefu=
l=20
> NAT. Aliases have been defined, so you can keep using the old names.

Thanks Pascal for the response.

Couldn't find any documentation about that on netfilter site, but've
seen that on the list.

When compiling kernel there are potions to introduce them in netfilter
modules, but there aren't modules or aliases to those names =C2=BFcan y=
ou
tell me how to add those alias? insmod keep telling me that
ip_conntrack_amanda and ftp couldn't be loaded (I keep trying to load
them on my firewall script).=20
I've found nf_conntrack_* files, but are .h ones, and are at the includ=
e
path of the kernel source code, at netfilter section.


I'll keep searching for more info.

Cheers.

Martin

