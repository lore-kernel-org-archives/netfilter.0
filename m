From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Compiling libnetfilter_queue-1.0.2
Date: Fri, 26 Oct 2012 14:57:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210261455090.2774@nerf07.vanv.qr>
References: <508A7252.80202@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <508A7252.80202@sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: Netfilter <netfilter@vger.kernel.org>


On Friday 2012-10-26 13:21, Rob Sterenborg (lists) wrote:
>  CC     extra/ipv4.lo
> extra/ipv4.c: In function 'nfq_ip_snprintf':
> extra/ipv4.c:141: error: 'tos' undeclared (first use in this function)
> extra/ipv4.c:141: error: (Each undeclared identifier is reported only once
> extra/ipv4.c:141: error: for each function it appears in.)

I have seen this before - it is a bug in CentOS's glibc.
Commit id of the fix is (glibc.git) 15bac72bac03faeb3b725b1d208c62160f0c3ad7.
