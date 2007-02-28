From: "=?ISO-8859-1?Q?Boutin_Ma=EBl?=" <mael.boutin@laposte.net>
Subject: Re: Re IPv6 MARK support
Date: Wed, 28 Feb 2007 12:53:44 +0100
Message-ID: <2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>
References: <2acb06d50702280004r5dae5aa1p6fb1f0bc9543a3d3@mail.gmail.com>
	<2acb06d50702280155x6b6f89e3o89097e070880ae3e@mail.gmail.com>
	<200702281053.l1SArNIC025800@toshiba.co.jp>
	<200702281136.l1SBaJLe019021@toshiba.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=MgbGmLNH7HOLpTE01bSRMltbdxU985QmexiPoEqg/WPrjBooDN8I8LQC2iI7eRdusN1oGObOcq4DGu3IxvQRNdCpYAkzeA+gbK63pk2x+LnDx2R6IZ+Sp3aSt9Kvd9fjXL8FjwGTJnb36DJDVouNEs1zxFfTwjK9V2evyGsa3GU=
In-Reply-To: <200702281136.l1SBaJLe019021@toshiba.co.jp>
Content-Disposition: inline
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
To: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Cc: netfilter@lists.netfilter.org

Thanks for the patch, however it does not work, the kernel does not compile=
 :

line 18:

struct sk_buff has no member named mark (it should be nfmark no ?)
unknown field "mark" specified in initializer

To answer your previous questions :
yes i have logs in the kernel for both out6 and post6.
Of course i can try 2.6.20 but it seems to me that there is the same
problem (i tried before)

In my opinion the problem is due to the fact that the routing decision
is made before OUTPUT chain but not relaunched once the nfmark routing
key is changed which is i think how it should work.

Best regards,

Ma=EBl

On 2/28/07, Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp> wrote:
>
> Hi again,
>
> From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
> Date: Wed, 28 Feb 2007 19:53:22 +0900 (JST)
>
> >
> > Hi,
> >
> > From: "Boutin Ma=EBl" <mael.boutin@laposte.net>
> > Date: Wed, 28 Feb 2007 10:55:01 +0100
> >
> > > After some tests, it appears that it is the OUTPUT chain that does no=
t
> > > work. Indeed with the PREROUTING chain the mark is taken into account
> > > by iproute and the packet is routed as indicated in the corresponding
> > > tables.
> > >
> > > Is it a bug or something i missed ?
> >
> > I suspect IPv6 routing. But for conformation, can you try
> >
> >       ip6tables -t mangle -A OUTPUT -m mark --mark 0x1 -j LOG --log-pre=
fix "out6 "
> >       ip6tables -t mangle -A POSTROUTING -m mark --mark 0x1 -j LOG --lo=
g-prefix "post6 "
> >
> > after your rules and check whether you can see some log by LOG target ?
> > And do you have any chance to try 2.6.20 ?
>
> I found that ip6_route_me_harder() doesn't take into account of mark.
>
> Can you try this patch ?
>
> Regards,
>
> [NETFILTER]: ip6_route_me_harder should take into account mark
>
> Signed-off-by: Yasuyuki Kozakai <yasuyuki.kozakai@toshiba.co.jp>
>
> diff --git a/net/ipv6/netfilter.c b/net/ipv6/netfilter.c
> index f6294e5..ca50b58 100644
> --- a/net/ipv6/netfilter.c
> +++ b/net/ipv6/netfilter.c
> @@ -15,6 +15,7 @@ int ip6_route_me_harder(struct sk_buff *
>         struct dst_entry *dst;
>         struct flowi fl =3D {
>                 .oif =3D skb->sk ? skb->sk->sk_bound_dev_if : 0,
> +               .mark =3D skb->mark,
>                 .nl_u =3D
>                 { .ip6_u =3D
>                   { .daddr =3D iph->daddr,
>


--=20
echo '[q]sa[ln0=3Daln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq'=
|dc

