From: Florian Westphal <fw@strlen.de>
Subject: Re: Packets lost in netfilter & Altering outgoing packet's mac
 address
Date: Thu, 18 Aug 2022 19:49:52 +0200
Message-ID: <20220818174952.GB32331@breakpoint.cc>
References: <DB4P191MB2213EA897B746F3E2DA9FA54BD689@DB4P191MB2213.EURP191.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB4P191MB2213EA897B746F3E2DA9FA54BD689@DB4P191MB2213.EURP191.PROD.OUTLOOK.COM>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ludvig Sandh <givdul11@hotmail.se>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Ludvig Sandh <givdul11@hotmail.se> wrote:
> For changing the source address of outgoing packets I’ve tried explicitly setting it with 
> ’nft add rule ip filter postrouting ip saddr set 192.168.10.132 ether saddr set 54:af:97:87:eb:b9’

Won't work because at this point there either is no ethernet header yet
or you're changing the ethernet header of the incoming/forwarded packet.

> 	chain input {
> 		type filter hook input priority filter; policy accept;
> 		ip saddr 216.58.207.206 ip daddr 192.168.10.203 ether daddr 7c:c2:c6:35:82:08 counter packets 1 bytes 168
> 		# Shows that the google packet reached the input chain with altered addresses!
> 	}
> }
> table ip filter {
> 	chain prerouting {
> 		type filter hook prerouting priority filter; policy accept;
> 		counter packets 0 bytes 0

Wild guess: IP stack discards packet as foreign.  Try 'meta set pkttype
set unicast' in the bridge rule that rewrites the dst mac.
