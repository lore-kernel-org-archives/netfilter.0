From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: Protecting against DoS
Date: Mon, 26 Jan 2004 12:45:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040126104513.GV1254@edu.joroinen.fi>
References: <20031209154333.GB17221@edu.joroinen.fi> <20031209090221.413b7286.mgale@utilitran.com> <20031209162820.GC17221@edu.joroinen.fi> <20031209094047.4dbb09f9.mgale@utilitran.com> <20031209165146.GD17221@edu.joroinen.fi> <20031209100650.485e8a4f.mgale@utilitran.com> <20031209171322.GE17221@edu.joroinen.fi> <20031210165306.GH17221@edu.joroinen.fi> <1073785847.9615.487.camel@peterlaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1073785847.9615.487.camel@peterlaptop>
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
To: Peter Frischknecht <peter@empoweringsolutions.com>
Cc: netfilter@lists.netfilter.org

On Sat, Jan 10, 2004 at 08:50:50PM -0500, Peter Frischknecht wrote:
> Hello,
>=20
> I wanted to let you know that you are not alone.
> We manage networks in apartment complexes.  Hundreds of students use
> their computers simultaneously and we have always been able to deal with
> DoS attacks.
>=20

Hello!


> The attack you described is identical to the one we have suffered since
> sometime in September.  In short: it cannot be stopped.  But there are
> many things you can do.
>=20
> As you may have found in personal research, the worm has the following
> characteristics:
> 1 - It is a Zombie.  Computers do NOT automatically start attacking web
> sites.  They wait for an instruction from outside.
> 2 - The connection to the outside "master server" is done via IRC.
> 3 - The infected computer attacks 1 to a few web servers at a time. (we
> have never seen more than 3).
> 4 - Completely random spoofed src addresses.
> 5 - The MAC address is (Thank You GOD) not being spoofed.
> 6 - The intensity of the attack deems the offending computer almost
> useless during the attack.
>=20

Yes, sounds like the same thing.

> It seemed from your description that your network was fairly small.
> In order to save bandwidth, we implement a transparent caching
> strategy.  So we redirect port 80 to the cache.  Guess what!!!  Our
> caching server ends up the target of the attack!!!
>=20

Hehe.


> I can tell you that I tried every pertinent module in the patch-o-matic
> volume.  It was a 3 month ordeal with very frequent lockups. "connlimit"
> does not work because once you enable SYN cookies, there are no
> connections to limit.  "limit" draws too much CPU power, eventually
> helping lock up the box.
>=20

Hmm.. how did you set up the limits? I wrote small application that
calculates the average new connections/sec rates and I then set up the
limits according to that..


> Blocking the foreign IP sources at the FORWARD level (or INPUT in my
> case) stopped the packets, but still kept my server with a very high
> system use.
>=20
> I have hundreds of rules in the MANGLE and NAT tables, so the bad
> packets were still traveling and being matched against all those rules.=20
> I placed the drops for the foreign IPs in the MANGLE table.  If you look
> at the docs, it is the first table the packet hits.
>=20

Yep. It seems to be very difficult to protect against these kind of
attacks..=20

> BTW, to stop foreign IP packets, I created one ACCEP rule for every
> known IP class inside my network.  The last line simply DROPs everything
> coming from the internal network.
>=20

I'm doing this also.

> My networks are basically functional now.  But the HIGH CPU use
> persists.  It is likely caused by the interrupt handling or the packet
> counters/rules checking.  I recently ran accross this page on lowering
> the interrupt handling:
> ftp://robur.slu.se/pub/Linux/net-development/NAPI/NAPI_HOWTO.txt
>=20
> Feel free to correspond with me.  We can trade ideas on the topic.
>=20

Sorry for the long delay in the answer :)

-- Pasi K=E4rkk=E4inen
      =20
                                   ^
                                .     .
                                 Linux
                              /    -    \
                             Choice.of.the
                           .Next.Generation.

