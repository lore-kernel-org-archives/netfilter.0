From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: traceroute
Date: Wed, 30 Jun 2004 11:21:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62E80C@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter <netfilter@lists.netfilter.org>

I use -I INPUT ESTABLISHED,RELATED.

I can ping outbound just fine, ESTABLISHED,RELATED keeps track of the
ICMPs.

Here:

$ ping yahoo.com
PING yahoo.com (216.109.127.28) 56(84) bytes of data.
64 bytes from w1.rc.dcn.yahoo.com (216.109.127.28): icmp_seq=3D1 =
ttl=3D54
time=3D114 ms
--- yahoo.com ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev =3D 114.523/114.523/114.523/0.000 ms
$

I do not allow any ICMP explicitly and I have never had a problem using
NAT or similar.

I do not know where you are getting your info from, but it is clearly
incorrect.

-----Original Message-----
From: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]=20
Sent: Wednesday, June 30, 2004 11:19 AM
To: Piszcz, Justin Michael
Cc: netfilter
Subject: RE: traceroute

On Wed, 30 Jun 2004, Piszcz, Justin Michael wrote:

> ICMP is "allowed" when you -I INPUT ESTABLISHED,RELATED.

That's false.

> You do not have to allow it explicitly (ie: allow icmp so other
machines
> can ping your machine).

That's false, again.

Read the documentation and do not spread false info.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


