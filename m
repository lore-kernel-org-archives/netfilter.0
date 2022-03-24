From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: bug report and future request
Date: Thu, 24 Mar 2022 13:20:23 +0100
Message-ID: <YjxiB6Jk4plpx48G@salvia>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
 <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
 <20220322103203.GD24574@breakpoint.cc>
 <04C4931B-553E-4FEA-85D4-B3E186520EE5@gmail.com>
 <FE0EEED5-48C9-412F-81BA-0028818C2EE8@gmail.com>
 <DB57EE0F-F4CE-4198-89E0-F25ED3C321A5@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB57EE0F-F4CE-4198-89E0-F25ED3C321A5@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

On Thu, Mar 24, 2022 at 02:09:25PM +0200, Martin Zaharinov wrote:
> One more update 
> 
> I try to make rule for limiter in offload mode :
> 
> table inet nft-qos-static {
>         set limit_ul {
>                 typeof ip saddr
>                 flags dynamic
>         }
>         set limit_dl {
>                 typeof ip daddr
>                 flags dynamic
>         }
> 
>         chain upload {
>                 type filter hook prerouting priority filter ; policy accept;
>                 ip saddr @limit_ul drop;
>         }
> 
>         chain download {
>                 type filter hook postrouting priority filter; policy accept;
>                 ip daddr @limit_dl drop;
> 
>         }
>         flowtable fastnat {
>                 hook ingress priority filter; devices = { eth0, eth1 };
>         }
>         chain forward {
>                 type filter hook forward priority filter; policy accept;
>                 ip protocol { tcp , udp } flow offload @fastnat;
>         }
> }
> 
> its not work perfect only upload limit work , download get full channel 
> 
> in test i set 100mbit up/down  upload is stay on ~100mbit , but download up to 250-300mbit (i have this limit be my isp).
> 
> the problem is limiter work only for Upload , is it posible to make work on download rule ?

If you want to combine ratelimit/policing with flowtable, then you
have to use the ingress and egress hooks, not prerouting and
postrouting.

Make sure you place the flowtable in a priority that comes after the
priority of your ingress hook.
