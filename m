From: Steven O'Connor <steven@suse.com.au>
Subject: Re: PPTP passthrough
Date: Thu, 4 May 2017 13:42:35 +1000
Message-ID: <af6f998e-1d52-9939-4408-16ff1193b167@suse.com.au>
References: <6d2c9c2f-2636-9e3f-b8e1-eec95eb02370@suse.com.au>
 <86316f95-37e3-8f80-d9ee-c4f6c428ff1c@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <86316f95-37e3-8f80-d9ee-c4f6c428ff1c@sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

On 04/05/17 00:45, Rob Sterenborg (lists) wrote:
> On 3-5-2017 04:13, Steven O'Connor wrote:
>> PPTP pass-through seems to be broken. When the client tries to connect,
>> a gre packet is sent but the reply gre packet is dropped at my firewall.
>>
>> The relevant conntrack dump shows a mismatch between the expected reply
>> and the packet received, srckey/dstkey do not match. Is that 
>> significant?
>>
>>
>> gre      47 27 src=aaa.bbb.cc.ddd dst=www.xxx.yy.zz srckey=0x0
>> dstkey=0xb053 [UNREPLIED] src=www.xxx.yy.zz dst=aaa.bbb.cc.ddd
>> srckey=0xb053 dstkey=0x0 mark=0 use=1
>> gre      47 27 src=192.168.0.212 dst=aaa.bbb.cc.ddd srckey=0x0
>> dstkey=0x1380 [UNREPLIED] src=aaa.bbb.cc.ddd dst=www.xxx.yy.zz
>> srckey=0x1380 dstkey=0x0 mark=0 use=1
>
> You don't show any rules, so just a guess.
> Do you allow/forward protocol 47 (gre) packets?
>
>
> -- 
> Rob
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

The default policy LAN->NET is accept. I have also added a rule to 
accept gre.

It has been working previously but after an update to the kernel or 
shorewall it has stopped working.  I only use pptp occasionally so I 
cannot be sure when it stopped.

The firewall can accept pptp connections from the net and it is only the 
passthru that is broken.


-- 
Steven O'Connor
=============================================
Support Services Pty Ltd   ABN 49 006 226 428
2 Commonwealth Terrace, Sandhurst VIC 3977
Fax 03 9888 2677, Mobile 0417 571 113
=============================================

