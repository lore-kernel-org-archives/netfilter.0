From: Harald Welte <laforge@netfilter.org>
Subject: Re: path-o-matic-20030929.tar.bz2 doesn't apply ok with k2.4.22
Date: Fri, 3 Oct 2003 12:31:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003103101.GZ5758@sunbeam.de.gnumonks.org>
References: <3F79CC00.3040003@uga.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jXRFVvqvG+w3zy9F"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F79CC00.3040003@uga.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Carlo Pires <carlo@uga.com.br>
Cc: netfilter@lists.samba.org


--jXRFVvqvG+w3zy9F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2003 at 03:31:28PM -0300, Carlo Pires wrote:
> I am compiling kernel 2.4.22 with patch-o-matic-20030929.tar.bz2 and I=20
> notice that
> /usr/src/linux/include/linux/netfilter_ipv4/ipt_osf.h
> after the patch applied don't have a #endif for #define _IPT_OSF_H
> then I added a line with: #endif /* _IPT_OSF_H */ at the end of the file=
=20
> and everything compiled well.

Thanks, I also noted that the osf.patch is broken in serveral ways.  I'm
going to contact the author about that.

> []s
> Carlo

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--jXRFVvqvG+w3zy9F
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/fU/lXaXGVTD0i/8RAiVfAJ4q7fAw19eREEnb2zZ5OHgyaWz5YQCgj8CM
U18PCuHmqLJ5NqUc8upNIeQ=
=irF1
-----END PGP SIGNATURE-----

--jXRFVvqvG+w3zy9F--

