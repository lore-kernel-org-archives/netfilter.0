From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: failing fail-over - commit still in progress
Date: Fri, 11 Aug 2023 12:53:11 +0200
Message-ID: <ZNYTF+uCod++Htl9@calendula>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Philipp Braun <pbraun@nethence.com>
Cc: netfilter@vger.kernel.org

On Fri, Aug 11, 2023 at 11:55:42AM +0300, Pierre-Philipp Braun wrote:
> Hello
> 
> I have a casual NAT active/passive setup with keepalived+conntrackd,
> on three nodes.

Three nodes and FT-FW mode will not work. FT-FW would need to be
extended to maintain sequence tracking for more than one single node.
It is doable but this requires development effort.

For three node, you should try NOTRACK which means sync messages are
sent from active to passive nodes without any kind of sequence
tracking (best effort approach).

[...]
> versions:
> 
> Linux 5.16.20

BTW, why this kernel version? This is not any of the -stable kernels.

> nftables v1.0.1 (Fearless Fosdick #3)
> Keepalived v2.2.8
> Connection tracking userspace daemon v1.4.7 (GIT master branch)
> 
> nftables.conf:
> 
> define nic=xenbr0
> define gst=guestbr0
> 
> table inet filter
> flush table inet filter
> table inet filter {
>         chain input {
>                 type filter hook input priority filter; policy accept;
> 
>                 ip protocol icmp accept
>                 ip6 nexthdr ipv6-icmp accept
>                 #ip protocol vrrp ip daddr 224.0.0.0/8 accept
>                 ip protocol vrrp accept

                  meta l4proto { icmp, ipv6-icmp, vrrp } accept

BTW, you could merge these rules with a set, to have a less iptabl-ish
ruleset.

With newer nftables version, I recommend to run -o/--optimization
option to check for ruleset optimizations.
