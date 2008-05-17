From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Sat, 17 May 2008 13:30:24 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>  <482DA36B.6070801@plouf.fr.eu.org>  <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>  <482DAC09.90304@plouf.fr.eu.org> <1210954048.23968.2777.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210954048.23968.2777.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin <mylists@itcom.com.ar>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On Friday 2008-05-16 18:07, Martin wrote:
>
>So I've just one question at least. If there aren't nf_conntrack_*
>modules or aliases, does the amanda, ftp, quake3, etc. modules work just
>loading nf_conntrack? If so, I think I'm ready to go with this kernel
>history.

No, nf_conntrack_ftp is required for FTP (and similarly for the
others).
