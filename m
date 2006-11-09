From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: conntrack -E -i not allowed?
Date: Thu, 9 Nov 2006 08:52:10 -0800
Message-ID: <200611090852.14878.alan.ezust@presinet.com>
References: <200611011043.53370.alan.ezust@presinet.com>
	<200611071037.52450.alan.ezust@presinet.com>
	<4552302B.1030509@netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1486872.uSFkXzkcE9";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4552302B.1030509@netfilter.org>
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
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@lists.netfilter.org

--nextPart1486872.uSFkXzkcE9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Thanks for the reply. Ok, I can see how I can generate some IDs, but I firs=
t=20
want to make sure i have all of the information I need.

When I run conntrack, I only see one protocol number. I think it is a layer=
4=20
protocol (tcp vs udp). If I'm not seeing an l3proto in my output, why might=
=20
that be?

udp      17 12 src=3D10.10.201.2 dst=3D204.174.64.1 sport=3D54475 dport=3D5=
3=20
src=3D204.174.64.1 dst=3D209.53.156.2 sport=3D53 dport=3D54475 use=3D1 mark=
=3D0
tcp      6 420332 ESTABLISHED src=3D10.10.100.3 dst=3D10.10.1.22 sport=3D13=
56=20
dport=3D5432 src=3D10.10.1.22 dst=3D10.10.100.3 sport=3D5432 dport=3D1356 [=
ASSURED]=20
use=3D1 mark=3D0


On Wednesday 08 November 2006 11:29, Pablo Neira Ayuso wrote:
> Alan Ezust wrote:
> > We need to be able to determine when we get an UPDATE or a DISCONNECT,
> > which connections they correspond to. I assumed that was the purpose of
> > the CT id.
>
> The purpose was to uniquely identify a connection but we currenlty
> assume that the tuple {src, portsrc, dst, portdst, l3protonum, protonum}
> is enough.
>
> > Why are you removing it?
>
> http://lists.netfilter.org/pipermail/netfilter-devel/2005-June/019923.html

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC,Canada

--nextPart1486872.uSFkXzkcE9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFU1y+sJbtw6GURksRAiFpAJ9Q3imOyJzD0vyr09Wd7pBKe9MMiACfWXyU
tEnaaDZQCtBxf+YSwtULCoI=
=76sf
-----END PGP SIGNATURE-----

--nextPart1486872.uSFkXzkcE9--

