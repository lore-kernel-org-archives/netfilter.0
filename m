From: Bart De Schuymer <bdschuym@pandora.be>
Subject: Re: AW: Re: iptables - bridge - physin
Date: Thu, 3 Apr 2003 18:17:32 +0200
Sender: bridge-admin@math.leidenuniv.nl
Message-ID: <200304031817.32904.bdschuym@pandora.be>
References: <D3DD55FDB74AD511BA5100500416368017659C@orion.ibh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bridge-admin@math.leidenuniv.nl>
In-Reply-To: <D3DD55FDB74AD511BA5100500416368017659C@orion.ibh.de>
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
To: Jochen Vogel <jvogel@it-sec.de>, "'netfilter@newkirk.us'" <netfilter@newkirk.us>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'bridge@math.leidenuniv.nl'" <bridge@math.leidenuniv.nl>

> what should i do?
> in my iptables script i use -i eth0
> in my log the packet dropped because (IN=3Dbr0 PHYSIN=3Deth0) IN doesn=B4=
t match

You can jump to a user defined chain and then check if it matches br0, if=
 so=20
RETURN, if not DROP.
Or you can switch to Linux 2.5.

--=20
cheers,
Bart
