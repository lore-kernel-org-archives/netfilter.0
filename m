From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problems with kernel 2.6.1 and iptables
Date: Mon, 16 Feb 2004 12:26:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076927162.2333.6.camel@raylinux.internal>
References: <005801c3f475$91a645d0$2d64a8c0@pcjka>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qvLjsHppCJ43PpO/GkoM"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005801c3f475$91a645d0$2d64a8c0@pcjka>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'netfilter' <netfilter@lists.netfilter.org>


--=-qvLjsHppCJ43PpO/GkoM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2004-02-16 at 12:13, Jan Kaastrup wrote:
> Hi list
> I have search google for this error most of my weekend, and I cannot get
> the answer :(
> I have upgraded my kernel to 2.6.1 and made all the iptables stuff as
> modules.
> I can load all modules by hand perfectly, but still i get this error:
> #Iptables -L
> iptables v1.2.9: can't initialize iptables table `filter': Table does
> not exist (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>=20
The 'filter' table does not exist by default, but the 'FILTER' table
does. Is this a user chain than you created?

> I have reinstalled iptables and done depmod -a
> I have installed module-init-tools-2.0-pre10
>=20
> It seems like it cannot mount modules automaticly, any ideas?
> Which modules should absolutly be loaded, to make iptables work?
> Could it be, that i am missing a
> iptables-need-to-be-installed-to-make-iptables-work-for-kernel-2.6.x-pac
> ket?
>=20
> Thanks a lot
>=20
>=20
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: 13. februar 2004 18:13
> To: netfilter
> Subject: Re: Routing problem
>=20
>=20
> On Friday 13 February 2004 4:30 pm, Carlos Fernandez Sanz wrote:
>=20
> > > > Before you ask: I can't connect this special computer to the same
> place
> > > > I connect the linux box (which would be the obvious solution)
> because
> > > > the carrier expects traffic to come from one WAN IP, owned by the
> linux
> > > > box.
> > >
> > > How do they expect you to use any of the other IPs in the pool they
> have
> > > given you?
> >
> > I do use them by redirecting traffic from the linux box to the
> destination
> > boxes (such as all trafic for public IP 2 goes to 192.168.21.2, for
> > example). This works fine, *except* in this particular case, where any
> > NATing is not an option. I need the computer behind the linux box to
> > actually own the public address, because it signs packets with it.
>=20
> I still don't understand.   One of your above statements must be
> incorrect:
>=20
>  - either the ISP requires all your outgoing traffic to come from a
> single=20
> public address,
>=20
>  - or you can send traffic from IP1, IP2, IP3 etc as you wish.
>=20
> If the first is true (you have to send all traffic from just a single
> address)=20
> then I don't see how you can do NAT from IP2 to 192.168.21.2, because
> the=20
> reply packets going back out to the Internet are going to have the
> source=20
> address (after de-NATting) of IP2 - therefore you *are* being allowed to
> send=20
> from more than one public IP.
>=20
> If the second is true (you can send from IP1, IP2, IP3 etc as you wish)
> then=20
> as you said in the first place, you can connect the user who wants to
> use=20
> some nasty protocol which embeds OSI layer 3 information into OSI layer
> 7=20
> traffic to the same place as your existing Linux box and give them a
> real=20
> public IP of their own.
>=20
> What does your ISP claim will happen if you use more than one of your
> assigned=20
> pool of IP addresses for the source address of outgoing traffic?
>=20
> Antony.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-qvLjsHppCJ43PpO/GkoM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAMJq6h1fuR/Bv+ygRAiouAJ0a04xHcsPHgXl8WPbHKY0Jiru6lwCgmu0U
LZIFl0CSbW/bq254IPNF95Y=
=yF6X
-----END PGP SIGNATURE-----

--=-qvLjsHppCJ43PpO/GkoM--


