From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: strange log on gateway inside []
Date: Thu, 29 Jul 2010 11:18:59 +0200
Message-ID: <4C514783.2000603@unipex.it>
References: <4C513E0B.6040005@unipex.it> <alpine.LSU.2.01.1007291051570.10386@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007291051570.10386@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt ha scritto:
>> My output chain:
>> *filter
>> :OUTPUT DROP [4831251:620928037]
>> -A OUTPUT -o lo -j ACCEPT
>> -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>> -A OUTPUT -j LOG --log-prefix "Firewall DROPOUT- "
>
> So what's left is INVALID packets.
>

First, thanks.
Seem that a rule that drop the INVALID packets to the trick. But... drop 
or reject the invalid packets?

>> The question. Why I see this log and why my fw want to talk with external and,
>> the last, why the kernel double log talk and one is inside the brackets  [ ] ?
>
> Because those are the contents of the ICMP packet. See the RFC.

Append also with tcp, no only icmp.
P.s. Have you a rfc number?

And the last, have you also an rfc that explain why and where invalid 
come from?

Thanks
