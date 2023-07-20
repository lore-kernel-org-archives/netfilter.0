From: Kuniyuki Iwashima <kuniyu@amazon.com>
Subject: Re: skb->mark not cleared for MLDv2 Reports? (skb->mark == 212 / 0xd4)
Date: Thu, 20 Jul 2023 13:05:27 -0700
Message-ID: <20230720200527.25978-1-kuniyu@amazon.com>
References: <ZLUkWyFiwEqi721V@sellars>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1689883548; x=1721419548;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0V9Ssl4foYYslO6teD3c2aPdxXDj7QzX+mBq/yTlwU=;
  b=ipeaJGuz+0rhl7DCw0FaVWpuTTsk3W2p1GVvysrBFA7M48/CycM6okWf
   qEtOLa9sAci6nFBgMxS0nDFbtnNtUjEss/RE6TbQoewY/HbhzPfdb8gBK
   lg+C7KtPpVGi+s1Q1zzt/1ZmPH9JjCHh2pnTl7oa3a4YnakYbfVgZYJ78
   U=;
In-Reply-To: <ZLUkWyFiwEqi721V@sellars>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linus.luessing@c0d3.blue
Cc: edumazet@google.com, netdev@vger.kernel.org, netfilter@vger.kernel.org, kuniyu@amazon.com

From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
Date: Mon, 17 Jul 2023 13:22:03 +0200
> Hi,
> 
> I noticed that MLDv2 Reports don't seem to have a default
> skb->mark of 0. Instead it is 212 / 0xd4 for me:
> 
> ```
> $ ip link add dummy0 type dummy
> $ ip link set up dummy0 arp on
> $ ip6tables -I INPUT -i dummy0 -j LOG --log-ip-options
> [ send an MLDv2 Query, for instance via the ipv6toolkit
>   https://github.com/T-X/ipv6toolkit/tree/pr-mldq6-mldv2

I haven't looked yet though, a complete repro would make
us debug it easier.  (Same for MLDv1)

Thanks!


> ]
> $ dmesg
> ...
> [38336.524879] IN= OUT=dummy0 SRC=fe80:0000:0000:0000:1c01:1cff:fec1:5669 DST=ff02:0000:0000:0000:0000:0000:0000:0016 LEN=76 TC=0 HOPLIMIT=1 FLOWLBL=0 OPT ( ) PROTO=ICMPv6 TYPE=143 CODE=0 MARK=0xd4
> ...
> ```
> 
> For MLDv1 Reports I don't see this issue, there it's always
> 0 by default.
> 
> I'm wondering if this 212 value comes from the
> skb->reserved_tailroom (formerly avail_size) which the skb->mark
> is unioned with? Am I reading
> a21d45726a ("tcp: avoid order-1 allocations on wifi and tx path")
> correctly that the IPv6 stack should have reset skb->mark to 0
> before transmission?
> 
> Initially observed on a Linux 5.10.184. But I can reproduce
> this on a Linux 6.3.7, too.
> 
> Regards, Linus
