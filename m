From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] flowtable throws error on
 deployment (not on check however)
Date: Thu, 19 Mar 2020 12:38:58 +0100
Message-ID: <20200319113858.vuy7fgtbwsqovnmx@salvia>
References: <513b3942-8b97-bb22-c608-6076c932c4f7@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <513b3942-8b97-bb22-c608-6076c932c4f7@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wed, Mar 18, 2020 at 04:46:08PM +0000, ѽ҉ᶬḳ℠ wrote:
> Trying to get flowtables to work but hitting a bit of a snag. Whilst nft
> -cf /path/to/conf (strangely) does not produce any error on deployment
> nft -f /path/to/conf it throws this error however:
> 
> Error: Could not process rule: Not supported
> ip protocol tcp flow offload @ft
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> table inet filter {
>         flowtable f {
>                 hook ingress priority filter
>                 devices = { pppoe-wan, lan0, lan1, lan2, lan3, lan4,
> br-lan }
>         }
> 
>         chain input {
>                 type filter hook input priority filter; policy drop;

You can only use the flowtable to accelerate the forwarding path.
Please, define use the forward hook, ie.

          chain forward {
                 type filter hook forward priority filter; policy drop;
