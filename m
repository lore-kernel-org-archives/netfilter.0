From: Stephen Satchell <list@satchell.net>
Subject: Re: WTF, over
Date: Sun, 24 May 2020 08:03:00 -0700
Message-ID: <627aadf3-c2d8-6815-bb78-903a38c65b44@satchell.net>
References: <f8b2b366-356a-cca8-ccc5-58a561904dad@satchell.net>
 <20200524110903.GA4481@salvia>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20200524110903.GA4481@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 5/24/20 4:09 AM, Pablo Neira Ayuso wrote:
> fib address type with...
> 
> * iff can only be used in prerouting, input and forward.
> * oif can only be used in output, postrouting and forward.
> 
> I assume your 'output' chain is something like:
> 
>          type filter hook output priority 0; policy drop;
> 
> Anyway, I agree error reporting and documentation can do better there.

Interesting.  Here is the complete fragment, as tested on a virtual machine:

> table inet filter {
>     chain wan_output {
>         fib saddr . iif type broadcast   counter drop # no non-unicast
>        #fib saddr . iif type anycast     counter drop (unicast)
>         fib saddr . iif type multicast   counter drop 
>         fib saddr . iif type blackhole   counter drop 
>         fib saddr . iif type unreachable counter drop 
>         fib saddr . iif type prohibit    counter drop
>         }
>     chain output {
>         type filter hook output priority 0; policy accept;
>         meta oif "lo" accept
>         meta oif "ens3" goto wan_output
>         }
>     }

The output when I try to load this is:
> [root@localhost Desktop]# nft  -f x.nft
> x.nft:13:9-39: Error: Could not process rule: Operation not supported
>         meta oif "ens3" goto wan_output
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

*  meta oif is being used in the output chain
*  replace 'goto wan_output' with drop generates no message
*  "nft ruleset" echos the rules properly with "drop"

What is so special about the jump action?


So it appears there is a disconnect when the jump target is specified.

