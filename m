From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables rules in comparable form
Date: Tue, 01 Jun 2010 11:18:55 +0200
Message-ID: <4C04D07F.6040702@chello.at>
References: <20100601081053.GA13943@q.uh.cz> <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006011043190.3431@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: rk@dat.cz

On 01.06.2010 10:50, jengelh@medozas.de wrote:
> On Tuesday 2010-06-01 10:10, Radek Kanovsky wrote:
> 
>> Hello,
>>
>> is there some way to get iptables rules in some normalized form?
>> What I mean is normalized or canonical form that is convenient
>> for rule comparison.
> 
> Load em up, then use iptables-save and/or iptables -S.
> 
>> When I want update rules on firewall or router with thousands of rules
>> I want to do it incrementaly. Reloading whole iptables on small change
>> every ten minutes is not acceptable because it takes very long time
> 
> That's because you are not using iptables-restore to do an O(n) reload. 
> 
> Calling iptables again and again is going to replace tables over and 
> over.
> 
>> and resets counters defined for accounting purposes. But incremental
>> solution requires some comparable rule form so machine can decide
>> which rule already exists, which is new and which should be deleted.


Besides there's also iptables-xml (not sure when it came up), which can
give you a unified output. Reading man iptables-xml the way back is
possible like:
Conversion from XML to iptables-save format may be done using the
iptables.xslt script and xsltproc, or a custom program using libxsltproc
or similar;  in this fashion:

       xsltproc iptables.xslt my-iptables.xml | iptables-restore

>>
>> I have prototype in python that does such normalization and is able
>> to output "patch" for existing rules according to given new rules.
>> Script generates -N/-X/-F/-P/-I/-D/-A rules via standard python difflib
>> and is pretty effective and simle (90 lines) but requires rules in
>> comparable form and this is the harder part of my problem (2662 lines).

I bet python has loads of xml libs.

[...]

Best regards

Mart


