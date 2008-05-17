From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: sequence of matches in a single rule
Date: Sat, 17 May 2008 09:05:47 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805170905070.15590@fbirervta.pbzchgretzou.qr>
References: <001501c8b7e0$8ef50a00$acdf1e00$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001501c8b7e0$8ef50a00$acdf1e00$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishit Shah <nishit@elitecore.com>
Cc: netfilter@vger.kernel.org


On Saturday 2008-05-17 07:40, Nishit Shah wrote:

>Hi,
>	Is there any specific order in which match will take place ?

Yes. For -m conntrack and -m mark however, it does not matter,
as no internal state is modified. It does matter however,
for example, with -m statistic --mode nth and -m quota.
