From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing rule for two gateways.
Date: Mon, 23 Sep 2002 23:13:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020923221346.SLKP2092.mta07-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0209240000160.15720-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209240000160.15720-100000@grignard.amagerkollegiet.dk>
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
To: netfilter@lists.netfilter.org

On Monday 23 September 2002 11:02 pm, Rasmus B=F8g Hansen wrote:

> On Mon, 23 Sep 2002, Antony Stone wrote:
> > On Monday 23 September 2002 2:42 pm, Sundaram Ramasamy wrote:
> > > What is the Linux command and syntax to set two default gateway.
> >
> > The question does not make sense.   You can have two (or more) gateways,
> > but only one of them can be the default.
>
> You'll find on http://www.lartc.org/howto/lartc.rpdb.multiple-links.html
> that this is not entirely true - you can use multipath routes (but this
> require support compiled into the kernel).

Um....   Although I agree that multipath routing can certainly be done, I=20
still don't think this is the same as "two default routes" (for the reason =
I=20
gave above).

In fact on the webpage you quote it shows how to set up two routes with=20
specific routing tables for each.   Once that is done, one of them is=20
designated to be the default route.   One of them......

It is certainly possible to have two (or more) routes from a network of=20
computers to the Internet.   However for each machine in the network, or fo=
r=20
each gateway router, there can only be one default route.

Antony.

--=20

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play=
=20
with them

