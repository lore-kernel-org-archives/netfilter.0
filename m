From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: IPMark won't compile on a vanilla 2.6.20 kernel
Date: Wed, 25 Apr 2007 08:55:11 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704250854580.19711@yvahk01.tjqt.qr>
References: <462E0C01.5080405@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462E0C01.5080405@zensoluciones.com>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-9"
To: =?ISO-8859-1?Q?S=E9bastien_CRAMATTE?= <scramatte@zensoluciones.com>
Cc: netfilter@lists.netfilter.org


On Apr 24 2007 15:54, S=C3=A9bastien CRAMATTE wrote:
>
>Hello,
>
>IPMark won't compile on a vanilla 2.6.20 kernel
>I obtain this error during the compilation under debian sarge 3.1
>
>  CC [M]  net/ipv4/netfilter/ipt_TTL.o
>  CC [M]  net/ipv4/netfilter/ipt_IPMARK.o
>net/ipv4/netfilter/ipt_IPMARK.c: In function `target':
>net/ipv4/netfilter/ipt_IPMARK.c:37: error: structure has no member named
>`nfmark'
>
>Any ideas ?

It's simply outdated.


Jan
--=20

