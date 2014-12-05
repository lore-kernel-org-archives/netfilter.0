From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Fri, 5 Dec 2014 11:38:27 +0100
Message-ID: <20141205103827.GB3746@salvia>
References: <54761724.9060201@c-s.fr>
 <54815E4F.10500@c-s.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54815E4F.10500@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: netfilter@vger.kernel.org

On Fri, Dec 05, 2014 at 08:27:11AM +0100, leroy christophe wrote:
> Hi,
> 
> I still get the warning from the kernel
> 
> # tftp -g server -r test.c
> [ 1359.853269] nf_conntrack: automatic helper assignment is
> deprecated and it will be removed soon. Use the iptables CT target
> to attach helpers instead.

This is related to nf_conntrack. Read this:

https://home.regit.org/netfilter-en/secure-use-of-helpers/


> test.c               100% |************************************************************************|
> 804   0:00:00 ETA
> 
> # nft list ruleset
> table ip filter {
>         chain output {
>                  type filter hook output priority 0;
>                  udp dport tftp ct helper "tftp"

The right syntax is:

        udp dport tftp ct helper set "tftp"
                                 ^^^

your rule above does something different:

1) udp dport tftp

and

2) the ct helper is "tftp"

However, userspace supports this but unfortunately the kernel code is
still missing.  So you'll have to wait for this feature or
(temporarily) rely on the automagic helper assignment (from that
message, I understand you already do).

>         }
> 
>         chain input {
>                  type filter hook input priority 0;
>                  oifname "lo" accept
>                  ct state { established, related} accept

I think I already mentioned that ct state are flags.

# nft describe ct state
ct expression, datatype ct_state (conntrack state) (basetype bitmask, integer), 32 bits

pre-defined symbolic constants:
        invalid                         0x00000001
        new                             0x00000008
        established                     0x00000002
        related                         0x00000004
        untracked                       0x00000040

so you can express that as command separated values, ie.

        ct state established,related accept

This only works if the basetype is a bitmask.
