From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: More neqbie questions
Date: Mon, 2 Aug 2004 21:08:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408022108.50336.Antony@Soft-Solutions.co.uk>
References: <410E7DFB.9000505@mail.co.gilchrist.fl.us> <410E9AFD.90500@mail.co.gilchrist.fl.us> <200408022102.19083.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408022102.19083.Antony@Soft-Solutions.co.uk>
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

On Monday 02 August 2004 9:02 pm, Antony Stone wrote:

> On Monday 02 August 2004 8:50 pm, Eric Ellis wrote:
> > Antony Stone wrote:
> > > My recommendation is to put a LOG rule at the end of each chain, just
> > > before the default DROP policy takes effect, and you'll see what
> > > packets are getting that far and then being lost.
> >
> > Now here's something interesting that I discovered when you mentioned
> > it...
> >
> > It appears that all of my HTTP packets are making it through the chains
> > without being picked up by my redirect rule.  The same appears to be
> > happening with mail.  I put the LOG at the end of the 3 filter tables,
> > In, Out, and FWD, so assuming that it's line by line filtering (eg, runs
> > until a rule catches it), my packet is making it throught the chains
> > without being caught.  Any suggesstions on what could cause that?
>
> Yes.   You have no FORWARD rule allowing packets to TCP port 80 (well, you
> do, but it's commented out...).

Sorry, scrub that - you're right about the REDIRECT rule.   However, I don't 
see an INPUT rule allowing packets in to Squid on port 8080.

You also seem to have two OUTPUT rules allowing TCP packets to port 80 - why?

How about showing us the output of "iptables -L -nvx; iptables -L -t nat -nvx" 
so we can see the rules in the right order?

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


