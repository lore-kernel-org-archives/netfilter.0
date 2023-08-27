From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: counter target
Date: Sun, 27 Aug 2023 23:11:02 +0200
Message-ID: <ZOu75rSEGwJOleQB@calendula>
References: <CAOLfK3WNwrokC54pspxSN89OHrfW2RTTyGsj2kBYaf-c1H-DPw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOLfK3WNwrokC54pspxSN89OHrfW2RTTyGsj2kBYaf-c1H-DPw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: netfilter <netfilter@vger.kernel.org>

On Fri, Aug 25, 2023 at 04:06:54PM -0500, Matt Zagrabelny wrote:
> Greetings netfilter,
> 
> I have a question about the location of a "counter" statement.
> 
> I see from the wiki [0] that placing a counter for the default policy
> comes *after* the policy:

Wiki example does not refer to the default policy.

Wiki explains that, unlike iptables, counter statement can be placed
anywhere in the rule.  That is, user specifies when the counter
statement is evaluated.

Comparing with iptables:

- counter statement is optional. In iptables you always have counters
  in every run, even if you do not ned them.
- counter statement can be placed anywhere in the rule, before a
  terminal action. In iptables, it always comes before the target
  (single action).

The example shows that you have more flexibility in how you can use
counters in rules.

> table ip counter_demo {
>     chain IN {
>         type filter hook input priority filter; policy drop;
> 
>         protocol tcp counter

This should be:

          ip protocol tcp counter

This counts all TCP packets seen in this input chain.

This is a rule.

>     }
> }
> 
> That feels a little counterintuitive to place a counter after the
> packet "appears" to have been dropped.

This is not allowed:

# nft add rule x y drop counter
Error: Statement after terminal statement has no effect
add rule x y drop counter
             ~~~~ ^^^^^^^

You cannot add a counter after a terminal statement, it makes no
sense, because the counter statement is unreachable from the packet
path.

> Thus, do I place other counter statements *after* their corresponding
> netfilter stanzas:
> 
> table inet filter {
>     chain input {
>         # accept traffic originated from us
>         ct state vmap {
>             established: accept,
>             related:     accept,
>             invalid:     drop,
>         }
>         counter

This example above is counting all ct state 'new' flows, which is the
implicit fallthrough case in this verdict map (note you do not specify
a match on ct state 'new').

>     }
> }
> 
> Or do I place the counter before:
> 
> table inet filter {
>     chain input {
>         counter

This example above is counting _all_ packets that reach the input chain.

>         # accept traffic originated from us
>         ct state vmap {
>             established: accept,
>             related:     accept,
>             invalid:     drop,
>         }
>     }
> }
> 
> Or does it not matter?

It depends on what you want to count, it is not clear to me what you
would like to achieve.

> [0] https://wiki.nftables.org/wiki-nftables/index.php/Counters
