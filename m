From: Florian Westphal <fw@strlen.de>
Subject: Re: bug report and future request
Date: Tue, 22 Mar 2022 11:32:03 +0100
Message-ID: <20220322103203.GD24574@breakpoint.cc>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
 <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org, pablo@netfilter.org

Martin Zaharinov <micron10@gmail.com> wrote:
> Hi Florian
> 
> Look good this config but not work after set user not limit by speed.

Works for me.  Before:
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  5.09 GBytes  4.37 Gbits/sec    0 sender
[  5]   0.00-10.00  sec  5.08 GBytes  4.36 Gbits/sec receiver

After:
[  5]   0.00-10.00  sec  62.9 MBytes  52.7 Mbits/sec    0 sender
[  5]   0.00-10.00  sec  59.8 MBytes  50.1 Mbits/sec receiver

> table inet nft-qos-static {
>         set limit_ul {
>                 typeof ip saddr
>                 flags dynamic
>                 elements = { 10.0.0.1 limit rate over 5 mbytes/second burst 6000 kbytes, 10.0.0.254 limit rate over 12 mbytes/second burst 6000 kbytes }
>         }
> 		set limit_dl {
>                 typeof ip saddr
>                 flags dynamic
>                 elements = { 10.0.0.1 limit rate over 5 mbytes/second burst 6000 kbytes, 10.0.0.254 limit rate over 12 mbytes/second burst 6000 kbytes }
>        }
> 
>         chain upload {
> 			type filter hook postrouting priority filter; policy accept;
> 			ip saddr @limit_ul drop
>         }
> 		chain download {
> 			type filter hook prerouting priority filter; policy accept;
> 			ip saddr @limit_dl drop
> 		}

daddr?

> With this config user with ip 10.0.0.1 not limited to 5 mbytes , 

> When back to this config :
> 
> table inet nft-qos-static {
> 	chain upload {
> 		type filter hook postrouting priority filter; policy accept;
> 		ip saddr 10.0.0.1 limit rate over 5 mbytes/second burst 6000 kbytes drop
> 	}
> 
> 	chain download {
> 		type filter hook prerouting priority filter; policy accept;
> 		ip daddr 10.0.0.1 limit rate over 5 mbytes/second burst 6000 kbytes drop
	           ~~~~~
