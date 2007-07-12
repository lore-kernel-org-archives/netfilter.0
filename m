From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: Conntrack table full  freeze  my Heavy loaded QoS manager...
Date: Thu, 12 Jul 2007 14:30:13 -0700
Message-ID: <200707121430.16749.alan.ezust@presinet.com>
References: <462BEF56.10006@zensoluciones.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2604254.GrrlYZ5omW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462BEF56.10006@zensoluciones.com>
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

--nextPart2604254.GrrlYZ5omW
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


I've been noticing periodic freezing in linux 2.6.16.29 with L7-filters in=
=20
combination with the "imesh" protocol pattern. When I stop checking against=
=20
that L7 protocol, the freezing goes away.



On Sunday 22 April 2007 16:27, S=E9bastien CRAMATTE wrote:
> Hello
>
> I'm running  a  L7 QoS manager with 2.6.18 kernel  under debian sarge 3.1
> The server is p4 hyper threading  + 3 gb of ram.
>
> The server freeze under heavy traffic ...
> I've increased  conntrack_max   but is insuficient !
>
> # cat /etc/sysctl.conf
>
> > net.ipv4.netfilter.ip_conntrack_max =3D 131072
>
> Any ideas, tips ?
>
> Regards

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart2604254.GrrlYZ5omW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGlp1osJbtw6GURksRAgx9AJ4uSRihPr9XUwKMFOIkjL9VNNzTjACgnkaM
4bSzhVpiVqI+Q3At3qb7z6Y=
=S5nC
-----END PGP SIGNATURE-----

--nextPart2604254.GrrlYZ5omW--

