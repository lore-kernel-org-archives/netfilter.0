From: "Mika Ullgren" <mika.ullgren@lemonplanet.com>
Subject: RE: Nat with virtual interfaces - Solved
Date: Fri, 28 Jun 2002 08:21:59 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <BACC2B29B574704A8494EAD86EDBB9501C6135@stosrv-0003.lemonplanet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Thanks to all that answere to this thread.=20

And a special thanks to Antony for solving the problem. Works like a
charm. This help was very appreciated since I'm not used to use
iptables. I come from the world of OpenBSD so in pf lies my strenght.=20

Thanks once again Antony.

// Mika Ullgren

> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
> Sent: den 27 juni 2002 17:36
> To: netfilter@lists.samba.org
> Subject: Re: Nat with virtual interfaces
>=20
>=20
> On Thursday 27 June 2002 2:49 pm, Mika Ullgren wrote:
>=20
> > Yes I did. Sorry I forgot to mention that... If I use DNAT=20
> exactly the
> > same thing happens as with REDIRECT.
> >
> > Any other ideas?
>=20
> Here's a bit of a daft idea, but you never know.....
>=20
> Try using DNAT to a completely different address (which you=20
> still add to eth0=20
> and include in the apache httpd.conf file) ?
>=20
> eg ifconfig eth0:0 172.16.64.75 netmask 255.255.255.0
>=20
> iptables -A PREROUTING -t nat -d 192.168.64.75 -p tcp --dport=20
> 80 -j DNAT --to=20
> 172.16.64.75:8080
>=20
> etc....
>=20
> I have no idea if this would work (or if it did, why it's a=20
> better idea than=20
> the other things you've tried) but it's got to be worth a=20
> quick go.....
>=20
> =20
>=20
> Antony.
>=20
>=20

