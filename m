From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Re: iptables problem (nfcan: addressed to exclusive
	sender for this address)
Date: Thu, 3 Nov 2005 17:23:47 +0100
Message-ID: <20051103162346.GA31304@zion.homelinux.com>
References: <20051103062533.C48C96AA57@smtp.sterenborg.info>
	<4369B1F2.50804@pcraft.com> <20051103152158.GA14687@salty>
	<436A34B2.1080909@pcraft.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <436A34B2.1080909@pcraft.com>
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
To: "Ashley M. Kirchner" <ashley@pcraft.com>
Cc: netfilter@lists.netfilter.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi Ashley,

On Thu, Nov 03, 2005 at 09:02:58AM -0700, Ashley M. Kirchner told us:
>    And I can't tell the other company to send data to separate IPs=20
> either because their system works based on the packet they first receive=
=20
> when the kiosk contacts them.  Which goes back to my point above (about=
=20
> putting the kiosks outside the firewall.)

you say "their" system works based on the packet they first receive
when contacting them. So with multiple IPs, wouldn't it work to let
each kiosk contact the server via its own IP address via SNAT??
E.g. kiosk 1 which is internally 1.2.3.4 gets natted to the public
ip 5.6.7.8, so when it contacts the server it will establish a
connection back to 5.6.7.8 which will in turn be DNATted to 1.2.3.4.
kiosk 2 (1.2.3.5) --> 5.6.7.9
and so on...
I haven't read the whole thread, so it might be that I missed
something :-)

Wouldn't this work??


HTH

Sven

--=20
Linux zion.homelinux.com 2.6.14-rc5-mm1_14 #14 Wed Nov 2 11:36:18 CET 2005 =
i686 athlon i386 GNU/Linux
 17:19:16 up 1 day,  5:25,  2 users,  load average: 0.38, 0.18, 0.07

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDajmSo4FAdB2PneQRAo3dAJ9gjZMANl3Tk4r5WL5W1eG29UsnmACdFVAY
GF1LX7LMIUrAvMg+mfGOB2M=
=Z/xx
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

