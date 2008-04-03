From: Bgs <bgs@bgs.hu>
Subject: Re: connlimit: 2.6.24.4 + p-o-m 20080331 compile problems
Date: Thu, 03 Apr 2008 16:52:31 +0200
Message-ID: <47F4EF2F.2030607@bgs.hu>
References: <47F4C8AE.4050801@bgs.hu> <alpine.LNX.1.10.0804031427500.1301@fbirervta.pbzchgretzou.qr> <47F4DE29.5000206@bgs.hu> <47F4DFF6.5000107@bgs.hu> <alpine.LNX.1.10.0804031613590.1301@fbirervta.pbzchgretzou.qr> <47F4EA96.1010004@bgs.hu> <alpine.LNX.1.10.0804031635250.1301@fbirervta.pbzchgretzou.qr> <47F4EC6A.1080604@bgs.hu> <alpine.LNX.1.10.0804031642390.1301@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804031642390.1301@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

Funny... IPV4 is marked as experimental. And I can compile in 
ftp/irc/etc contrack helpers without enabling ipv4 conntrack. Shouldn't 
this be a dependency? (require ipv4 or ipv6 conntrack)

Also: the connlimit description says: "This match allows you to match 
against the number of parallel connections to a server per client IP 
address (or address block)." 1) It's a conntrack module 2) it states 
that it's an ipvX module -> but it does not depend on having ipvX 
conntrack enabled.

Just recompiled and the rules loaded ok.

Bye
Bgs


Jan Engelhardt wrote:
> 
> On Thursday 2008-04-03 16:40, Bgs wrote:
>>
>> I have this in the kernel:
>>
>> CONFIG_NF_CONNTRACK_ENABLED=y
>> CONFIG_NF_CONNTRACK=y
>>
> That is not enough, you need the others too, CONFIG_NF_CONNTRACK_IPV4
> 
