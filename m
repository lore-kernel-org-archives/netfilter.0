From: Henrik Stoerner <henrik-netfilter@hswn.dk>
Subject: Re: Netfilter bug ? NAT'ed connections ignore icmp redirect
Date: Wed, 15 Sep 2004 22:41:00 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040915204100.GA28236@hswn.dk>
References: <20040915133959.GA22165@hswn.dk>
	<1095262572.1899.66.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1095262572.1899.66.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Sep 15, 2004 at 11:36:12AM -0400, Jason Opperisano wrote:
> On Wed, 2004-09-15 at 09:39, Henrik Stoerner wrote:

[snip]

thanks Jason, your remark that

> "in-the-true-spirit-of-linux-everything-i-want-to-do-should-work-the-
> way-i-want-no-matter-how-many-RFC's-it-goes-against-or-how-bad-of-an-
> idea-it-is" hat...i will try to explain why i think you're seeing this
> behavior...

did make my day :-)

I wholeheartedly agree - with any hat I can put on - that relying on
ICMP redirects for this is a very bad idea. Had I been responsible for
the design of this network it would have been different, but I am not.
I work at a place where there are people designing networks who
seriously believe they know best how to set things up, and since I am
just the looney playing around with Linux I should not tell them how
to do things.

So my mail to the list was an attempt to understand why netfilter
behaves the way it does - I find it a lot easier to go into a
discussion about matters when I understand them.

> and no--i don't think this is a *bug* in netfilter, i think it's a
> symptom of how linux handles ICMP redirects and the routes created by
> them.  if you read up on how linux treats an ICMP redirect that it
> receives--it limits the scope of the resulting route to host
> communications.

This is the piece of the puzzle that I was missing. It explains the
behaviour I see. I'm re-reading RFC 1122 now, but would appreciate
some pointers to Linux specific docs.

> if you've actually read this far--may i humbly suggest using a dynamic
> routing protocol to route your environment?  zebra/quagga is pretty
> painless--especially if you're familiar with cisco IOS configuration
> syntax.

That would be the ideal solution, I'll try if I can persuade our
network guys to implement this at the router end. If not I guess I'll
have to implement an application-layer proxy instead of using
netfilter for it, and so avoid the problem that way.


Regards,

Henrik


