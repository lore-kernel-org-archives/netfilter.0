From: Jason Opperisano <opie@817west.com>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 10:58:08 -0500
Message-ID: <20050211155808.GA2756@bender.817west.com>
References: <200502111757.16352.e-boogie@yandex.ru>
	<20050211150635.GA2371@bender.817west.com>
	<200502111641.19968.victor@nk.nl>
	<20050211154955.GA2644@bender.817west.com>
	<1108137730.5565.71.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1108137730.5565.71.camel@anduril.intranet.cartel-securite.net>
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
To: netfilter@lists.netfilter.org

On Fri, Feb 11, 2005 at 05:02:09PM +0100, Cedric Blancher wrote:
> Le vendredi 11 f=E9vrier 2005 =E0 10:49 -0500, Jason Opperisano a =E9cr=
it :
> > in theory--they are RELATED.  in practice, i allow them explicitly.
> > looking at one of my firewalls, it appears as though there are ICMP T=
ype
> > 3 packets that get past the RELATED rule and hit the explicit allow r=
ule,
>=20
> Did you have a look at one of them, just to see if it's a legitimate
> one ? I have experienced some troubles with DNS and port unreachable on
> very slow links, but that was quite unusual.

nah--i don't log them.  truthfully, they probably aren't legitimate...but
i'm not terrified of ICMP enough to really be concerned about it.
i'd rather err on the side of allowing too much ICMP than not enough.

-j

--
"Alright brain, you don't like me and I don't like you. But let's just
 get through this and then I can get back to killing you with beer."
        --The Simpsons

