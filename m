From: =?ISO-8859-1?Q?Thomas_Lu=DFnig?= <lussnig@smcc.de>
Subject: Re: DF reset / MSS clamp pmtu
Date: Tue, 27 Jul 2004 12:51:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410633BC.1020103@smcc.de>
References: <000001c47314$908a0100$0a00020a@burmann.local.tld>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c47314$908a0100$0a00020a@burmann.local.tld>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Holger Burmann <H.Burmann@gmx.de>
Cc: netfilter@lists.netfilter.org

Holger Burmann wrote:

>Hello !
>Windows 2000 Server drop icmp messages "fragmentation needed". I can
>only get stupid answers from Microsoft about routers who drop the packes
>- but the problem is Microsoft.
>
>So I add=20
>
>iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
>--clamp-mss-to-pmtu
>
> =20
>
The Problem are the tcp flags i think. Since without them i never had=20
the described problem.

Cu Thomas

--=20
Thomas Lu=DFnig
-----------------------------------------------
smcc.net GmbH       | Tel: +49.69.260110-12
Markgrafenstr. 3    | Fax: +49.69.260110-19
60487 Frankfurt     | Web: http://smcc.net
-----------------------------------------------=20


