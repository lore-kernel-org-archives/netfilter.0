From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Transparent http filtering VLAN traffic without being a member
 of 	tagged VLANs
Date: Thu, 18 Feb 2010 23:15:28 +0100
Message-ID: <20100218231528.697221fc@catlap>
References: <c4ada2161002171216v202474a0obd2ca5c1f22511f1@mail.gmail.com>
	<20100217215518.2944595e@catlap>
	<c4ada2161002172323r477f2b23g3b5ed981275d11ca@mail.gmail.com>
	<20100218113636.6bddb735@catlap>
	<c4ada2161002180320i373a4931waf29dd22acc5e4db@mail.gmail.com>
	<4B7D2461.7010703@kpi.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B7D2461.7010703@kpi.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yavetskiy Yuriy <yavetskiy@kpi.ua>
Cc: Oguz Yilmaz <oguzyilmazlist@gmail.com>, netfilter@vger.kernel.org

>Hello.

Hello,

>And what is output of
>ip ro sho 91.93.179.88/29
>?
>If route already exist you must delete it before adding to br0.206.

Yuriy is right to sugest that check.

If "ip ro sho 91.93.179.88/29" won't show anything and you still
can't add route then there's something wrong with kernel or userspace ip
tools.

Best regards,
Marek
