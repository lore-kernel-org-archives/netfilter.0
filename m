From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: Routing rule for two gateways.
Date: Tue, 24 Sep 2002 01:32:22 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209240127480.15720-100000@grignard.amagerkollegiet.dk>
References: <20020923221346.SLKP2092.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020923221346.SLKP2092.mta07-svc.ntlworld.com@there>
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
To: netfilter@lists.netfilter.org

On Mon, 23 Sep 2002, Antony Stone wrote:

> > You'll find on http://www.lartc.org/howto/lartc.rpdb.multiple-links.htm=
l
> > that this is not entirely true - you can use multipath routes (but this
> > require support compiled into the kernel).
>
> Um....   Although I agree that multipath routing can certainly be done, I
> still don't think this is the same as "two default routes" (for the reaso=
n I
> gave above).

Well, it will never be the same as true bundling - however close enough
to be useful.

> In fact on the webpage you quote it shows how to set up two routes with
> specific routing tables for each.   Once that is done, one of them is
> designated to be the default route.   One of them......

That's right, but with multipath routing the non-default route will be
used too.

> It is certainly possible to have two (or more) routes from a network of
> computers to the Internet.   However for each machine in the network, or =
for
> each gateway router, there can only be one default route.

It does not matter for the client machines if you have a dedicated
router, which is aware of multipath routing - but of course that router
needs to know of the different routes and how to use them.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
The reason we come up with new versions is not to fix bugs.
                                              -- Bill Gates
----------------------------------[ moffe at amagerkollegiet dot dk ] --




