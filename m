From: Mateus Cordeiro Inssa <mateus@hyperdrive.com.br>
Subject: Re: Target ROUTE
Date: Wed, 5 Jan 2005 10:23:15 -0200
Message-ID: <200501051023.19267.mateus@hyperdrive.com.br>
References: <20050105092351.2652e925@jcesar.fnde.gov.br>
	<002801c4f322$70d1ece0$8b00000a@casa>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2278009.TEl8A0Bo7D";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002801c4f322$70d1ece0$8b00000a@casa>
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

--nextPart2278009.TEl8A0Bo7D
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


  Or just use de MARK target and use iproute2 to route by mark.

  []'s

Em Quarta 05 Janeiro 2005 10:31, Leonardo Rodrigues Magalh=E3es escreveu:
>     That means your kernel or/AND iptables doesnt have the ROUTE target
> compiled and ready for use.
>
>     Try the command:    iptables -j ROUTE --help
>
>     If ROUTE target is compiled, you should see something like this:
>
> ROUTE target v1.8 options:
>     --oif       ifname          Route the packet through `ifname' network
> interface
>     --iif       ifname          Change the packet's incoming interface to
> `ifname'
>     --gw        ip              Route the packet via this gateway
>     --continue                  Route the packet and continue traversing
> the rules. Not valid with --iif.
>
>     on the end of the help message. If you see only the iptables help, th=
at
> means ROUTE is really not compiled.
>
>     If that's the case, you'll need to get a patch-o-matic file, apply
> ROUTE patch on your kernel source, recompile and install the new kernel a=
nd
> probably recompile iptables also.
>
>
>     Sincerily,
>     Leonardo Rodrigues
>
>
> ----- Original Message -----
> From: "J=FAlio C=E9sar de Magalh=E3es" <jcesar@fnde.gov.br>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, January 05, 2005 8:23 AM
> Subject: Target ROUTE
>
>
> i need all my network trafic to any host on 995 port goes to another
> gateway then the default. So i execute the following iptables command:
> iptables -t mangle -A OUTPUT -p tcp --dport  995 -j ROUTE --gw x.x.x.x
> where x.x.x.x is my another gateway .
>
> The problem  when i execute the iptables command above is this:
> iptables: No chain/target/match by that name
>
> thanks a lot
>
> J=FAlio C=E9sar de Magalh=E3es
> Analista de Suporte - Poliedro/FNDE
> (61) 81177547 Bras=EDlia - DF

=2D-=20
Mateus Cordeiro Inssa
=2D-------------------------------------
Linux User: 76186 Kernel: 2.6.10-rc2mateus
ICQ (Kopete): 15243895
AIM: blaublaux
MSN: mateusinssa@hotmail.com
=2D-------------------------------------
mateus@hyperdrive.com.br

Qua Jan  5 10:22:08 BRST 2005

--nextPart2278009.TEl8A0Bo7D
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBB29w3UYaAS0OlRg8RAp2+AKCokuPmACJiKFbx7UAWAl09j7BSXQCaAlYE
x21cKy5eIdBHohu4AVpaStU=
=i58/
-----END PGP SIGNATURE-----

--nextPart2278009.TEl8A0Bo7D--

