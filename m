From: Martin <mylists@itcom.com.ar>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Tue, 20 May 2008 11:58:48 -0300
Message-ID: <1211295528.23968.4458.camel@kr0sty.1.com.ar>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>
	 <482DA36B.6070801@plouf.fr.eu.org>
	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>
	 <482DAC09.90304@plouf.fr.eu.org>
	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>
	 <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>
	 <1211202805.23968.3867.camel@kr0sty.1.com.ar>
	 <alpine.LNX.1.10.0805191942020.15136@fbirervta.pbzchgretzou.qr>
	 <1211288704.23968.4406.camel@kr0sty.1.com.ar>
	 <4832E2FD.4050607@plouf.fr.eu.org>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4832E2FD.4050607@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org


On Tue, 2008-05-20 at 16:41 +0200, Pascal Hambourg wrote:
> Martin a =C3=A9crit :
> >=20
> > I'll search for more docs about difference
> > module--build-in, just to see if I can change some parameters while
> > modprobe or so.
>=20
> Built-in module parameters can only be set at boot time in the kernel=
=20
> command line. See Documentation/kernel-parameters.txt in the Linux=20
> kernel source tree.


Thanks, I'll check that.



I want to thanks the whole netfilter list too. I was pretty much
confused about ip_conntrack and nf_conntrack thing.

Now I'm able to know the differences, similitudes, and more about how
they work. How they are loaded, alias, etc.

I can go on with it now, and start looking fore more options (like
7-layer and IMQ), but those are may be for another thread in some
future ;)


Thanks again to all of you.


Martin

