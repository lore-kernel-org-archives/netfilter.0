From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: PPTP passthrough
Date: Wed, 3 May 2017 16:45:16 +0200
Message-ID: <86316f95-37e3-8f80-d9ee-c4f6c428ff1c@sterenborg.info>
References: <6d2c9c2f-2636-9e3f-b8e1-eec95eb02370@suse.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6d2c9c2f-2636-9e3f-b8e1-eec95eb02370@suse.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven O'Connor <steven@suse.com.au>, netfilter@vger.kernel.org

On 3-5-2017 04:13, Steven O'Connor wrote:
> PPTP pass-through seems to be broken. When the client tries to connect,
> a gre packet is sent but the reply gre packet is dropped at my firewall.
>
> The relevant conntrack dump shows a mismatch between the expected reply
> and the packet received, srckey/dstkey do not match. Is that significant?
>
>
> gre      47 27 src=aaa.bbb.cc.ddd dst=www.xxx.yy.zz srckey=0x0
> dstkey=0xb053 [UNREPLIED] src=www.xxx.yy.zz dst=aaa.bbb.cc.ddd
> srckey=0xb053 dstkey=0x0 mark=0 use=1
> gre      47 27 src=192.168.0.212 dst=aaa.bbb.cc.ddd srckey=0x0
> dstkey=0x1380 [UNREPLIED] src=aaa.bbb.cc.ddd dst=www.xxx.yy.zz
> srckey=0x1380 dstkey=0x0 mark=0 use=1

You don't show any rules, so just a guess.
Do you allow/forward protocol 47 (gre) packets?


--
Rob

