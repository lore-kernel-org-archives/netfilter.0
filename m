From: Josh Nerius <jnerius@gmail.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Sun, 13 Feb 2005 15:38:55 -0600
Message-ID: <4f3930a705021313382ed454fe@mail.gmail.com>
References: <1dceb012050211233357e23dd4@mail.gmail.com>
	<1dceb01205021123483860fb86@mail.gmail.com>
	<1108216901.4462.27.camel@hubcap.ljm.dom>
	<4f3930a705021214026db11902@mail.gmail.com>
	<420EB7C3.7040303@hotpop.com>
	<4f3930a70502121833627af1bd@mail.gmail.com>
	<420F4010.7050609@hotpop.com>
Reply-To: Josh Nerius <jnerius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420F4010.7050609@hotpop.com>
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

> hola Josh,
> 
> I did a quick test:
> DROP policy on the INPUT chain, and flushed all the rules (as a result i
> couldn't even ping myself)
> squid: standart debian/unstable package - unprivilleged user, port 3128.
> the result: squid is able to bind to his port fine, with DROP policy on
> the INPUT chain and no rules at all.
> 
> regards,
> Georgi Alexandrov

George,

As Navneet pointed out, he using a redirector (squidguard). This is
exactly what I suspected, and exactly what I explained. The reasons
you had the results you did, is because your setup is *not*
duplicating that of Navneets or the situation I described.

I find it amusing, but irritating, that you seem to be trying to prove
what I have said wrong when you do not have an understanding of the
problem, or the information I provided.

------------------------------

Navneet,

I had the same issue you are experiencing while using SquidGuard some
time back. The resolution was playing with accepting traffic from and
to 127.0.0.1. I honestly don't remember the exact rules as it was some
time ago I dealt with this issue, but a minor amount of
experimentation should prove to solve the issue. I'm currently digging
through old configs etc and will let you know if/when I find the exact
rules I put in place to resolve the issue.

I hope everything works out for you.

-- 
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]

