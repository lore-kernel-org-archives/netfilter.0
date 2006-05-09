From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP Redirect
Date: Tue, 09 May 2006 14:25:51 +0200
Message-ID: <1147177552.4881.63.camel@anduril.intranet.cartel-securite.net>
References: <20060507071911.55929.qmail@web35005.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060507071911.55929.qmail@web35005.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: "R. Rajasekaran" <rrajas@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le dimanche 07 mai 2006 =E0 00:19 -0700, R. Rajasekaran a =E9crit :
> IP of H1   =3D 10.0.0.1
> IP of H2   =3D 10.0.0.2
[...]
> >From 10.0.0.2: icmp_seq=3D1 Redirect Host (New nexthop:
> 10.0.0.3)
[...]
> The above behaviour is of Linux functionality.
> Here the redirect uses the next-hop address as
> 10.0.0.3.  What is the reason of it ?

Because your network setting is just wrong. The smallest network mask
you can set on this type of link is /30, i.e. 10.0.0.0/30. Then you
have :

	10.0.0.0 as network address
	10.0.0.3 as broadcast address
	10.0.0.1 and 10.0.0.2 as host addresses

If you send a packet from H1 to H2 destined to 10.0.0.3, H2 will
complain because he's not the best router for H1 to reach 10.0.0.3. As
describe by network mask, H1 should reach 10.0.0.3 directly on link,
without using H2 as a router, thus you gety an ICMP Redirect.

This is still true if network mask is wider than /30, because then,
10.0.0.3 will be a host address belonging to H1 and H2 local link. Then
there's not reason for H1 to go through H2 to reach it, and you get an
ICMP redirect again.

Set your network as 10.0.0.0/30 and try to ping 10.0.0.5 instead. BTW,
there's nothing related to Netfilter in this behaviour.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

