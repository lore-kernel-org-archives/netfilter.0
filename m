From: Norman Rasmussen <norman@rasmussen.co.za>
Subject: Re: nft tproxy without iproute2 rule
Date: Fri, 11 Oct 2019 22:24:52 -0700
Message-ID: <CAGF1phaS3ePDQmYayP9ZZ4T0CHyk6YpFPubT=tOmMwRSMAVYVQ@mail.gmail.com>
References: <CAGF1phaHKy_bb1ALmB+YpB27gYtN30U8=zViaJ181TaCEPd4sQ@mail.gmail.com>
 <20191009220251.GA15526@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmussen.co.za; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vw+Ma+8/mJbYSCgK+4hOXWrHJAJhUNf+vkgzbnRflRM=;
        b=gDPW0MXmPQ+xrny0Qpf//CExlT7aj1uk57aYbG5u+yIZakZl469+4erjbkUlLOQVjr
         kDctEgunJdmQHDcIamlWhBo2maNY9y5FSL2dBSQDXydl7bi1aO+Vt8HFaK5weH0hbBJ2
         UTDYSKGy4MafuLF19IcAT+T3IEWfCeuZ8hXYY=
In-Reply-To: <20191009220251.GA15526@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

> See above, skb->dev is still telling the stack where the packet is
> coming from, not where its going.

I think I meant skb->dst, or skb->dst->dev (I seem to have gotten
confused about the variables in the code snippet).

> Is this about ip rule scalability or keeping config 'private' to nftables,
>
> i.e. bypass the FIB?

It's mostly to keep the config in one place. I was thinking for tools
like sshuttle it would be nice if they only had to mutate nftables,
and didn't have to worry about also setting up (or requiring the user
to set up) the ip rules and routes.

It also feels like marking the packets and creating a rule & route
just to route the packets to the local interface is a bit unnecessary.
It would be simpler to just have an action that could route them to
the local interface, or even directly to the listening socket.

The tproxy action calls nf_tproxy_assign_sock if the socket is
transparent, why not finish setting up delivery so that the rule and
route are not required? Is there something else that could happen to a
packet once the tproxy action has assigned skb->sk?

--
- Norman Rasmussen
- Email: norman@rasmussen.co.za
- Home page: http://norman.rasmussen.co.za/
