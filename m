From: Florian Westphal <fw@strlen.de>
Subject: Re: No interval possible on Concatenation-Sets
Date: Wed, 16 Sep 2020 14:52:11 +0200
Message-ID: <20200916125211.GS7319@breakpoint.cc>
References: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Siebzehn <siebzehntausend@gmail.com>
Cc: netfilter@vger.kernel.org

Siebzehn <siebzehntausend@gmail.com> wrote:
> I'm filtering Address-Ranges and Ports to let them though. However it
> doesn't seem to accept "flags intervals".
> Even the Example on the wiki isn't getting accepted!
> 
> Example from
> https://wiki.nftables.org/wiki-nftables/index.php/Concatenations#Network_addresses
> flush ruleset
> table inet mytable {
>     set myset {
>         type ipv4_addr . ipv4_addr
>         flags interval
>         elements = { 192.168.0.0/16 . 172.16.0.0/25,
>                      10.0.0.0/30 . 192.168.1.0/24,
>         }
>     }
> 
>     chain mychain {
>         ip saddr . ip daddr @myset counter accept
>     }
> }
> 
> Error:
> nft -f TestD.nft
> TestD.nft:4:9-13: Error: Could not process rule: Invalid argument
>     set myset {

Concatenations with intervals need kernel 5.6 or newer.
