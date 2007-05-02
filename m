From: Michelle Konzack <linux4michelle@freenet.de>
Subject: Re: Wireless Login Page
Date: Wed, 2 May 2007 19:18:59 +0200
Message-ID: <20070502171859.GG1894@freenet.de>
References: <1177772620.3828.176.camel@ws1.walco02.com>
	<46338845.1020605@lopsch.com>
	<1177785807.3828.227.camel@ws1.walco02.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1177785807.3828.227.camel@ws1.walco02.com>
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
To: netfilter@lists.netfilter.org


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kirk and *,

Am 2007-04-28 11:43:27, schrieb Kirk Wallace:
> I was using 192.168.21.2 just to test whether httpd would respond to any
> IP address sent on the 192.168.21.0/24 address space.=20
>=20
> I envision that a person would boot their wireless laptop and scan for
> hotspots. They would see my hotspot and connect. Then my DHCP server
> would give the laptop an IP address, subnet mask, gateway address, DNS1
> and DNS2. Then the user would start firefox and try to open a link to
> anywhere.com, but I have FORWARD denied to all but logged in users
> (which have a tunnel IP address on another subnet). At this point, I
> want the anywhere.com request to invoke the httpd on the wireless router
> to reply with a login page. Currently dhcpd, httpd, radiusd and pptpd
> are on the same PC.

This is exactly what I want to do to.

But if the $CLIENT has gotten its DHCP-IP-Addressm then ANY
connections (any Ports except DNS and DHCP) nust be blocked
until the user has once started a Webbrowser and authentificated.

I was thinking, that if the $USER open a connection plus auth,
the connection will be droped for example 5 minutes after the
last traffic going over the Interface with the specified MAC/IP.

I have not found any examples ho to do this.

Would you like to share your config?

And speciay how you have setup your "fist-connect" page to auth?

Greetings
    Michelle Konzack
    Systemadministrator
    Tamay Dogan Network
    Debian GNU/Linux Consultant


--=20
Linux-User #280138 with the Linux Counter, http://counter.li.org/
##################### Debian GNU/Linux Consultant #####################
Michelle Konzack   Apt. 917                  ICQ #328449886
                   50, rue de Soultz         MSN LinuxMichi
0033/6/61925193    67100 Strasbourg/France   IRC #Debian (irc.icq.com)

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.pgp"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFGOMgDC0FPBMSS+BIRAvXpAJ4weGsbdTLWBc7nhG//QXXvuDTJRgCgt87k
q68wCUc8OWO5xGeQf7Qsw6Q=
=5vrB
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--

