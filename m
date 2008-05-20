From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Tue, 20 May 2008 17:31:28 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805201710440.15136@fbirervta.pbzchgretzou.qr>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>  <482DA36B.6070801@plouf.fr.eu.org>  <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>  <482DAC09.90304@plouf.fr.eu.org>  <1210954048.23968.2777.camel@kr0sty.1.com.ar> 
 <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>  <1211202805.23968.3867.camel@kr0sty.1.com.ar>  <alpine.LNX.1.10.0805191942020.15136@fbirervta.pbzchgretzou.qr> <1211288704.23968.4406.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1211288704.23968.4406.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin <mylists@itcom.com.ar>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On Tuesday 2008-05-20 15:05, Martin wrote:
>> 
>> When I say nf_conntrack_ftp, I meant nf_conntrack_ftp.
>
>
>Pascal explained me that. Sorry, my fault. I made
>nf_conntrack_(ftp/amanda) build-in kernel, not as a module, so there
>isn't any *.ko with that name to modprobe.
>
>Thanks for your advice, I'll search for more docs about difference
>module--build-in, just to see if I can change some parameters while
>modprobe or so.


Self-compiled kernels always lead to surprises.
Been there. Done that. Threw it out.

Just pick a default distro kernel which uses modules. You will be
happier for your life.
