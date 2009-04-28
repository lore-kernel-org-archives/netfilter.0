From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Select chain from set?
Date: Tue, 28 Apr 2009 16:34:54 +0300
Message-ID: <1240925694.4256.32.camel@casper.meteor.dp.ua>
References: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
	 <1240921645.14474.141.camel@hsa.vpn.anti>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240921645.14474.141.camel@hsa.vpn.anti>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Martin Millnert <millnert@csbnet.se>
Cc: Oskar Berggren <oskar.berggren@gmail.com>, netfilter@vger.kernel.org

=F7 =F7=D4=CF, 28/04/2009 =D7 14:27 +0200, Martin Millnert =D0=C9=DB=C5=
=D4:
> On Tue, 2009-04-28 at 11:21 +0200, Oskar Berggren wrote:
> > Hello,
> >=20
> > is it possible to have iptables query a set of some sort to quickly
> > look up a chain to jump to for a specific packet?
> >=20
> > For example the set would contain a mapping from ip-address ->
> > chain-name. Then the destination address is looked up in the set an=
d
> > iptables would jump to the specified chain.
> >=20
> > Is it possible, or how difficult would it be to implement something
> > like this? I'd imagine it would be implemented as a target, that wo=
uld
> > have the ability to "redirect" to another target, which would be a
> > chain.
> >=20
> >=20
> > /Oskar
>=20
> Hi Oskar,
>=20
> to my knowledge there is no current such functionality. But I second =
the
> usefulness of such a function. It would be especially useful to repla=
ce
> traditional "match trees" of today, to reach down to a per
> customer-chain for inwards and outwards matching.
>=20
> It seems like it would be beneficial to let it be very similar to the
> ipset of today, in that you would be very well of in having multiple
> such sets to jump to as a target.  Thus you could easily use normal
> matchings to decide whether or not to perform this sort of look-up.
>   It would be useful if each such set would contain the possibility t=
o
> match on either source address/netmask and destination address/netmas=
k.

This functionality is more related to a special target than ipset
feature. -j CLASSIFY does half of the work and as to me is the most
ideal to be taken as the base for the new target.

> This all begs the question on how effective some tree structure with =
-g
> is implemented, to figure out how much of a performance benefit such =
a
> new target would have over a treelike chain structure. =20

If we compare many linear -g with just one function gettarget(ip) the
different is many/one. Tree-like -g structure would save most
comparitions, but is hard to write for every task. Function-like target
is real fast and fully automatic, the only disadvantage is in fact it
doesn't exist :)

> It would indeed be useful to have it all as a single target however,
> save a lot of rules and also be much more readable.

Also, something is telling me that if the deal is comming to write new
target it is good idea to review the whole task as it probably can be
solved in a more effective way.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

