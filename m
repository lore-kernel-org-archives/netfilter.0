From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 13:54:46 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006231354010.14260@obet.zrqbmnf.qr>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com>
 <4C21F56C.3070603@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C21F56C.3070603@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Nooden <lars.curator@gmail.com>
Cc: Florian Effenberger <floeff@gmail.com>, netfilter@vger.kernel.org


On Wednesday 2010-06-23 13:52, Lars Nooden wrote:
>
>> If I add ten times the host and it resolves to the same IP, iptables
>> doesn't recognize that, and I have 10 similar rules. Is there any
>> check for duplicates possible?
>
> AFAIK, not inherently in iptables itself, but if you make a separate chain, it
> is easier to work on it via grep and sort.   Use 'iptables -nL' or
> 'iptables-save' 

Do not start grepping in iptables -L. That is what iptables -S and
iptables-save are much better suited for.
