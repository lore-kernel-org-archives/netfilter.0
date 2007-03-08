From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: nf-hipac for current kernels?
Date: Thu, 08 Mar 2007 16:43:10 +0200
Message-ID: <45F020FE.8020704@zoomnet.ro>
References: <200703081538.00702.ml@hboeck.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200703081538.00702.ml@hboeck.de>
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
To: =?ISO-8859-1?Q?Hanno_B=F6ck?= <ml@hboeck.de>
Cc: netfilter@lists.netfilter.org

Hanno B=F6ck wrote:
> Hi,
>
> wanted to ask if there's information about the status of nf-hipac. I coul=
dn't=20
> find any patches to up-to-date kernels.
>
> Is there any development happening or is the project considered dead? Are=
=20
> there plans to merge stuff with iptables/replace in-kernel stuff with it?
>
>  =20
You can find one for 2.6.17 kernels on google, i think posted in this=20
list. But i don't really recomend it. On a dual P3 machine, i=20
experimented random and then almoust total packet drop, and i couldn't=20
remove the module from kernel, so i rebooted, and never used it again.=20
That happened a few months ago on a 2.6.17 kernel (with imq).

