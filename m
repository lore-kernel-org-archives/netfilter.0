From: christophe =?iso-8859-15?Q?barb=E9?= <christophe.barbe.ml@online.fr>
Subject: Re: simple rules and unexpected traffic
Date: Thu, 4 Jul 2002 18:57:25 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704225725.GD909@localhost>
References: <200FAA488DE0D41194F10010B597610D2BA22C@JUPITER> <20020704224523.GB909@localhost> <02070500543604.06327@Lms>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <02070500543604.06327@Lms>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2002 at 12:54:36AM +0200, Jan Humme wrote:
> On Friday 05 July 2002 00:45, christophe barb=E9 wrote:
> > On Fri, Jul 05, 2002 at 08:35:53AM +1000, George Vieira wrote:
> > > Yes I've found that some user space programs can see stuff before
> > > iptables.. tcpdump too I think...
> >
> > Yes it sounds logical for tcpdump or tools like that (which pass the
> > interface in promiscuisious mode) to see everything. I was not expecting
> > the same from a unprivileged app like gkrellm.
> > It is stil unclear for me what is the data processing path.
> >
> > Has someone a clear picture of the packets path ?
>=20
> It is no problem to open a socket and receive a copy of all raw packets=
=20
> before they get to the kernel iptables modules. See "man 7 packet" for=20
> details.
>=20
> I believe this is how tcpdump does it too.

Ok it sounds logical.
Now the question is what is dropping these packets ? Apparently not
rp_filter, and not netfilter because I see no log for it.

Christophe

>=20
> Jan Humme.

--=20
Christophe Barb=E9 <christophe.barbe@ufies.org>
GnuPG FingerPrint: E0F6 FADF 2A5C F072 6AF8  F67A 8F45 2F1E D72C B41E

Imagination is more important than knowledge.
   Albert Einstein, On Science

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9JNLVj0UvHtcstB4RAmm2AKCavwPToUIzGQd2KRO6jjVOI6P+5wCbBkQY
kwSH+tDjy77RU7TkePEQrOc=
=J+/b
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--

