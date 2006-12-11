From: =?ISO-8859-9?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Iptables Modules
Date: Mon, 11 Dec 2006 13:16:41 +0100
Message-ID: <457D4C29.6030807@freemail.hu>
References: <20061211120250.1083C85A53@mail.whb.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061211120250.1083C85A53@mail.whb.hu>
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
To: Ali Ozaltin <ali@yenibasaran.com>
Cc: netfilter@lists.netfilter.org


Ali Ozaltin =EDrta:
> Hello,
>
> When I use "lsmod" command i can see three enables module for iptables.=
 How
> can I enable other modules ? Can you pls help ?=20
>
> ip_tables              17669  3 iptable_nat,iptable_mangle,iptable_filt=
er
>
> Thank you for your helps
>
>  =20
First:
 Try simply using them...
 If autoloading enabled in your kernel then they will be loaded when=20
needed...
Second:
 Use modprobe command.

Swifty


