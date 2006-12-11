From: "Ali Ozaltin" <ali@yenibasaran.com>
Subject: RE: Iptables Modules
Date: Mon, 11 Dec 2006 14:23:56 +0200
Message-ID: <27016.3445886739$1165839846@news.gmane.org>
References: <457D4C29.6030807@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457D4C29.6030807@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-9?Q?'G=E1sp=E1r_Lajos'?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

How can i check autoloading ?=20

-----Original Message-----
From: G=E1sp=E1r Lajos [mailto:swifty@freemail.hu]=20
Sent: Monday, December 11, 2006 2:17 PM
To: Ali Ozaltin
Cc: netfilter@lists.netfilter.org
Subject: Re: Iptables Modules


Ali Ozaltin =EDrta:
> Hello,
>
> When I use "lsmod" command i can see three enables module for =
iptables.
How
> can I enable other modules ? Can you pls help ?=20
>
> ip_tables              17669  3 =
iptable_nat,iptable_mangle,iptable_filter
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


