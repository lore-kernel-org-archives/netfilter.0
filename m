From: "Michael H. Warfield" <mhw@wittsend.com>
Subject: Re: Trojaned tcpdump and libpcap
Date: Wed, 13 Nov 2002 12:10:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021113171026.GI7463@alcove.wittsend.com>
References: <91F7518FF779D41181A700010266356D015555E1@mail.springbound.com> <000201c28b31$490a37e0$52cc53c6@simutronics.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="TA4f0niHM6tHt3xR"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000201c28b31$490a37e0$52cc53c6@simutronics.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: James Miller <jimm@simutronics.com>
Cc: netfilter@lists.netfilter.org


--TA4f0niHM6tHt3xR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2002 at 10:25:30AM -0600, James Miller wrote:
> Hello all

> I have been a long time reader of this list.  An associate passed this al=
ong
> to me this morning and I wanted to share it with everyone.

> http://hlug.fscker.com/
> Latest libpcap & tcpdump sources from tcpdump.org contain a trojan.

> Affected version are:
> libpcap-0.7.1.tar.gz
> tcpdump-3.6.2.tar.gz
> tcpdump-3.7.1.tar.gz

	Downloads from October 30 have been confirmed good.  Downloads
after November 12 confirmed bad.  Anything in-between is anyone's guess.
If anyone downloaded those sources between those two dates, please contact
me with the package md5sums.  I want to narrow down the time frame.
CVS repository does NOT appear to have been compromised.

	Good:

03e5eac68c65b7e6ce8da03b0b0b225e  tcpdump-3.7.1.tar.gz
0597c23e3496a5c108097b2a0f1bd0c7  libpcap-0.7.1.tar.gz

	Bad:

3c410d8434e63fb3931fe77328e4dd88  tcpdump-3.7.1.bad.tar.gz
73ba7af963aff7c9e23fa1308a793dca  libpcap-0.7.1.bad.tar.gz

> Regards,
> Jim

	Mike
--=20
 Michael H. Warfield    |  (770) 985-6132   |  mhw@WittsEnd.com
  /\/\|=3Dmhw=3D|\/\/       |  (678) 463-0932   |  http://www.wittsend.com/=
mhw/
  NIC whois:  MHW9      |  An optimist believes we live in the best of all
 PGP Key: 0xDF1DD471    |  possible worlds.  A pessimist is sure of it!

--TA4f0niHM6tHt3xR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iQCVAwUBPdKHguHJS0bfHdRxAQGAnAQAwNm/9IzDza90dxhposTZoeVtgzjjeipY
BJlgyhbeyLKvC5DoBMxn7eW29tl7+4e4FFQOsMKkaCyw+sCbc12hb3hWlNLzQeGO
DrVpeLCaZsFuEZndl9Y7c7dLQvl4jUZVoLgIR8TDUXv9oz0TvjTA+1MUWZ/bEDPP
xpkiaOEc1yg=
=gt4S
-----END PGP SIGNATURE-----

--TA4f0niHM6tHt3xR--

