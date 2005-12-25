From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?=
	<leolistas@solutti.com.br>
Subject: Re: iptables on FreeBSD
Date: Sat, 24 Dec 2005 23:19:06 -0300
Message-ID: <43AE019A.3010907@solutti.com.br>
References: <000001c69530$0cbbf050$1000a8c0@mutogen>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c69530$0cbbf050$1000a8c0@mutogen>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Artiom Matiuhoff <mutogen@pisem.net>
Cc: netfilter@lists.netfilter.org



Artiom Matiuhoff escreveu:

>Hello,
>
>Is it possible to setup iptables on FreeBSD5.3?
>
> =20
>
    No, you cannot. iptables is NOT a packet filtering software. That's=20
a task for netfilter, which is part of linux kernel. iptables is only=20
used to manage netfilter rules.

    So, even if you can compile iptables on freebsd (which you probably=20
wont, because of missing headers), freebsd kernel will not provide=20
netfilter structure that is used by iptables.

    As a completly linux kernel based software, iptables cannot run on=20
non-linux plataforms.

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





