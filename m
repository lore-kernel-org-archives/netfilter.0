From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: sysctl ip_queue_maxlen variable
Date: Thu, 15 Jul 2004 09:03:55 +0200
Sender: kernelnewbies-bounce@nl.linux.org
Message-ID: <20040715070355.GB21084@zion.homelinux.com>
References: <OFE5293A42.0467D741-ON65256ED2.001F2429@hss.hns.com> <20040715065127.GA21084@zion.homelinux.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Return-path: <kernelnewbies-bounce@nl.linux.org>
Content-Disposition: inline
In-Reply-To: <20040715065127.GA21084@zion.homelinux.com>
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <netfilter.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:riel@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
To: aksingh@hss.hns.com
Cc: kernelnewbies@nl.linux.org, netfilter@lists.netfilter.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Sorry, replying to myself, but

On Thu, Jul 15, 2004 at 08:51:27AM +0200, Sven Schuster told us:
> in which kernel version did you find this?? I've looked at 2.6.8-rc1
> and 2.4.26, and in both kernel versions the variable used for the
> sysctl and for checking in ip_queue.c. There is no variable=20

is queue_maxlen I forgot :-))          ^^

> sysctl_maxlen in this file.

--=20
Linux zion 2.6.8-rc1 #3 Mon Jul 12 22:38:00 CEST 2004 i686 athlon i386 GNU/=
Linux
 09:01:34  up 2 days, 10:19,  1 user,  load average: 0.03, 0.04, 0.00

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFA9ixbo4FAdB2PneQRAgAZAJ4vFX2X3vs52fu1CdqUWw7gqYSJwQCfYgs4
I2V/2l2ohcieOgaYNSVI69Y=
=Jh3f
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--

--
Kernelnewbies: Help each other learn about the Linux kernel.
Archive:       http://mail.nl.linux.org/kernelnewbies/
FAQ:           http://kernelnewbies.org/faq/

