From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: about TEE and POSTROUTING
Date: Sat, 23 Apr 2011 18:25:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104231821090.21618@obet.zrqbmnf.qr>
References: <BANLkTimc=jBEcQuaUoUxrm0GJc09MPb9gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimc=jBEcQuaUoUxrm0GJc09MPb9gg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jian Jiang <ottojiang@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2011-04-23 18:07, jian Jiang wrote:

>Hi all,
>
>I want to copy all incoming packets of eth0 and send over eth1,  I
>wrote rule like that:
>
>1. iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.10.10.1
>
>then I added another rule:
>
>2. iptables -t mangle -A POSTROUTING -o eth1 -j DROP
>
>to capture copied packets.
>
>>From iptables's count information, I saw packets are copied by rule1,
>but did not
>match rule2. But I have checked by tcpdump, copied packets indeed sent out
>by eth1.
>
>My problem is  that packets copied by TEE do not  go through POSTROUTING?
>or is my understanding wrong?

You need at least Linux 2.6.35 for duplicated packets to be seen by 
Xtables.
