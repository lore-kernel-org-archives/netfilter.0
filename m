From: "Brei, Matt" <mbrei@medclaiminc.com>
Subject: RE: Connection Teaming
Date: Mon, 30 Jun 2003 16:29:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <091A6DF13847F44395B31658ED61C19C82A123@yellowstone.medclaim.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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


> Greetings,
>=20
> =20
>=20
>             I currently have 1 cable internet connection being=20
> firewalled and routed by netfilter on RedHat 8.  I am thinking about=20
> getting another cable connection to speed things up a bit.  My=20
> question is, can this be done?  Is it possible to bond 2 separate=20
> cable

Yes, if they're from the same provider and if the provider accepts to
bond... But if so, why don't you get more bandwidth by upgrading your
service?

My ISP has 1 bandwidth package only.  The only add-ons are IP addresses
(which don't seem to work)

> connections on 2 modems, each in their own nic and combine the=20
> bandwidth?  I know this can be done on windows, a friend had a DSL and

> cable and teamed the downstream, however I would like to team the=20
> upstream as well.

Can you say how this could be done on windows?

I don't remember exactly how it was done, but what I do remember that
the DSL was a 5 static IP package, (1.5 down 256 up) routed to the LAN
via a speedstream router.  The cable connection was on 1 PC only and on
that PC ran software that would combine the downstream from the local
cable connection and nat'd DSL connection.  As soon as I can get him to
answer the phone I'll let you know what software did it. (I think it was
called Internet Gateway or something of the like)

AFAIK, bonding two Ethernet ports requires both ends to bond it. When
you say DSL and Cable had been bonded, it doesn't make sense, since the
upstream end points of these two access methods are definitely not on
the same box...

I know that windows can do magic sometimes, but I don't buy this one...

Ramin

>=20
> Many thanks in advance
>=20
> Matt

