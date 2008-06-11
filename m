From: Eric Leblond <eric@inl.fr>
Subject: Re: Is it possible to log SNAT mappings?
Date: Wed, 11 Jun 2008 16:41:16 +0200
Message-ID: <20080611144116.GG10043@khasse.inl.fr>
References: <Pine.LNX.4.44L0.0806111021350.2459-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.0806111021350.2459-100000@iolanthe.rowland.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: netfilter@vger.kernel.org


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wednesday, 2008 June 11 at 10:25:07 -0400, Alan Stern wrote:
> Is there any setting in the kernel or in iptables that will enable
> generation of a log of all SNAT mappings as they are created?  The log
> should include the original source [IP, protocol, port] plus the mapped
> [IP, port].

You can use ulogd2 to achieve this. It can take netfilter_conntrack as
input and store the event in database or files.

The software is in pre rc state but it is working fine for me.

URLs:
 * Homepage: http://www.netfilter.org/projects/ulogd/index.html
 * user doc: http://software.inl.fr/trac/wiki/ulogd2/user=20
 * tutorial: http://www.wzdftpd.net/blog/index.php?2008/04/05/19-ulogd2-the=
-new-userspace-logging-daemon-for-netfilter-iptables-part-2
 * devel doc: http://home.regit.org/?page_id=3D90

BR,
--=20
Eric Leblond
INL: http://www.inl.fr/
NuFW: http://www.nufw.org/

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIT+QMnxA7CdMWjzIRAqT1AJ4ro3Kvg6LTM7TnxSVyNfy8lXv0xwCfVro2
9hmQKkLWrfYVQMh0l16M1Wg=
=bII3
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
