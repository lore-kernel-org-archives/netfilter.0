From: Peter Frischknecht <peter@empoweringsolutions.com>
Subject: Re: Protecting against DoS
Date: 10 Jan 2004 20:50:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073785847.9615.487.camel@peterlaptop>
References: <20031209154333.GB17221@edu.joroinen.fi>
	 <20031209090221.413b7286.mgale@utilitran.com>
	 <20031209162820.GC17221@edu.joroinen.fi>
	 <20031209094047.4dbb09f9.mgale@utilitran.com>
	 <20031209165146.GD17221@edu.joroinen.fi>
	 <20031209100650.485e8a4f.mgale@utilitran.com>
	 <20031209171322.GE17221@edu.joroinen.fi>
	 <20031210165306.GH17221@edu.joroinen.fi>
Reply-To: peter@empoweringsolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031210165306.GH17221@edu.joroinen.fi>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Pasi =?ISO-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Cc: netfilter@lists.netfilter.org

Hello,

I wanted to let you know that you are not alone.
We manage networks in apartment complexes.  Hundreds of students use
their computers simultaneously and we have always been able to deal with
DoS attacks.

The attack you described is identical to the one we have suffered since
sometime in September.  In short: it cannot be stopped.  But there are
many things you can do.

As you may have found in personal research, the worm has the following
characteristics:
1 - It is a Zombie.  Computers do NOT automatically start attacking web
sites.  They wait for an instruction from outside.
2 - The connection to the outside "master server" is done via IRC.
3 - The infected computer attacks 1 to a few web servers at a time. (we
have never seen more than 3).
4 - Completely random spoofed src addresses.
5 - The MAC address is (Thank You GOD) not being spoofed.
6 - The intensity of the attack deems the offending computer almost
useless during the attack.

It seemed from your description that your network was fairly small.
In order to save bandwidth, we implement a transparent caching
strategy.  So we redirect port 80 to the cache.  Guess what!!!  Our
caching server ends up the target of the attack!!!

I can tell you that I tried every pertinent module in the patch-o-matic
volume.  It was a 3 month ordeal with very frequent lockups. "connlimit"
does not work because once you enable SYN cookies, there are no
connections to limit.  "limit" draws too much CPU power, eventually
helping lock up the box.

Blocking the foreign IP sources at the FORWARD level (or INPUT in my
case) stopped the packets, but still kept my server with a very high
system use.

I have hundreds of rules in the MANGLE and NAT tables, so the bad
packets were still traveling and being matched against all those rules. 
I placed the drops for the foreign IPs in the MANGLE table.  If you look
at the docs, it is the first table the packet hits.

BTW, to stop foreign IP packets, I created one ACCEP rule for every
known IP class inside my network.  The last line simply DROPs everything
coming from the internal network.

My networks are basically functional now.  But the HIGH CPU use
persists.  It is likely caused by the interrupt handling or the packet
counters/rules checking.  I recently ran accross this page on lowering
the interrupt handling:
ftp://robur.slu.se/pub/Linux/net-development/NAPI/NAPI_HOWTO.txt

Feel free to correspond with me.  We can trade ideas on the topic.

Peter Frischknecht
Empowering Solutions, Inc.



