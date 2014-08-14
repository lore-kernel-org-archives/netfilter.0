From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables and FTP connection tracking
Date: Thu, 14 Aug 2014 20:02:05 +0200
Message-ID: <20140814180205.GA5928@salvia>
References: <4ae8314bdfec48fe944b03977bb140ff@lutel.pl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4ae8314bdfec48fe944b03977bb140ff@lutel.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tomekx1000 <tomekx1000@lutel.pl>
Cc: netfilter@vger.kernel.org

On Thu, Aug 14, 2014 at 11:29:57AM +0200, tomekx1000 wrote:
> Dear All,
> 
> Could you have a look at my simple nft firewall script below, I've
> used ct related, established, but it doesnt work with passive mode
> FTP - the data session on high ports is dropped by firewall. Does
> NFTables have connection tracking helper for FTP?

Yes, no changes in that regard.

> If not - is it planned in foreseable future to add it?
> 
> table ip filter {
>  chain input {
>  type filter hook input priority 0;
>  dport {21} ct state new limit rate 2/second counter accept

The brackets have special meaning. If you uses brackets to wrap
elements, the kernel will create a set for it with one single element.
Better use the brackets when you have multiple elements. In this case,
I suggest you to use:

   tcp dport 21 ...

>  ct state {established, related} counter accept
            ^                    ^

No need to use the brackets here:

   ct state established,related ...

The ct state allows enumeration of several states using commas. This
is due to the fact that ct state internally represents the states as a
bitmask.

You can check that use the describe command:

# nft describe ct state
ct expression, datatype ct_state (conntrack state) (basetype bitmask,
integer), 32 bits

pre-defined symbolic constants:
        invalid                         0x00000001
        new                             0x00000008
        established                     0x00000002
        related                         0x00000004
        untracked                       0x00000040

Basically, all bitmask types can use the comma-separated enumeration
notation to combine the supported flags.

You can use describe to inquire for other selectors in case of doubt.
