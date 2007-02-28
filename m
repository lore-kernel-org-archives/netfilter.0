From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: Re IPv6 MARK support
Date: Wed, 28 Feb 2007 19:53:22 +0900 (JST)
Message-ID: <200702281053.l1SArNIC025800@toshiba.co.jp>
References: <2acb06d50702280004r5dae5aa1p6fb1f0bc9543a3d3@mail.gmail.com>
	<2acb06d50702280155x6b6f89e3o89097e070880ae3e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2acb06d50702280155x6b6f89e3o89097e070880ae3e@mail.gmail.com>
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: mael.boutin@laposte.net
Cc: netfilter@lists.netfilter.org


Hi,

From: "Boutin Ma=EBl" <mael.boutin@laposte.net>
Date: Wed, 28 Feb 2007 10:55:01 +0100

> After some tests, it appears that it is the OUTPUT chain that does no=
t
> work. Indeed with the PREROUTING chain the mark is taken into account=

> by iproute and the packet is routed as indicated in the corresponding=

> tables.
> =

> Is it a bug or something i missed ?

I suspect IPv6 routing. But for conformation, can you try

	ip6tables -t mangle -A OUTPUT -m mark --mark 0x1 -j LOG	--log-prefix "=
out6 "
	ip6tables -t mangle -A POSTROUTING -m mark --mark 0x1 -j LOG --log-pre=
fix "post6 "

after your rules and check whether you can see some log by LOG target ?=

And do you have any chance to try 2.6.20 ?

-- Yasuyuki Kozakai

