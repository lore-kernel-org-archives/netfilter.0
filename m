From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: (discussion) Why are "flow tables" syntactically unique?
Date: Wed, 22 Mar 2017 13:32:27 -0400
Message-ID: <20170322133227.5e2d3fbb@playground>
References: <99833e6a-90f8-4b53-276b-51e6c221a55c@pobox.com>
        <20170322162557.GA23457@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU v2MHWU0N026104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1490203950; i=@wpi.edu;
        bh=dpacmllq7/L8VS4COC0fVINc6RVcABED5So7RNXwaqk=;
        h=Date:From:To:Subject:In-Reply-To:References;
        b=XDwJ3LcUklVes4Ls+nE4WgHOde0ZLOqMgi9jzCoHuosKX3lLwfqSo0YofRsmpx7rF
         r0nXCyUSLooPv/X7TXvAY/XEt/F1gIddCR23M/8ofN11w4geZ+h/QgctQHGtqK9mFX
         pL+CpurC2dn05fZAknbINGK5Jxd5b9Joylt1WBRI=
In-Reply-To: <20170322162557.GA23457@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, 22 Mar 2017 17:25:57 +0100
Pablo Neira Ayuso <pablo@netfilter.org> wrote:

> On Sat, Mar 18, 2017 at 12:59:18AM +0000, Robert White wrote:
> > So this doesn't rate a bug, but it did confuse me.
> > 
> > Flow tables are always named, but they don't conform to the way sets, maps,
> > and dictionaries work in terms of "add" and "delete" and all that.
> > 
> > They are also "flow tables" instead of one word like "flows" or "throttle"
> > or something.
> > 
> > It seems weird to just have these break the syntactic expectations.
> > 
> > I think, long-term, that picking a one word designator like "rate" or
> > "gauge" and making them syntactically similar to sets with a type and flags
> > at the table level, and using @name syntax or having them be unnamed in
> > place, would make much more sense.
> > 
> > It's especially confusing since "list map tablename mapname" and "list flow
> > table tablename flowname" are so similar in function but have a different
> > word count and are not orthogonal to add and delete and clear etc.
> > 
> > So if they were just like sets this would be so much less confusing.
> > 
> > table ip example {
> >   gauge dhcp_throttle {
> >     type ipv4_addr . inet_service
> >     flags whatever, whateverelse
> >   }
> 
> This would provide a way to restore flow table between reboots, so we
> could even per populate them with elements.
> 
> >   chain dhcp_traffic {
> >     gauge { ip saddr limit over 200/day } drop
> >     gauge @dhcp_throttle { ip saddr . udp dport limit 3/second } accept
> 
> This would resolve the inconsistency, yes.
> 
> I would still stick to 'flow table' instead of 'gauge'. I was never
> comfortable with the fact that we overload 'table' with more semantics
> (given we already have tables in nf_tables).

Instead of gauge, would meter, track, watch, or measure work better (and be a little more self-documenting)?

N
