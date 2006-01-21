From: SainTiss <saintiss@gmx.net>
Subject: Re: ip forwarding: client has stalling problems
Date: Sat, 21 Jan 2006 21:10:52 +0100
Message-ID: <200601212110.54269.saintiss@gmx.net>
References: <200601201516.13638.saintiss@gmx.net>
	<200601211431.55350.saintiss@gmx.net>
	<Pine.LNX.4.58.0601211658550.12909@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2828773.OkAJpkSAsR";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0601211658550.12909@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

--nextPart2828773.OkAJpkSAsR
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

On Saturday 21 January 2006 17:06, Jozsef Kadlecsik wrote:
> On Sat, 21 Jan 2006, SainTiss wrote:
>
> As you are possibly behind an *DSL line, there might be that someone drops
> ICMP fragmentation needed packets. Read TCPMSS target in the iptables
> manpage and add the appropriate rule(s) to the firewall.

Now that seems to help a lot, provided I put this rule as the FIRST one in =
the=20
=46ORWARD chain, if I put it at the end, it doesn't change anything, probab=
ly=20
because then -j ACCEPT gets priority:

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS=20
=2D-clamp-mss-to-pmtu

So thanks a lot!

Hans

>
> Another possibility is an ECN hole somewhere between you and the
> destinations: try disabling TCP ECN on the client and give a try.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary

=2D-=20
If we cannot live so as to be happy, let us at least live so as to deserve =
it
 -- Immanuel Hermann Fichte

People are promoted up to their level of incompetence
 -- Peter's Principle

Ark Linux - Linux for the Masses (http://arklinux.org)

Hans Schippers
Aspirant FWO - Vlaanderen
=46ormal Techniques in Software Engineering (FoTS)
University of Antwerp
Middelheimlaan 1
2020 Antwerpen - Belgium
Phone: +32 3 265 38 71
=46ax: +32 3 265 37 77

--nextPart2828773.OkAJpkSAsR
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBD0pVOXlnUYIbmLOQRAnoDAJ0VNvPy7Uj7UvkBw6M7p2faZvIH0QCgnf69
OFmqGlBwHgX6SWHraZkg/Bk=
=a6Ka
-----END PGP SIGNATURE-----

--nextPart2828773.OkAJpkSAsR--

