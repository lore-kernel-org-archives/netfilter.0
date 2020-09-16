From: Siebzehn <siebzehntausend@gmail.com>
Subject: Re: No interval possible on Concatenation-Sets
Date: Wed, 16 Sep 2020 15:52:59 +0200
Message-ID: <CAFJ60aqL4dFm7SnhOpjfpmqJgO6iJaa2T72zhzrg8_mEMWn8VQ@mail.gmail.com>
References: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
 <20200916125211.GS7319@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNlf6uh3S/qk9QbTdkD+zkEYL3NuSiiboyvQjbL0sEI=;
        b=sJLn3W0+sX/o+97yCHdJgNaEIIwKpqFYHna+hB/PxS2qsyKpeIa9hECWVxMhw16NBL
         Vm4dMn9MUlVtHn1i5ZrMBJXZUPuP45U2B79y8PjNWgmLUSO3i1EsSTM1qO/jzB7ngH65
         i1xdzpLUCgJKtCUykTL6MVl9CiewS5rkVEkIU/ZkLGjf4XPTdOv8DlyQFkXb+yKRZtE9
         VPAJWnLx98XkiY29j2kyHa+Iva1AbN/fTwPcm8lxtRLmjaS8bGcLtl43f6MbZL3RyENE
         Km1aGEe1Sa0KLlAIPk7JMVsZ1N7KOJBz11Dg8x0dgU+W1s0I98RSiwErTKrq3R2P10G3
         na6w==
In-Reply-To: <20200916125211.GS7319@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Am Mi., 16. Sept. 2020 um 14:52 Uhr schrieb Florian Westphal <fw@strlen.de>:
>
> Siebzehn <siebzehntausend@gmail.com> wrote:
> > I'm filtering Address-Ranges and Ports to let them though. However it
> > doesn't seem to accept "flags intervals".
> > Even the Example on the wiki isn't getting accepted!
> >
> > Example from
> > https://wiki.nftables.org/wiki-nftables/index.php/Concatenations#Network_addresses
> > flush ruleset
> > table inet mytable {
> >     set myset {
> >         type ipv4_addr . ipv4_addr
> >         flags interval
> >         elements = { 192.168.0.0/16 . 172.16.0.0/25,
> >                      10.0.0.0/30 . 192.168.1.0/24,
> >         }
> >     }
> >
> >     chain mychain {
> >         ip saddr . ip daddr @myset counter accept
> >     }
> > }
> >
> > Error:
> > nft -f TestD.nft
> > TestD.nft:4:9-13: Error: Could not process rule: Invalid argument
> >     set myset {
>
> Concatenations with intervals need kernel 5.6 or newer.

Thanks it worked!

I saw the note but wasn't sure what it meant...
"NOTE: before kinux kernel 5.6 and nftables 0.9.4 the CIDR notation
wasn't available, ...:"
