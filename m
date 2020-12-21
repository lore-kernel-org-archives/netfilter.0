From: Florian Westphal <fw@strlen.de>
Subject: Re: First packet NAT flow
Date: Mon, 21 Dec 2020 02:15:20 +0100
Message-ID: <20201221011520.GA9639@breakpoint.cc>
References: <CAD4ZOMyRWi-wahS4bw11h=hQpzgjaCjHiomcsKK5fjqawe92MQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD4ZOMyRWi-wahS4bw11h=hQpzgjaCjHiomcsKK5fjqawe92MQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael Ganascim <rganascim@gmail.com>
Cc: netfilter@vger.kernel.org

Rafael Ganascim <rganascim@gmail.com> wrote:
> As I understand it, when a connection is already established at
> conntrack, the packets use these entries to flow, do the translation,
> and don't go through the entire ruleset. Is this reading correct?

They skip the NAT table/nat chains, but not the rest of the ruleset.

> But what about the first connection packet that needs to be NATed?
> Suppose we have 1000 rules of SRC-NAT, are the first packets covered
> all of them until a match occurs?

Yes.

> Or is there a structure already
> "configured" where the IP can get its NAT IP quickly?

No.

> And for example, for 1:1 NAT, despite the number of rules, what's the
> difference between 256 rules of src-nat or just one using NETMAP

None.
