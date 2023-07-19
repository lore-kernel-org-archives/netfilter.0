From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables 1.0.8 showing invalid type for ip dscp
Date: Wed, 19 Jul 2023 02:16:07 +0200
Message-ID: <ZLcrR3/BdjsvDQIF@calendula>
References: <CAOoaxdHd1RHx8o4uWFtMAVV0D59uNv7_JApfC1S6uoUGrsf_2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOoaxdHd1RHx8o4uWFtMAVV0D59uNv7_JApfC1S6uoUGrsf_2A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Davidson <davidson.brian@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Thanks for reporting.

On Tue, Jul 18, 2023 at 11:31:38AM -0400, Brian Davidson wrote:
> The following ruleset setting ct mark from ip dscp does not display
> the right-hand expression 'ip dscp' correctly when listing the
> ruleset.

This patch fixes this issue:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230719001444.154070-1-pablo@netfilter.org/

> It instead displays '@nh,8,8 & 0xfc [invalid type]'.  'ip6 dscp' looks normal.
> 
> table inet x {
>         chain y {
>                 type filter hook postrouting priority mangle + 1; policy accept;
>                 ct mark set ip dscp | 0x40 counter
>                 ct mark set ip6 dscp | 0x40 counter
>         }
> }
> 
> # nft list table inet x
> table inet x {
>         chain y {
>                 type filter hook postrouting priority mangle + 1; policy accept;
>                 meta nfproto ipv4 ct mark set @nh,8,8 & 0xfc [invalid
> type] | 0x40 counter packets 3584 bytes 575402
>                 ct mark set ip6 dscp | 0x40 counter packets 755 bytes 255731
>         }
> }
