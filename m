From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Re: Problem with counting
Date: Sun, 6 Oct 2002 19:47:39 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210061945580.17224-100000@balthasar.nuitari.net>
References: <200210061657.g96GvTL13237@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210061657.g96GvTL13237@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Sun, 6 Oct 2002, Antony Stone wrote:

> On Sunday 06 October 2002 5:40 pm, Antony Stone wrote:
> 
> > On Sunday 06 October 2002 11:21 pm, Nuitari wrote:
> > > On Sat, 5 Oct 2002, Antony Stone wrote:
> > > > Show us the rest of your rules.
> > >
> > > iptables -P FORWARD ACCEPT
> >
> > Ugh :-(   Horrible.
> 
> PS: I forgot to mention in my previous reply that by the time I got to the 
> bottom of your ruleset, I hadn't seen a single DROP or REJECT rule, therefore 
> your "Firewall" is not blocking anything :-)
> 
> With a default ACCEPT policy explicitly set on the FORWARD chain, and without 
> changing the implicit default ACCEPT policy on the INPUT and OUTPUT chains, 
> your netfilter rules are not actually doing anything at all, except for the 
> address translation :-)
> 
> Antony.
> 
> 

I know that I need to change it, but it still doesn't solve the counting 
problem.

Btw, I didn't get your previous reply, can you cc it to me ?



