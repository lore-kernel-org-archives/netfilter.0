From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: strange log on gateway inside []
Date: Thu, 29 Jul 2010 11:49:42 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007291148080.22862@obet.zrqbmnf.qr>
References: <4C513E0B.6040005@unipex.it> <alpine.LSU.2.01.1007291051570.10386@obet.zrqbmnf.qr> <4C514783.2000603@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C514783.2000603@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

On Thursday 2010-07-29 11:18, Michele Petrazzo - Unipex wrote:

>Jan Engelhardt ha scritto:
>>>My output chain:
>>>*filter
>>>:OUTPUT DROP [4831251:620928037]
>>>-A OUTPUT -o lo -j ACCEPT
>>>-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>>>-A OUTPUT -j LOG --log-prefix "Firewall DROPOUT- "
>>
>>So what's left is INVALID packets.
>
>Seem that a rule that drop the INVALID packets to the trick. But... 
>drop or reject the invalid packets?

Whatever fits your need.

>>>The question. Why I see this log and why my fw want to talk with 
>>>external and, the last, why the kernel double log talk and one is 
>>>inside the brackets [ ]?
>>
>>Because those are the contents of the ICMP packet. See the RFC.
>
>Append also with tcp, no only icmp.
>P.s. Have you a rfc number?

792

>And the last, have you also an rfc that explain why and where invalid 
>come from?

INVALID is a CT classification. RFC don't have much to do with that.
