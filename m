From: Martijn Lievaart <m@rtij.nl>
Subject: Re: [NFQUEUE] Help with program that changes DHCP payload
Date: Wed, 30 Jan 2008 22:22:37 +0100
Message-ID: <47A0EA9D.2010705@rtij.nl>
References: <763049.9097.qm@web58311.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <763049.9097.qm@web58311.mail.re3.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vincent Arniego <vincent_arniego@yahoo.com>
Cc: netfilter@vger.kernel.org

Vincent Arniego wrote:
>
> Hi Everyone,
>
> I'm kinda new here and I would like some help regarding
>  netfilter_queue. If this is asked already, forgive me I didn't see it in the archives.
>
> I'm making a program that changes the value of an attribute in the DHCP
>  payload.
> I'm using nfqueue to intercept the packet, change the content of the
>  payload and resend it again to DHCP
> which resides in the same server as the firewall. Why am I doing this?
>  I'm making a pseudo option 82 using a translated bridge (which the mac
>  is unchangeable) but I'm using the hostname attribute instead.
>   

Stop right there. The ISC DHCP server does very funky stuff to see 
packets addressed to 0.0.0.0. This means those packets do not go through 
netfilter. I bet this is at the root of your problem.

I cannot think of a quick way to change this. Maybe hacking at dhcrelay 
sources is an better option.

HTH,
M4

