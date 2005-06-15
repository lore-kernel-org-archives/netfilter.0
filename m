From: "Robert MacDonald" <Robert.MacDonald@Haworth.com>
Subject: Windows TTL Logic
Date: Wed, 15 Jun 2005 11:46:42 -0400
Message-ID: <8DC39BE09F7F494AB446DF9D9FDE3CBAED335D@nahollex01.na.haworthinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

While looking through log output, I noticed the TTL is different when
communicating to internal / external locations. But what caught my =
attention
was the TTL Windows used for two devices on the same network.
=20
I understand what the TTL is used for, but how the TTL is chosen is
what eludes me.
=20
I've done some poking around and obviously haven't poked into the
correct place, but what is the logic behind Windows choosing the
TTL to use when sending packets?
=20
Below is a PING to two systems on the same network, but Windows
chose a different TTL for each device. Both devices are 3 (logical)
hops from me, which both TTL's show.
=20
(All masks are 20 bits.)
   10.64.175.253 =3D router
   10.64.0.7 =3D router [start of GRE tunnel]
   10.208.224.1 =3D router [end of GRE tunnel]
   10.208.224.63 =3D client node beyond the router
=20
Dumb ASCII art.
=20
[Client]--[10.64.175.253]--[10.64.0.7]--IPSECtunnel--[10.208.224.1]--[10.=
208.224.63]
=20
c:\>ping -n 2 10.208.224.1
=20
Reply from 10.208.224.1: bytes=3D32 time=3D217ms TTL=3D253
Reply from 10.208.224.1: bytes=3D32 time=3D176ms TTL=3D253
=20
c:\>ping -n 2 10.208.224.63
=20
Reply from 10.208.224.63: bytes=3D32 time=3D234ms TTL=3D61
Reply from 10.208.224.63: bytes=3D32 time=3D253ms TTL=3D61
=20
c:\>tracert 10.208.224.63
=20
Tracing route to 10.208.224.63 over a maximum of 30 hops
=20
  1    <1 ms    <1 ms    <1 ms  10.64.175.253
  2    24 ms    10 ms    55 ms  10.64.0.7
  3   271 ms   280 ms   229 ms  10.208.224.63
=20
TIA,
Robert


