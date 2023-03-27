From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Internal error when checking rules
Date: Mon, 27 Mar 2023 17:05:42 +0200
Message-ID: <ZCGwxl79yXfvybsk@salvia>
References: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
 <ZCCvj7XxHDFr7QXf@salvia>
 <4e3d7257-d89e-dad6-53d2-70adad755d7e@at.encryp.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4e3d7257-d89e-dad6-53d2-70adad755d7e@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org

On Mon, Mar 27, 2023 at 12:10:28PM +0300, Serg wrote:
> On 3/26/23 23:45, Pablo Neira Ayuso wrote:
> > You do not have to split your elements in individual commands.
> Well, actually I need due to the arising error. My file with set elements is
> generated dynamically and it can be arbitrarily big.
>
> > Could you post some example reproducer?
>
> Sure. Steps to reproduce this issue (files are attached to this letter):
> 1) # nft -f 1_define_set.nft
> 2) # nft -f 2_fill_set.nft
> 3) # nft -cf 3_fill_set.nft
>
> On my machine it is stable to return "internal:0:0-0: Error: Could not
> process rule: File exists" error message with the nftables v1.0.6.

Thanks for the reproducer. It is a userspace bug in error reporting,
patch is here:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230327145045.33797-1-pablo@netfilter.org/

I recommend you split that superlong line in your 2_fill_set.nft and
3_fill_set.nft files, for example:

# cat ruleset.nft
table netdev filter {
        set mySet {
                typeof ip saddr
                flags interval
                elements={
                        1.2.3.1/32,
                        1.2.6.3/32,
                        1.2.8.12/32,
                        ...
                }
        }
}

instead of:

# cat ruleset.nft
table netdev filter {
        set mySet {
                typeof ip saddr
                flags interval
                elements={1.2.3.1/32,1.2.6.3/32,1.2.8.12/32,...
                }
        }
}

Now it shows this:

# nft -f ruleset.nft
ruleset.nft:402:1-16: Error: Could not process rule: File exists
8.9.10.11/30,
^^^^^^^^^^^^^

instead of the internal location.

