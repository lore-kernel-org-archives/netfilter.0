From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Plz i need help.... or i ll be fired :(
Date: Wed, 28 Sep 2005 07:51:26 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2E81@farmer.vikus.com>
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
To: Nick Taylor <nickt@lightlink.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: Nick Taylor [mailto:nickt@lightlink.com]=20
> Sent: Tuesday, September 27, 2005 6:30 PM
> To: Derick Anderson
> Cc: Alaios; netfilter@lists.netfilter.org
> Subject: RE: Plz i need help.... or i ll be fired :(
>=20
> <-------removed on topic discussion to rant off topic------>
>=20
> > Your internet address is 143.233.222.77 and your network mask is=20
> > 255.255.255.192. That 192 means you only have 64 IPs in=20
> your network.=20
> > If you don't believe me then google CIDR masks for yourself=20
> like I did=20
> > a couple years back. Now supposing that your network address is
> > 143.233.222.76 (and it is probably 143.233.222.64), you run=20
> out of IPs=20
> > at 143.233.222.139, which is your network's default=20
> broadcast address.
> > This is quite far away from 143.233.222.253 so your packet=20
> never gets=20
> > to the intended host.
> >
>=20
> So many people can't understand binary, and it's statements=20
> like the one above that make this so confusing for people. =20
> There's no such thing as a "network address" that doesn't=20
> fall on a subnet boundry.  The math is so simple, please try=20
> to understand, it will make the world a better place:

Apologies for not being more precise in my post. I was 99% sure of what
you just said but figured an in-depth discussion of CIDR masks was
overkill - having said that you've provided a more complete and
understandable explanation than I probably would have.

