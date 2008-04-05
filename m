From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: iptables equivalent of ssh local port forward.
Date: Sat, 5 Apr 2008 02:09:51 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804050208100.26881@fbirervta.pbzchgretzou.qr>
References: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com> <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Joel Pearson <joel.pearson@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-04-05 02:06, Jan Engelhardt wrote:
> On Saturday 2008-04-05 01:35, Joel Pearson wrote:
>>
>>  I can get iptables forwarding to work fine if the source address is
>>  from the internet, well a different interface anyway.  Using a DNAT
>>  works fine in these circumstances.  But a DNAT doesn't work to forward
>>  within the same subnet/interface it seems.
>>
>>  Can someone point me in the right direction?
>
> http://jengelh.hopto.org/images/dnat-mistake.png

Adding an extra SNAT rule of course alleviates this problem,
at the cost of seeing 1.3.3.8 instead of 1.3.3.7 in the logs
of 1.3.3.9.

(-t nat -A POSTROUTING -d 1.3.3.9 -m conntrack --ctstate DNAT
-j SNAT --to 1.3.3.8)
