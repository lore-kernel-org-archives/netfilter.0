From: "Warren P" <warrenp@websurfer.co.za>
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Mon, 27 Oct 2003 21:52:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-171329066@mail01.infosat.net>
References: <200309191111.55721.security@ezsm.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309191111.55721.security@ezsm.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: security@ezsm.net, Alpha Technologies <alphaside@yahoo.com>, netfilter@lists.netfilter.org

hi

WRT echo ## > /proc/net/ip_conntrack=20

Considering i've got 1gig of RAM ... what is a safe value i
can set ip_conntrack_max to? The current value is 65528

Also when you refer to dropping ip_conntrack ... do mean
like rmmod ip_conntrack.o?

Regards,
Warren P

-----------------------------------------------------------


On Fri, 19 Sep 2003 11:11:53 -0400
 Security <security@ezsm.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> First...here is what is happening:
>=20
> Your max setting on the conntrack table can be seen at:=20
> cat /proc/sys/net/ipv4/ip_conntrack_max
>=20
> Your current number of entries in the conntrack table can
> be found like this:
> cat /proc/net/ip_conntrack | wc -l
>=20
> Now, you have 2 choices on how to sort this out...
>=20
> 1) raise the limit in /proc/net/ip_conntrack =20
> To raise that limit:
> echo ## > /proc/net/ip_conntrack=20
> (where ## is the new max you wish to set).
>=20
> or=20
> 2) flush the conntrack table=20
> (for that.I am going to paste in from an earlier post to
> this list)
>=20
> Just simply remove the mod ip_conntrac and any dependices
> and re-apply it.
>=20
> **Warning** this will require you to drop iptables while
> you do it...which may
> not be a good option depening on your network
> configuration. **/Warning**
>=20
> NH
>=20
> On Thursday 11 September 2003 4:19 pm, Warren P wrote:
> > hi
> >
> > does anyone know how to clear/flush the ip_conntrack
> table. Every 4 to 6
> > months i need to reboot my server because it drops
> packets and complains
> > that the table is full ...
> >
> > Regards,
> > Warren P
>=20
>=20
>=20
> On Friday 19 September 2003 10:43 am, Alpha Technologies
> wrote:
> > Recently I am having this messages on my system:
> "ip_conntrack: table
> > full". Please i need help. what is happening?
> >
> > This is my info:
> >
> > RedHat 9.0
> > Kernel: 2.4.20-18.9
> >
> >
> > I really apreciate any help.
> >
> > Thanks
> >
> > Pablo Tamayo
> >
> >
> >
> >
> >
> > ---------------------------------
> > Do You Yahoo!?
> > Todo lo que quieres saber de Estados Unidos, Am=E9rica
> Latina y el resto del
> > Mundo. Vis=EDta Yahoo! Noticias.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
>=20
>
iD8DBQE/axy6PEfiOMhBaIMRAq2CAKCaZ94odX9aX3KaPhqF6pL340poRACffclm
> ySIf03dKHYvJy46KGQpM5M0=3D
> =3DcBZI
> -----END PGP SIGNATURE-----
>=20


