From: William Stearns <wstearns@pobox.com>
Subject: Re: Access to Internal server via public address
Date: Wed, 10 Dec 2003 15:55:19 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0312101542130.2784-100000@sparrow>
References: <200312102025.59656.Antony@Soft-Solutions.co.uk>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312102025.59656.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Harald Welte <laforge@gnumonks.org>
Cc: netfilter <netfilter@lists.netfilter.org>

Good afternoon, Anthony,

On Wed, 10 Dec 2003, Antony Stone wrote:

> On Wednesday 10 December 2003 8:16 pm, William Stearns wrote:
> 
> > On 10 Dec 2003, Vernon A. Fort wrote:
> > >
> > >   The Problem:  I have an alias public address DNAT'ed to and internal
> > > address - normal and working
> > >
> > >   What i need is to access this server using the PUBLIC address from an
> > > internal workstation.
> 
> > 	If the client box and the internal server in question are on the
> > same cable, you essentially can't do this direcdtly (but read on).
> >
> > 	Picture this as a triangle; the internal machines on the bottom,
> > (client left, server right) and the firewall at the top.  The packets
> > physically all travel over the same Ethernet segment shared by all three
> > machines, I'm just demonstrating who's talking to whom.
> 
> Excellent answer, Bill.

	Thanks so much.

> I think this explains a common situation (and a common FAQ) in more detail, 
> and with more information, than I've seen before.   Hopefully it is clear to 
> a network non-expert as well (I don't use the term newbie here, because once 
> you've got DNAT working at all, you've clearly gone beyond that stage...)
> 
> Your reply is (IMHO) worthy of a FAQ entry in itself.

	I suppose that's up to Harald, as he's the author of the FAQ and
there doesn't _appear_ to be sgml source for the Netfilter faq on the
homepage.  Harald, if you consider this worthy of a faq entry (look back a
few in this thread) and can loan the the SGML source for a bit, I'd be
glad to do the best I can on merging it in (but no promises on the ascii
art!).
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "Industry wags are saying that God invented SCO to give people a
company to hate more than Microsoft."
-- http://www.linuxworld.com/story/38045.htm
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------


