From: Jose Maria Lopez <jkerouac@eresmas.com>
Subject: Re: bind 9 and iptables
Date: 28 Aug 2004 03:58:05 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1093658283.18215.2.camel@nostromo.bgsecm.com>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F9@asimail2.alphanumeric.co m>
	<20040828004745.GC22322@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040828004745.GC22322@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El sáb, 28 de 08 de 2004 a las 02:47, Nick Drage escribió:
> On Fri, Aug 27, 2004 at 05:19:07PM -0400, Jason Opperisano wrote:
> 
> > long answer:  it has been discussed on this list previously that
> > connection tracking DNS queries/responses on or for a busy DNS server
> > (i think the number was ~ 200 queries/second) will slow the name
> > resolution process down.  the reason being that the state creation
> > adds noticeable, unnecessary latency, as most (all?) queries are one
> > packet request--one packet response.
> 
> I've a vague recollection of being able to specify that a rule won't
> create an entry in the state table, so for situations like this
> netfilter can act faster, as long as you specify the correct rules for
> connections both ways.  However I can't find anything in the
> documentation about this... after a cursory look... can anyone refresh
> my memory?

I think that even if you don't use the conntrack feature for the DNS
port you will have state table entries anyway, because the state
machine will check every connection you made. The only solution would
be to unload the conntrack module and not using conntrack at all, but
that it's probably a mess, because you would have to change all the
rules to specify both directions of traffic, like in the old ipchains
days.

-- 
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPAÑA

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"


