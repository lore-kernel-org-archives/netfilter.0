From: Evan Davies <evand@voiceplus.com.au>
Subject: RE: iptables1.2.7 + pptp + rh9
Date: Wed, 22 Oct 2003 09:50:35 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066780235.23642.4.camel@proto.voiceplus.com.au>
References: <7C9884991ADAE0479C14F10C858BCDF5122E76@alderaan.smgtec.com>
	 <6.0.0.22.0.20031021195845.01b5faa0@pop3.uol.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=_fileserver.voiceplus.com.au-5782-1066780237-0001-2"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20031021195845.01b5faa0@pop3.uol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Fernando Barrocal <fbarrocal@uol.com.br>
Cc: Netfilter <netfilter@lists.netfilter.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_fileserver.voiceplus.com.au-5782-1066780237-0001-2
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I first applied the patch-o-matic to the kernel.
Recompile and installed iptables 1.2.8 with the following commands:
> make BINDIR=3D/sbin LIBDIR=3D/lib MANDIR=3D/usr/share/man
> make BINDIR=3D/sbin LIBDIR=3D/lib MANDIR=3D/usr/share/man install
Configure the kernel with new options
Run make bzImage ; make modules ; make modules_install
Install new kernel image
Reboot


On Wed, 2003-10-22 at 07:59, Fernando Barrocal wrote:
> Still after installing 1.2.8 it does not work. Do I need to compile ipt ?=
=20
> and the kernel ?
>=20
> At 19:15 21/10/2003, Daniel Chemko wrote:
> >Download ipt 1.2.8 or 1.2.9 if it is out.
> >Or, use the CVS userspace
> >
> ># KERNEL_DIR=3D<yourkerneldir> make
> ># make install
> >
> >You might want to change the destination directories in the Makefile to
> >conform to the Redhat deployment layout
> >LIBDIR=3D/lib/
> >MANDIR=3D/usr/man
> >etc..
> >
> >-----Original Message-----
> >From: Fernando Barrocal [mailto:fbarrocal@uol.com.br]
> >Sent: Tuesday, October 21, 2003 2:04 PM
> >To: netfilter@lists.netfilter.org
> >Subject: iptables1.2.7 + pptp + rh9
> >
> >
> >Hi,
> >
> >I am applying the pptp patch with patch-o-matic in my redhat 9.0.
> >Somebody
> >have somer step by step to patch the kernel, compile the iptable
> >userspace
> >and compile the kernel to accept DNAT ?
> >
> >Thanks in advance
> >
> >Fernando Barrocal
--=20
Evan Davies <evand@voiceplus.com.au>

--=_fileserver.voiceplus.com.au-5782-1066780237-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/lcZLBnmg6+tb+toRApbaAJ9nh2AYvHQghOdKt4UPuuXVQW/1uQCgpngi
AmoeRaEZdhW3MChTGMVm9iM=
=NOcM
-----END PGP SIGNATURE-----

--=_fileserver.voiceplus.com.au-5782-1066780237-0001-2--

