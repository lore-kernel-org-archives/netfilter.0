From: Tony Earnshaw <tonni@billy.demon.nl>
Subject: Re: dns server
Date: 06 Jun 2002 17:06:30 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023375991.8473.43.camel@billy.demon.nl>
References: <Pine.LNX.4.21.0206061542060.7290-100000@dns.toxicfilms.tv>
	<200206061548.32785.raymondl@knowledgefactory.co.za> 
	<200206061400.g56E0BA31175@vulcan.rissington.net> 
	<1023374193.1070.14.camel@icewind.arne.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-IwTu2+XW2kHArOl4Q+Ff"
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1023374193.1070.14.camel@icewind.arne.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Arne Sagnes <ASagnes@Tickets.com>
Cc: NetFilter <netfilter@lists.samba.org>


--=-IwTu2+XW2kHArOl4Q+Ff
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

tor, 2002-06-06 kl. 16:36 skrev Arne Sagnes:

>   DNS, specifically Bind, has options in the named.conf to limit zone
> transfers and recursive lookups.  You can use the 'allow-transfer { IP;
> IP };' directive to restrict zone transfers.

Yes, but this nothing to do with netfilter. Nor the purpose for which
the name server is intended.

E.g. I don't even want people querying my Compaq notebook DNS. It's a
caching DNS and not meant for others.

Nevertheless, because of the nasties on the Internet (see CERT Advisory
CA-2002-15 Denial-of-Service Vulnerability in ISC BIND 9, Original
release date: June 04, 2002), one *hell* of a lot of nasties are trying,
at the moment (yes, thanks Oskar, for pointing out the use of logging).

What they're actually trying, is to get to stop traffic to my Compaq.

N=E6hnen=E6hnen=E6hne, nasties! I've got iptables and you can't get me.

*That's* what Netfilter is all about.

Tony

Henne er "tickets.com" henne, Arne; du som sier at du "engang var
nordmann"? Flyttet til Utlandet, er du?

--=20

Tony Earnshaw

e-post:		tonni@billy.demon.nl
www:		http://www.billy.demon.nl
gpg public key:	http://www.billy.demon.nl/tonni.armor

Telefoon:	(+31) (0)172 530428
Mobiel:		(+31) (0)6 51153356

GPG Fingerprint =3D 3924 6BF8 A755 DE1A 4AD6 FA2B F7D7 6051 3BE7 B981
3BE7B981



--=-IwTu2+XW2kHArOl4Q+Ff
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dette er en digitalt signert meldingsdel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA8/3p299dgUTvnuYERAgFOAKCCl1CCVFFt7vPqSFp2HpeDylWMSwCeImVe
10uaTWontynz8GAISSZfIL8=
=D7/t
-----END PGP SIGNATURE-----

--=-IwTu2+XW2kHArOl4Q+Ff--


