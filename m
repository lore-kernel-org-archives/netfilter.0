From: =?ISO-8859-15?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: Patch to apply Iptables to PPPoE-encapsulated IP-packets?
Date: Wed, 01 Mar 2006 08:41:24 -0300
Message-ID: <44058864.3010201@solutti.com.br>
References: <1637539466@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1637539466@web.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: nessbaba@web.de
Cc: netfilter@lists.netfilter.org



nessbaba@web.de escreveu:

>I'm looking for a netfilter-patch to filter PPPoE-traffic in Bridge-Mode=
=2E=20
> =20
>

    Is that really necessary ???? I havent used bridge-mode interfaces=20
lately, but as fair as I know, bridge uses to get two real interfaces=20
into a logic (bridged) interface. Something like eth0 and ppp0 being=20
br0. In that case, rules can be applied to br0 with no patches at all.=20
It's a real and valid interface on the system .....

iptables -A INPUT -i br0 -p tcp --dport 25 -j DROP .......

and so far .....

    Is that what you want or i misunderstood your question ?

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





