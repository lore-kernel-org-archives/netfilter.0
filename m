From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Error: conflicting intervals specified - Bullseye 0.9.8
Date: Tue, 28 Sep 2021 22:58:42 +0200
Message-ID: <YVOCAvkLQFiise9G@salvia>
References: <ab060c71-e640-a67e-347f-60cd1d800932@tootai.net>
 <20210916092924.GB31336@salvia>
 <48e95c8a-2469-08dd-0620-55187252653c@tootai.net>
 <20210916125858.GA9451@salvia>
 <24b4d340-d951-103b-27d4-9bb97afd9c4c@tootai.net>
 <YUkjwU8YNmogNY8d@salvia>
 <e60b7109-c570-881f-3ba5-8496bf436559@tootai.net>
 <82b7ac87-ace3-d235-4b7a-2890ed7705b6@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <82b7ac87-ace3-d235-4b7a-2890ed7705b6@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Daniel <tech@tootai.net>
Cc: Netfilter list <netfilter@vger.kernel.org>

On Tue, Sep 28, 2021 at 02:41:57PM +0200, Daniel wrote:
> Le 28/09/2021 à 13:05, Daniel a écrit :
[...]
> everything is fine. But if I call the map like
> 
> sudo nft add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip
> daddr . th dport map @fwdtoip_th
> 
> I get
> 
> Error: datatype mismatch: expected IPv4 address, expression has type
> concatenation of (IPv4 address, internet network service)
> add rule ip nat prerouting meta l4proto { tcp, udp } dnat to ip daddr . th
> dport map @fwdtoip_th
> 
> Expression recognize that map is a concatenation but not that the "to ip
> daddr . th dport" should also be treated as concatenation

Fix: https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210928205543.368551-1-pablo@netfilter.org/
