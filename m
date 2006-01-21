From: SainTiss <saintiss@gmx.net>
Subject: Re: ip forwarding: client has stalling problems
Date: Sat, 21 Jan 2006 14:31:52 +0100
Message-ID: <200601211431.55350.saintiss@gmx.net>
References: <200601201516.13638.saintiss@gmx.net>
	<Pine.LNX.4.58.0601201840060.12328@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart8434130.eU8Mzekh2z";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0601201840060.12328@blackhole.kfki.hu>
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

--nextPart8434130.eU8Mzekh2z
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Thanks for the tip,

However, after I did this both on server and client, nothing changed... Als=
o,=20
using 2.6.8 on the server doesn't help...

Did I maybe misunderstand (e.g. do I have to restart something after=20
echo'ing?) or maybe something else is the cause?

Also, is it the kernel on the server which is too "old", or the client one,=
 or=20
both?

Thanks,

Hans

On Friday 20 January 2006 18:41, Jozsef Kadlecsik wrote:
> On Fri, 20 Jan 2006, SainTiss wrote:
> > I just set up IP forwarding on a 2.6.12 debian system (server) and a
> > 2.6.12 ubuntu client. I used this script:
>
> Either upgrade to a more recent kernel in the 2.6.x series or disable TCP
> window tracking by
>
> # echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
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

--nextPart8434130.eU8Mzekh2z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBD0jfLXlnUYIbmLOQRAme0AJ9jrQMd7m+38mkqA3Zaeh4+ThW1IgCfSXMu
i+XJ6fPFIvXBrUniVhIOh+c=
=Pbc8
-----END PGP SIGNATURE-----

--nextPart8434130.eU8Mzekh2z--

