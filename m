From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 16:41:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013154117.NLFK459.mta02-svc.ntlworld.com@there>
References: <20021013065007.A15824@hamal.ipal.net> <20021013135349.FARY28874.mta06-svc.ntlworld.com@there> <20021013101034.E15824@hamal.ipal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021013101034.E15824@hamal.ipal.net>
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
To: netfilter@lists.netfilter.org

On Sunday 13 October 2002 4:10 pm, Phil Howard wrote:

> | Your understanding is correct.   Netfilter rules are tested sequentially.
> | However, I think it would still be worth a test of setting up a few
> | thousand rules and see whether you get acceptable bandwidth.   What speed
> | is your external Internet connection ?
>
> The external speed is 45 mbps.  Connections come in at 20-30 per second
> during certain peak times.  That works out to 200000-300000 tests per
> second.  I think that's pushing the envelope a bit too much, even for a
> route-only box.  It's these peaks (usually spam overloading an SMTP server
> despite it will be rejecting the mail) that I'm wanting to reduce the
> impact from.

I really think that netfilter or routing are the wrong solutions to spam.   I 
agree with Robert that you should be doing spam filtering at the SMTP 
Application layer, not the TCP/IP Networking layer.   Remember that a mail 
server can quite happily filter which connections it accepts based on source 
address, as well as anything else in the headers etc.

> What I was hoping for was a means to replace an address in a rule with some
> kind of reference to a lookup table object that had multiple addresses and
> scaled better than O(n).

Well, you could clearly create your own nest of user-defined rules where a 
packet would have to traverse a maximum of 32 rules to get a definite "go / 
no go" result for any given IPv4 address.

Just test bit31 of the address, then bit30, then bit29, etc using as many 
rules as you need for the different addresses.   You'll still have around 
10000 rules, but each packet will only get checked against a maximum of 32 of 
them (and that would be for a specific IP address - a network range would 
need fewer tests).

A compromise between these two extremes (linear vs. logarithmic time) might 
be the best for maintainability:

Create perhaps 256 user-defined chains based on the first byte of the IP 
address (or the second byte, if the first doesn't give you an even enough 
distribution of rules at the next level), and then within each of the 256 
chains, use a linear set of rules to match the addresses you want to block.

If you can get the distribution fairly even, that means for 10000 addresses, 
each packet would need to traverse on average 256/2 + (10000/256)/2 = 128 + 
20 = 148 rules.   If you did the initial subdivision into 256 categories 
using a binary chop, you'd be down to 8 + 20 = 28 rules per packet.

> Standard routing uses the destination to look up what to do.  This will
> need to be based on source address.  Apparently the policy routing has this
> capability, but the documentation for that stuff is rather vague so far.

Yes, I was suggesting that you use policy routing, but I believe that still 
has the same sort of "reject" destination as the standard "route" command, so 
you don't need to actually send your unwanted packets on anywhere.

Antony.

-- 

What is this talk of software 'release' ?
Our software evolves and matures until it becomes capable of escape,
leaving a bloody trail of designers and quality assurance people in its wake.

