From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: HELP!!! (ip_conntrack: table full)
Date: Mon, 27 Oct 2003 13:01:04 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E377B@alderaan.smgtec.com>
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
To: Warren P <warrenp@websurfer.co.za>, nighthawk@ezsm.net, netfilter@lists.netfilter.org

DNAT uses ip_conntrack to create a reverse rule match for the packet
returning through the interface attached to the destination system.
Remember, DNAT doesn't just NAT it heading to the destination, but it
also NAT's on the way back to the original source.

-----Original Message-----
From: Warren P [mailto:warrenp@websurfer.co.za]=20
Sent: Monday, October 27, 2003 12:47 PM
To: nighthawk@ezsm.net; Warren P; netfilter@lists.netfilter.org
Subject: Re: HELP!!! (ip_conntrack: table full)

Hi

Thanks ...

But tell me ... do i really need ip_conntrack? What would
happen if i remove it permanently ... how will this affect
my IP Table rule ...
I've only got one rule:
e.g: iptables -t nat -A PREROUTING -p tcp --dport 80 -j
DNAT --to 192.168.22.33:3128

------------------------------------------------------------


On Mon, 27 Oct 2003 16:09:14 -0400
 NightHawk <nighthawk@easyservermanagement.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Warren,
>    I would only raise the value in /proc/net/ip_conntrack
> a little bit at a=20
> time till you find the lowest number that works for your
> situation.  Once you=20
> have everything under control, the number shouldn't have
> to be too high, at=20
> least this has been my experience.  I only raise the
> number when having a=20
> "situation", and then lower it back down once things are
> calmed down.
>=20
> And yes, I did mean to rmmod ip_conntack, when I
> mentioned dropping=20
> ip_conntrack.  Although, this tends to require dropping a
> few other modules=20
> as well, and also tends to require stopping iptables
> while you do so. (due to=20
> some of the modules that you have to remove.)  Which is
> why it is not the=20
> best solution for all situations....
>=20
> NH
>=20
> On Monday 27 October 2003 2:52 pm, Warren P wrote:
> > hi
> >
> > WRT echo ## > /proc/net/ip_conntrack
> >
> > Considering i've got 1gig of RAM ... what is a safe
> value i
> > can set ip_conntrack_max to? The current value is 65528
> >
> > Also when you refer to dropping ip_conntrack ... do
> mean
> > like rmmod ip_conntrack.o?
> >
> > Regards,
> > Warren P
> >
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
>=20
>
iD8DBQE/nXtqb58ZIoF+byQRAgbWAKCOgeguwsDsDnvsH/8MHx5BTwKuSQCffJ+t
> fcgUdKA6Npi/VyhejhJegOE=3D
> =3DTh5c
> -----END PGP SIGNATURE-----
>=20



