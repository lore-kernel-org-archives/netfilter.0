From: "Waldecir Loureiro dos Santos Filho" <psycoman@pop.com.br>
Subject: RE: SNAT hangs system in SMP mode (kernel 2.4.21)
Date: Mon, 21 Jul 2003 09:38:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IIEKKHFJALFLMOPAIGGIOEIICAAA.psycoman@pop.com.br>
References: <Pine.LNX.4.44.0307211003330.5246-100000@jedi.van-dijk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307211003330.5246-100000@jedi.van-dijk.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Diederick van Dijk <diedvdyk@jedi.van-dijk.net>, netfilter@lists.netfilter.org


I get this problem too, with Kernel-2.4.21, now I back to orignal kernel of
RH and no more problems

Some budy know if 2.4.21 have a problem with iptables ? ? ?



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Diederick van Dijk
Sent: segunda-feira, 21 de julho de 2003 05:19
To: netfilter@lists.netfilter.org
Subject: SNAT hangs system in SMP mode (kernel 2.4.21)

Hi,

Yesterday I upgraded my system from one Pentium III 450Mhz processor to
two Pentium III 450 processors. This system is my gateway to the internet.
After upgrading I recompiled the kernel (2.4.21) into SMP mode.
Unfortunately this wasn't a success. After a few minutes my system hung.
After some searching I'm realy sure that my SNAT rules are the problem. If
I get my email on an other PC with no other IP activity on my network my
gateway immediately hung. Retrieving email uses a SNAT rule.
So I recompiled my kernel uni-processor and the problem was over.
Is this a known problem ? How do I fix this (MASQ rules are not the
solution) ? If someone needs additional information please ask.

System specs :

- 2 x Pentium 450 Mhz
- 256 MB SDRAM
- kernel 2.4.21 (not the stock Mandrake kernel)
- iptables 1.2.7a
- Mandrake 9.1
- 9x SNAT rules

Thanks in advance,

Diederick



********Confidencialidade do Correio do Eletr=F4nico***************
Informa=E7=F5es confidenciais podem estar contidas nesta mensagem. Se voc=
=EA n=E3o
se encontra na lista de destinat=E1rios ou n=E3o =E9 o remetente da mesma, =
voc=EA
n=E3o deve copiar ou enviar esta mensagem para ningu=E9m. Neste caso, voc=
=EA deve
destruir e notificar o remetente da mesma. A empresa considera opini=F5es,
conclus=F5es e outras informa=E7=F5es que n=E3o se relacionam com o neg=F3c=
io oficial
da corpora=E7=E3o de responsabilidade do usu=E1rio do servi=E7o.



