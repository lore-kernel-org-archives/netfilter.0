From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: Routing rule for two gateways.
Date: Tue, 24 Sep 2002 00:02:48 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209240000160.15720-100000@grignard.amagerkollegiet.dk>
References: <200209231414.g8NEEjv24590@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209231414.g8NEEjv24590@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Mon, 23 Sep 2002, Antony Stone wrote:

> On Monday 23 September 2002 2:42 pm, Sundaram Ramasamy wrote:
>
> > What is the Linux command and syntax to set two default gateway.

> The question does not make sense.   You can have two (or more) gateways, =
but
> only one of them can be the default.

You'll find on http://www.lartc.org/howto/lartc.rpdb.multiple-links.html
that this is not entirely true - you can use multipath routes (but this
require support compiled into the kernel). However this has nothing to
do with iptables/netfilter at all.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
The reason we come up with new versions is not to fix bugs.
                                              -- Bill Gates
----------------------------------[ moffe at amagerkollegiet dot dk ] --


