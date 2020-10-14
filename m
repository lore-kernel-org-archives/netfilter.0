From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 14:54:59 +0100 (BST)
Message-ID: <alpine.DEB.2.21.2010141405150.28273@piplus.local.jubileegroup.co.uk>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com> <20201014100402.GA19556@salvia> <alpine.DEB.2.23.453.2010141221380.6472@localhost> <alpine.DEB.2.21.2010141148070.28273@piplus.local.jubileegroup.co.uk>
 <20201014125007.GA21520@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        jubileegroup.co.uk; h=date:from:to:cc:subject:in-reply-to
        :message-id:references:mime-version:content-type; s=uk; bh=oK6y8
        PabiGWN06HsoMPy2t3nt548gjF3816MmJYD8NQ=; b=po/2BRLw5B8l7wD0MIZUV
        p7kUMEy0lFz+c2GiHxV+5rP1UQKSGuIJZkRs1l7KHER7JIVKDeg40LfWhHRvie+p
        iV9GNzGGW2hYA7AQ+xZjeZMzNbK9nNZHin63zAz/4/vnSZX9Bo7ggNfl12hG51m3
        GulqALxz+801WDxY8KBrQ+DY6GmBSngVSRQRJ8Dwm/D2YQOkriDDw7ADHmjt/o0y
        zRrDl8oNXD3R22SfydGFu1++h1Dd5jok/IPT2KcY32YgScrw8nqA96S2dlNNtHNC
        Cs66kFl38JNI4a8hvS9hmcN8Km5TExiOyD+4tvna7Y9vxR9iUuxmUKk/fk02oyKq
        g==
In-Reply-To: <20201014125007.GA21520@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi there,

On Wed, 14 Oct 2020, Pablo Neira Ayuso wrote:

> ... friends ... still prefer command line tools ...

:/

> Please, if you have any proposal to express this in a more compact way
> that makes sense into the expression language, we'll be glad to take
> into consideration.

Thanks, first of all, for taking the trouble to help everyone here.

Looking at your command line example:

> nft> add x y (ct status and dnat) == dnat

When I analyze something like this, I find it quite impressive how much
(I didn't know that) I read into logical expressions without thinking
about it, and how badly it can go wrong when things aren't as I expect. :/

Three things about this one throw me into a flat spin.  I have no idea
if any of this "makes sense into the expression language" as you put it
but I hope at least I'll be able to explain the kinds of thing which I
find confusing.

1. "ct status"

Why is that not "ct.status" or "ct->status" or even "ct_status"?  I
see the space after "ct", I think it's a delimiter, and fall over it.

2. "and"

The word "and" says to me that you're combining two boolean values,
not doing a bitwise mask operation.  I'd expect the bitwise operation
to be represented by "&".  The word "and" could perhaps alternatively
be written as "&&", but never "&".  Do your sysadmin friends do Perl?
I'm not necessarily asking for the niceties of Perl precedence, but I
really do have a lot invested in the meanings of logical operators in
several very different languages.

3. "== dnat"

This seems to be completely superfluous.  If you do a bitwise mask
operation the result is either zero or not, that's the whole point.
All you need to know is if the result is TRUE (non-zero) or FALSE.
Granted that sometimes code *might* be written this way for comparing
values with e.g. 'enum' types, but only for some clarification which
is not AFAICT necessary in this context - and usually only in fairly
dense code which might otherwise be tricky for a human to follow.  A
relatively minor point is that predefined constants like "dnat" ought
to be more readily distinguished from things like names of structure
elements or whatever you call them like "status".  That's often done
by using upper case or some prefix, but I don't know if that would be
feasible here.  Is it somehow possible to 'alias' any of these names?

I hope this all makes sense to you in English, even if it does _not_
make sense in the "expression language"; I hope it helps; I hope I'm
not teaching my grandmother to suck anything; and I must apologize
that I could not even attempt to express these thoughts in Spanish!

-- 

73,
Ged.
