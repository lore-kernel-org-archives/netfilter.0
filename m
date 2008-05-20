From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Tue, 20 May 2008 16:41:01 +0200
Message-ID: <4832E2FD.4050607@plouf.fr.eu.org>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>	 <482DA36B.6070801@plouf.fr.eu.org>	 <alpine.LNX.1.10.0805161714090.15590@fbirervta.pbzchgretzou.qr>	 <482DAC09.90304@plouf.fr.eu.org>	 <1210954048.23968.2777.camel@kr0sty.1.com.ar>	 <alpine.LNX.1.10.0805171329520.15590@fbirervta.pbzchgretzou.qr>	 <1211202805.23968.3867.camel@kr0sty.1.com.ar>	 <alpine.LNX.1.10.0805191942020.15136@fbirervta.pbzchgretzou.qr> <1211288704.23968.4406.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1211288704.23968.4406.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Martin a =E9crit :
>=20
> I'll search for more docs about difference
> module--build-in, just to see if I can change some parameters while
> modprobe or so.

Built-in module parameters can only be set at boot time in the kernel=20
command line. See Documentation/kernel-parameters.txt in the Linux=20
kernel source tree.
