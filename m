From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: ECN target does not behave as expected
Date: Tue, 7 Jan 2003 11:23:49 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301071122270.2806-100000@grignard.amagerkollegiet.dk>
References: <004101c2b62a$37489320$a268c451@Marius>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004101c2b62a$37489320$a268c451@Marius>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Marius Cristian CONSTANTIN <mconstantin@speedymail.org>
Cc: netfilter@lists.netfilter.org

On Tue, 7 Jan 2003, Marius Cristian CONSTANTIN wrote:

>     I am running a firewall based on 2.4.20 kernel and 1.2.7a iptables
> version. Also patch-o-matic is version 20020825.
>     I am tryin to disable ECN per destination host, using -j ECN target
> and --ecn-tcp-remove option.
>     When I try to connect to the hosts using the rule in mangle table, if
> the tcp_ecn option is enabled, tcpdump shows bad checksum. According to
> documentation this is only a display bug, because tcpdump has a copy of
> packet, and does not see entire info. Still, I cannot connect to the host=
=2E
>     If I disable ECN entirely (by using /proc/sys/net/ipv4/tcp_ecn)
> connection works perfectly. Any clue or indication to achieve the desire
> results (ECN enabled in general, but disabled for some hosts)?.
>     I've searched the archives, found someone reporting similar problem
> (http://lists.netfilter.org/pipermail/netfilter/2002-August/037228.html),
> but no answer.

Apparently you need the patch below - at least that works for me:

diff -urN linux-2.4.20.orig/net/ipv4/netfilter/ipt_ECN.c linux-2.4.20/net/i=
pv4/netfilter/ipt_ECN.c
--- linux-2.4.20.orig/net/ipv4/netfilter/ipt_ECN.c=092002-11-29 00:53:15.00=
0000000 +0100
+++ linux-2.4.20/net/ipv4/netfilter/ipt_ECN.c=092002-12-28 20:08:20.0000000=
00 +0100
@@ -87,8 +87,8 @@
 =09}

 =09if (diffs[0] !=3D *tcpflags) {
-=09=09diffs[0] =3D htons(diffs[0]) ^ 0xFFFF;
-=09=09diffs[1] =3D htons(*tcpflags);
+=09=09diffs[0] =3D diffs[0] ^ 0xFFFF;
+=09=09diffs[1] =3D *tcpflags;
 =09=09tcph->check =3D csum_fold(csum_partial((char *)diffs,
 =09=09                                    sizeof(diffs),
 =09=09                                    tcph->check^0xFFFF));

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
Expect the unexpected.
- HitchHikers Guide to the Galaxy, Douglas Adams
----------------------------------[ moffe at amagerkollegiet dot dk ] --


