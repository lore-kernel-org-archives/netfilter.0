From: Chris Straessle <sacrelege@swissonline.ch>
Subject: Re: Problemas with ULOG
Date: Thu, 21 Nov 2002 23:47:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDD6289.9090905@swissonline.ch>
References: <NEBBKLENIBMGHGCLGBPIGEPBCCAA.security@e-gim.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEBBKLENIBMGHGCLGBPIGEPBCCAA.security@e-gim.es>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: E-GIM Security <security@e-gim.es>
Cc: netfilter@lists.netfilter.org

E-GIM Security wrote:
> 	Hi,

hi,

> 	 If I try use ULOG target, for example: iptables -A INPUT -s 192.168.0=
=2E1 -p
> tcp -j ULOG --log-prfix "test", the command fails and say "Bad argumen
> 'test'". Why? What it not work?

hmm.. i think this is a typo. replace --log-prfix
                                 with  --ulog-prefix.


> 	Thanks

i hope it works now.

>=20
> Jos=E9 Antonio Garc=EDa Garc=EDa
> Jefe Departamento Desarrollo
>=20
> GIM - IT Deusto	+34 952700010
> 	+34 952700670
> C/ Merecillas, 54. Bajo	+34 952702928
> 29200 Antequera (M=E1laga)* security@e-gim.es
> ESPA=D1A		http://www.e-gim.es
>=20

bye,
chris

--=20
-----------------------------------------------------------------------
Chris Straessle			  http://raptor.homeunix.net/
Alias: sacrelege		  email: sacrelege@swissonline.ch
-----------------------------------------------------------------------


