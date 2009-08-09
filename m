From: Thomas Jacob <jacob@internet24.de>
Subject: Re: types of NAT with netfilter
Date: Sun, 9 Aug 2009 13:57:00 +0200
Message-ID: <20090809115700.GA4861@internet24.de>
References: <cfeab66d0908070422i40b6efb9x901d3d839a6fee03@mail.gmail.com> <1249647001.29388.25.camel@enterprise.ims-firmen.de> <cfeab66d0908070819p66d977beo7ae1a0276c1487ff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cfeab66d0908070819p66d977beo7ae1a0276c1487ff@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Thomas Jacob <jacob@internet24.de>, netfilter@vger.kernel.org

On Fri, Aug 07, 2009 at 08:49:35PM +0530, ratheesh k wrote:
> My aim is to test whether my router supports what kind of NAT ..and t=
o
> know abt how we can make  nat types that are not supported  ,working
> .....
>=20
>=20
> A { client computer } --------------------------> Router
> ------------------------> internet ...
>=20
> This is my   setup .

So it isn't much about iptables anyway ..

> On Fri, Aug 7, 2009 at 5:40 PM, Thomas Jacob<jacob@internet24.de> wro=
te:
> >> =A0 iptables -t nat -A POSTROUTING -i eth0 -o eth1 -j MASQUERADE

This rule just gives you the NAT translation (and only deals
with the first packet of a connection), in the "nat" table.

> >> =A03 . i installed windows STUC and tested . Test results show it =
is a
> >> portrestricted nat ... But if i make default policy for wan INPUT =
and
> >> wan PREROUING as REJECT , test =A0got failed ??? is it iptables
> >> dependend ??

You also need to allow traffic to pass your system. If you REJECT every=
thing
in the PREROUTING/INPUT chains (in the nat table, I presume), you will =
basically
prevent all NEW connections via/to the router.

E.g. something like that (in the INPUT table) should get you started

iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state NEW -i eth0 -o eth1 -j ACCEPT
iptables -P FORWARD REJECT
iptables -P INPUT REJECT

Also check out this diagram that shows you how a packet is passed
thru the netfilter/iptables system:

http://ebtables.sourceforge.net/br_fw_ia/bridge3b.png

Maybe you should also read at least some of the docs :-)

 =3D> http://netfilter.org/documentation/index.html

   Regards,
       Thomas
