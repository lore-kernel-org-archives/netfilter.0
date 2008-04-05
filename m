From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: iptables equivalent of ssh local port forward.
Date: Sat, 5 Apr 2008 02:06:13 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804050205390.26881@fbirervta.pbzchgretzou.qr>
References: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bac5fd1b0804041635g768b214bq38535a328d81bf7e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Joel Pearson <joel.pearson@gmail.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-04-05 01:35, Joel Pearson wrote:
>
> I can get iptables forwarding to work fine if the source address is
> from the internet, well a different interface anyway.  Using a DNAT
> works fine in these circumstances.  But a DNAT doesn't work to forward
> within the same subnet/interface it seems.
>
> Can someone point me in the right direction?

http://jengelh.hopto.org/images/dnat-mistake.png

-- 
make boldconfig -- to boldly select what no one has selected before
