From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Fri, 16 May 2008 13:07:27 -0300
Message-ID: <1210954048.23968.2777.camel@kr0sty.1.com.ar>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
	 <482DA36B.6070801@plouf.fr.eu.org>
	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
	 <482DAC09.90304@plouf.fr.eu.org>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482DAC09.90304@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Fri, 2008-05-16 at 17:45 +0200, Pascal Hambourg wrote:

> I meant aliases for helper modules. In most cases other netfilter 
> modules should be autoloaded by iptables rules creation or other module 
> dependencies, so it should be useless to load them explicitly.


Ok, here is my progress:

I've solved the connlimit problem. I was using as iptables source, an
little old one from debian. Using iptables 1.4 source form netrfilter do
the trick.


So I've just one question at least. If there aren't nf_conntrack_*
modules or aliases, does the amanda, ftp, quake3, etc. modules work just
loading nf_conntrack? If so, I think I'm ready to go with this kernel
history.

Thanks to all for your help.

Cheers


Martin 


