From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools and kernel 2.6.22
Date: Tue, 27 Nov 2007 15:47:14 +0100
Message-ID: <474C2DF2.7080600@netfilter.org>
References: <34f8e8a30711261204ge069052rf956aef7184be64a@mail.gmail.com> <474C1DA5.6010900@netfilter.org> <474C2503.6000102@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <474C2503.6000102@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: Ben Young <innrevival@gmail.com>, netfilter@vger.kernel.org

Patrick McHardy wrote:
> Pablo Neira Ayuso wrote:
>> Ben Young wrote:
>>> I have been working on switching some systems over to kernel version
>>> 2.6.22.  In the transition, conntrack-tools has stopped working on
>>> these systems.  Depending on which commands I issue to conntrack, I
>>> get one of the two errors below, neither of which is particularly
>>> helpful in diagnosing the problem.
>>>
>>> Operation failed: Can't open handler
>>> Operation failed: sorry, you must be root or get CAP_NET_ADMIN
>>> capability to do this
>>>
>>> Does anyone know why conntrack wouldn't work on kernel 2.6.22 when it
>>> works just fine when I'm running 2.6.17 or 2.6.18?  Or have any
>>> suggestions for how to go about determining the root cause of this
>>> issue?
>>>
>>> FYI, I am currently using these versions of the conntrack tools:
>>>
>>> libnetfilter_conntrack: 0.0.81
>>> libnfnetlink: 0.0.30
>>> conntrack: 1.00beta2
>>               ^^^
>> This is an old version of the conntrack userspace commandline tool, 
>> get conntrack-tools 0.9.5 that contains conntrack and conntrackd.
>>
>> http://people.netfilter.org/pablo/conntrack-tools/
> 
> Why doesn't it work on current kernels? Things shouldn't break
> when updating the kernel.

Sure. Ben, in the meantime, could you try to reproduce the problem with 
the lastest version of the conntrack tools, please? I'll investigate 
what's wrong the old version.
