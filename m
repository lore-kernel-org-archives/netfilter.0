From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Access to Internal server via public address
Date: Wed, 10 Dec 2003 20:25:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312102025.59656.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0312101443570.2784-100000@sparrow>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0312101443570.2784-100000@sparrow>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wednesday 10 December 2003 8:16 pm, William Stearns wrote:

> Good afternoon, Vernon,
>
> On 10 Dec 2003, Vernon A. Fort wrote:
> > Anyone,
> >
> >   The Problem:  I have an alias public address DNAT'ed to and internal
> > address - normal and working
> >
> >   What i need is to access this server using the PUBLIC address from an
> > internal workstation.

> 	If the client box and the internal server in question are on the
> same cable, you essentially can't do this direcdtly (but read on).
>
> 	Picture this as a triangle; the internal machines on the bottom,
> (client left, server right) and the firewall at the top.  The packets
> physically all travel over the same Ethernet segment shared by all three
> machines, I'm just demonstrating who's talking to whom.

Excellent answer, Bill.

I think this explains a common situation (and a common FAQ) in more detail, 
and with more information, than I've seen before.   Hopefully it is clear to 
a network non-expert as well (I don't use the term newbie here, because once 
you've got DNAT working at all, you've clearly gone beyond that stage...)

Your reply is (IMHO) worthy of a FAQ entry in itself.

Antony

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


