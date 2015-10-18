From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables segv while trying to use nat redirection with map
Date: Sun, 18 Oct 2015 20:00:53 +0200
Message-ID: <20151018180053.GA1826@salvia>
References: <56239149.2010805@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56239149.2010805@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Horsley <steve.horsley@gmail.com>
Cc: netfilter@vger.kernel.org

On Sun, Oct 18, 2015 at 01:32:09PM +0100, Steve Horsley wrote:
> I would like to do host redirection using nftables, and using
> maps for efficient host address lookup (thousands of entries).
> As a first step, I tried just natting the output from my laptop
> but the real use will be on the prerouting chain:
> 172.16.0.1 -> 8.8.8.8.
> The following works as intended:
>     nft add table nat
>     nft add chain nat output { type nat hook output priority 0 \; }
>     nft add rule nat output ip daddr 172.16.1.1 dnat 8.8.8.8
>     ping 172.16.1.1
> 
> But I can't get it to work using maps - this causes a segmentation error:
>     nft flush ruleset
>     nft add table nat
>     nft add chain nat output { type nat hook output priority 0 \; }
>     nft add rule ip nat output dnat ip daddr map { 172.16.1.1 : 8.8.8.8 }
>     nft list ruleset
> 
> I don't know if I just have the wrong syntax, if it's a bug in
> nft, or if it's just something I shouldn't be trying to do in the
> first place. I am using nftables 0.4 (ubuntu 15.10 beta) but had
> the same result on ubuntu 15.04.

This works here on nftables 0.5, I can load both this:

#!/usr/sbin/nft

flush ruleset
add table nat
add chain nat output { type nat hook output priority 0 ; }
add rule ip nat output dnat ip daddr map { 172.16.1.1 : 8.8.8.8 }

and this:

flush ruleset
table ip nat {
        chain output {
                type nat hook output priority 0; policy accept;
                dnat ip daddr map { 172.16.1.1 : 8.8.8.8} 
        }
}
