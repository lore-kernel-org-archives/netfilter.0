From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Mon, 19 May 2008 10:13:24 -0300
Message-ID: <1211202805.23968.3867.camel@kr0sty.1.com.ar>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
	 <482DA36B.6070801@plouf.fr.eu.org>
	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
	 <482DAC09.90304@plouf.fr.eu.org>
	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>
	 <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On Sat, 2008-05-17 at 13:30 +0200, Jan Engelhardt wrote:
> On Friday 2008-05-16 18:07, Martin wrote:
> >
> >So I've just one question at least. If there aren't nf_conntrack_*
> >modules or aliases, does the amanda, ftp, quake3, etc. modules work just
> >loading nf_conntrack? If so, I think I'm ready to go with this kernel
> >history.
> 
> No, nf_conntrack_ftp is required for FTP (and similarly for the
> others).


But there isn't nf_conntrack_ftp.ko module. May be it have been renamed
to /lib/modules/2.6.25/kernel/net/ipv4/netfilter/nf_nat_ftp.ko ?


Cheers

Martin

