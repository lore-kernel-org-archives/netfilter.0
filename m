From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: next topic:  --limit and --burst-limit
Date: 31 Oct 2002 09:24:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036052695.21032.21.camel@elendil>
References: <Pine.LNX.4.44.0210301343140.24838-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210301343140.24838-100000@localhost.localdomain>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

Le mer 30/10/2002 =E0 19:47, Robert P. J. Day a =E9crit :
>   first, as i read it, you can use the "--limit" option by itself,
> without --burst-limit.  if you do that, then this limit is considered
> a *hard* limit -- say 5/sec -- and once you hit that limit, you're
> done until the next time unit.  is this correct?

No.
If you do not specify burst, then it has a default value of 5. So

        --limit 5/s

is the same as

        --limit 5/s --bust-limit 5

From libipt_limit.c :
[...]
#define IPT_LIMIT_AVG   "3/hour"
#define IPT_LIMIT_BURST 5
[...]

These are default values, that are used if nothing's specified. To
achieve what you descriobe, you have to explicitly specify a burst of 0.
=20
>   adding "--burst-limit", on the other hand, allows you to exceed
> the first limit, but you end up paying for it down the road.

Adding --burst-limit allows you to specify another value than the
default one.

> however, i'm still unclear on what the burst-limit represents
> and how it gets recharged.  can someone explain this, preferably
> with an example containing numbers? =20

It is a bit difficult for me to give a more expressive exemple than the
one in Linux 2.4 Packet Filtering HOWTO at :

http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7.ht=
ml

So I'll try to explain it a bit...

Limit is a bucket. This bucket is separated in two parts. The first one
is the burst. The second one is the limit. You do not apply the limit
until burst is full. This bucket is emptying a limit rate.

        |       |
        |       | <---- limit
        |-------|
        |       |
        |       | <---- burst
        |_______|

So, in the HOWTO exemple, (limit 1/s, burst 5, 4 packet/s flow), you're
filling the burst part of the bucket the first second. The second one,
the burst part is filled when receiving the 2nd packet. So, we begin to
fill the limit part of the bucket, and the limit of 1/s is beginning to
apply. I can accept the sixth packet, but not the following one,
arriving at the same second. When the second ends, I can flush the limit
part of the bucket, so I can accept more packets on top of the burst
part, within the limit.

Later, the flow stops. Each second I do not receive a packet, one packet
is taken from the bucket (because it's 1/s limit). For limit part is
empty, then we take it from the burst part. And then, if it goes again,
the burst part is getting filled again, and once filled, the limit
applies. And so on...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

