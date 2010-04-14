From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: Re: Packets stops traversing after nat PREROUTING
Date: Wed, 14 Apr 2010 23:09:33 +0300
Message-ID: <p2zc4ada2161004141309gca3e0718z8a5fa1c0826bac3b@mail.gmail.com>
References: <s2sc4ada2161004140130ve00e5873qc38aebaa842d3b6e@mail.gmail.com>
	 <alpine.LSU.2.01.1004141158560.9397@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:content-type;
        bh=BatCWPMLC710tRNcVycKuFjyXx1OrAefOHxnelPQwLg=;
        b=P4qXVvjZXKrapnwaONNf/HAVulfdUmnoulTnbiYawnGyS1Vg/6GSbW9CjxRIccGPEz
         3H+3JHzbLiupqfIpIGZ60Lc60Ssfyhj+3fwSfMnWwgwurcRsA3GKk4fLKjrXq/3TWqMo
         oxq6vJlwzopj3SFLRlJvD++DCGDrwqmh461v4=
In-Reply-To: <alpine.LSU.2.01.1004141158560.9397@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Fortunately/unfortunately it was just because of ip_forward being 0. Thanks.


On Wed, Apr 14, 2010 at 12:59 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
> On Wednesday 2010-04-14 10:30, Oguz Yilmaz wrote:
>
>>OS is CentOS 5.4
>>Kernel is 2.6.18-164
>>
>>Sometimes my firewall blocks the internet. When I inspect I have seen:
>>- nat PREROUTING counters increase
>>- filter FORWARD counters do not increase
>>- nat POSTROUTING counters do not increase
>>
>>According to the diagram of Engelhardt,
>>http://jengelh.medozas.de/images/nf-packet-flow.png, the problem
>>should be in Bridging Decision point or acc.to former diagrams in
>>Routing Decision point.
>>
>>I have tried to flush routing cache by "ip ro fl ca".
>>
>>Problem is recovered only after /etc/init.d/iptables stop / start
>>
>>I need further cues for deepen the problem, or exact reasons for
>>updating/recompling to newer kernel/netfilter.
>
> We need further cues like the ruleset.
>
