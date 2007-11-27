From: Patrick McHardy <kaber@trash.net>
Subject: Re: conntrack-tools and kernel 2.6.22
Date: Tue, 27 Nov 2007 15:44:38 +0100
Message-ID: <474C2D56.8070701@trash.net>
References: <34f8e8a30711261204ge069052rf956aef7184be64a@mail.gmail.com> <474C1DA5.6010900@netfilter.org> <474C2503.6000102@trash.net> <474C2DF2.7080600@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474C2DF2.7080600@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Ben Young <innrevival@gmail.com>, netfilter@vger.kernel.org

Pablo Neira Ayuso wrote:
> Patrick McHardy wrote:
>> Pablo Neira Ayuso wrote:
>>> Ben Young wrote:

>>>> Operation failed: Can't open handler
>>>> Operation failed: sorry, you must be root or get CAP_NET_ADMIN
>>>> capability to do this
>>>>
>>> This is an old version of the conntrack userspace commandline tool, 
>>> get conntrack-tools 0.9.5 that contains conntrack and conntrackd.
>>>
>>> http://people.netfilter.org/pablo/conntrack-tools/
>>
>> Why doesn't it work on current kernels? Things shouldn't break
>> when updating the kernel.
> 
> Sure. Ben, in the meantime, could you try to reproduce the problem with 
> the lastest version of the conntrack tools, please? I'll investigate 
> what's wrong the old version.


Ah, I though you knew :) Actually it sounds very much like Ben
made a mistake converting his .config to nf_conntrack.


