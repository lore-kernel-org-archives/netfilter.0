From: Pedro Salazar <pedro-b-salazar@ptinovacao.pt>
Subject: Re: load-balancing with netfilter: round robin or what??
Date: 06 Oct 2003 14:38:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065447521.1604.174.camel@vitoria.intra.cet.pt>
References: <1065434375.1604.33.camel@vitoria.intra.cet.pt>
	 <3F81509E.3080600@surestorm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F81509E.3080600@surestorm.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan G - Mailing List <email-lists@surestorm.com>
Cc: netfilter@lists.netfilter.org

Greetings,

On Mon, 2003-10-06 at 12:23, Jonathan G - Mailing List wrote:
> Hi pedro / Hola pedro,
>=20

Hi Jonathan,

(BTW: I'm portuguese and not spanish, so it's "Ol=E1" and not "Hola", but
you have tried ;-)

> what do you want? LB for firewalls or LB for web servers? I didn't=20
> understand your question.
>=20

For production purposes I'll have a black box (specific hardware) that
will do the load-balancing and fail-over redundancy (high availability)
by IP (not by service).


> If the reality is that you need a load balancing of web servers you may=20
> deploy easy dns round robin. this could be easy to configure but a bad=20
> idea for high information volume.
>=20

No, I'm not interested in DNS round-robin.

> If you prefer you may implement HA (high availability) with a master and =

> a slave box. With this config one of your server will ask connections=20
> until it falls, then the second box will answer connections to the=20
> moment tha first comes up. This is the most used implementation to give=20
> continuosuly service.
>=20
> I have deployed in many installations this configuration for firewalls.=20
> I have used VRRP (virtual redundancy routing protocol) on nokia boxes=20
> for CheckPoint Firewall-1 clusters and works fine. You may use the same=20
> idea installing the vrrpd daemon in the www boxes. Could run fine.
>=20

Yes, I already tried VRRP for high-availability. One would be the
master, and one of the others slaves would assume that role in case of
primary failure. But I never used the VRRP in a load-balancing way but
always in high-availability mode.

Since my application servers (JBOSS/J2EE) and database servers (Oracle
RAC) are in *cluster* mode, I want to deliver requests in a
load-balancing way, to distribute the pay load to all of them. And it
would be to the cluster it self to decide what would be the node to
dispatch the request.

For now, since I haven't yet the black box to do the load balancing, I'm
simulating with NAT. However, I don't know what is the algorithm to
distribute the requests. Only when I pick 1000 requests I see
"load-balancing". Until then, single and manual requests, only one
server is handling the requests. For sure, I can say that it's not a
round robin algorithm.=20

My question is, could I put a round robin specific algorithm or any
other politic though NAT??? Or should I go for another solution? There
are more advanced solutions as Linux Virtual Server to do the job, but
it would be a more complex solution.

BTW, I'm using Linux Redhat AS 2.1. I believe that could exist a
solution integrated on it...

thanks,
Pedro Salazar.
--=20
PS
pedro-b-salazar@ptinovacao.pt
PGP:0E129E31D803BC61


