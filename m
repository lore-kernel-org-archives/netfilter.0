From: Jochen Vogel <jvogel@it-sec.de>
Subject: AW: Re: iptables - bridge - physin
Date: Thu, 3 Apr 2003 10:05:43 +0200
Sender: bridge-admin@math.leidenuniv.nl
Message-ID: <D3DD55FDB74AD511BA5100500416368017659C@orion.ibh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bridge-admin@math.leidenuniv.nl>
Errors-To: bridge-admin@math.leidenuniv.nl
List-Unsubscribe: <http://www.math.leidenuniv.nl/mailman/listinfo/bridge>,
	<mailto:bridge-request@math.leidenuniv.nl?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:bridge@math.leidenuniv.nl>
List-Help: <mailto:bridge-request@math.leidenuniv.nl?subject=help>
List-Subscribe: <http://www.math.leidenuniv.nl/mailman/listinfo/bridge>,
	<mailto:bridge-request@math.leidenuniv.nl?subject=subscribe>
List-Archive: <http://www.math.leidenuniv.nl/pipermail/bridge/>
Content-Type: text/plain; charset="iso-8859-1"
To: "'netfilter@newkirk.us'" <netfilter@newkirk.us>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'bridge@math.leidenuniv.nl'" <bridge@math.leidenuniv.nl>

hi,

i use:

-RedHat8.0
-kernel-2.4.18-26.8.0
-libnet1.0.2a
-iptables-1.2.7a
-snort-inline1.9.1-2

> No option, just reference them directly.  You can use any of=20
> the three interface names, IE eth0,eth1,br0 in your rules.
what do you mean with reference directly

> In the 2.4 patch you can just use -i and -o, for the 2.5=20
> standard kernel, you need to use the ipt_physdev module (the kernel mod=
ule
is in=20
> the standard 2.5 kernel, the userspace module is in the iptables CVS
(standard make is=20
> enough)).
what should i do?

in my iptables script i use -i eth0
in my log the packet dropped because (IN=3Dbr0 PHYSIN=3Deth0) IN doesn=B4=
t match

thx for help
jo
=20
