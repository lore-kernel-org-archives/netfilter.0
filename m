From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack vs. nf_conntrack
Date: Sat, 17 May 2008 13:28:10 +0200
Message-ID: <482EC14A.6020205@plouf.fr.eu.org>
References: <1210688686.2956.69.camel@kr0sty.1.com.ar>	 <482DA36B.6070801@plouf.fr.eu.org> <1210951968.23968.2614.camel@kr0sty.1.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210951968.23968.2614.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Martin a =E9crit :
>=20
> When compiling kernel there are potions to introduce them in netfilte=
r
> modules, but there aren't modules or aliases to those names =BFcan yo=
u
> tell me how to add those alias? insmod keep telling me that
> ip_conntrack_amanda and ftp couldn't be loaded (I keep trying to load
> them on my firewall script).=20

I am not sure I understand you but AFAIK insmod doesn't support aliases=
=20
and requires the real module names. Use modprobe instead.
