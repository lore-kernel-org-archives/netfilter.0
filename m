From: "=?ISO-8859-1?Q?Boutin_Ma=EBl?=" <mael.boutin@gmail.com>
Subject: Re: Re IPv6 MARK support
Date: Thu, 1 Mar 2007 12:05:26 +0100
Message-ID: <2acb06d50703010305u3bc7a1d9h862b8d01bed685c4@mail.gmail.com>
References: <200702281053.l1SArNIC025800@toshiba.co.jp>
	<200702281136.l1SBaJLe019021@toshiba.co.jp>
	<2acb06d50702280353q10529555vebd20e93ee7040e1@mail.gmail.com>
	<200702281238.l1SCcE4F016826@toshiba.co.jp>
	<2acb06d50703010232k64325368l2cfab895b460c9b7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=Kkj8iQiAP4GHnOw4WhNaEMQOdJedQuKl+xES6UAl92JF/oSrCm9E4NSwA4EkDf7w2Q45wh04bXKUUrq8ws0V4fxbcxodCqb9xYdBnMT46WOxKgynZwUqp79lSQPdAqFWjrnCmBTUoPzlBe3azPTacub/IEBvEtIhTvLRLja4g9w=
In-Reply-To: <2acb06d50703010232k64325368l2cfab895b460c9b7@mail.gmail.com>
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

Sorry,

Ok with the patch it works... I expected that ipv6 source address
would change and take the ipv6 adress of the new interface, which is
after reflexion stupid ... The packet exits the terminal with the new
interface, everything good... almost this creates a new problem for us
...

We would like to have the Source IPv6 address of the new interface and
not the IPv6 adress of the default route. Is it possible on PREROUTING
hook to change the IPv6 address of the outgoing packets ?


On 3/1/07, Boutin Ma=EBl <mael.boutin@laposte.net> wrote:
> Sorry, i did not answer to the netfilter list.
>
> It does not work with the 2.6.20 kernel although the patch is applied.
> I followed the functions calls and i really do not understand what is
> missing. In my opinion the ip rule is matched and applied to the
> packet (the dst_entry seems to be good, at least the net_device
> structure). The skb->dev field contain the good device (eth0) from
> which the paket should leave the terminal (tested in function
> ip6_output2) however the pcket continues to leave through the default
> interface.
>
> I am not an expert of Linux and the IPv6 stack, so your help would be
> greatly appreciated !
>
> On 2/28/07, Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp> wrote:
> >
> > Hi,
> >
> > From: "Boutin Ma=EBl" <mael.boutin@laposte.net>
> > Date: Wed, 28 Feb 2007 12:53:44 +0100
> >
> > > Thanks for the patch, however it does not work, the kernel does not c=
ompile :
> > >
> > > line 18:
> > >
> > > struct sk_buff has no member named mark (it should be nfmark no ?)
> > > unknown field "mark" specified in initializer
> >
> > Ah yes. nfmark is renamed to mark at 2.6.20.
> >
> > > To answer your previous questions :
> > > yes i have logs in the kernel for both out6 and post6.
> >
> > Thanks.
> >
> > > Of course i can try 2.6.20 but it seems to me that there is the same
> > > problem (i tried before)
> >
> > I think so.
> >
> > > In my opinion the problem is due to the fact that the routing decisio=
n
> > > is made before OUTPUT chain but not relaunched once the nfmark routin=
g
> > > key is changed which is i think how it should work.
> >
> > Yes. That is what ip6_route_me_harder does.
> >
> > How about this for 2.6.19 ?
> >
> > [NETFILTER]: ip6_route_me_harder should take into account mark
> >
> > Signed-off-by: Yasuyuki Kozakai <yasuyuki.kozakai@toshiba.co.jp>
> >
> > diff --git a/net/ipv6/netfilter.c b/net/ipv6/netfilter.c
> > index f6294e5..ca50b58 100644
> > --- a/net/ipv6/netfilter.c
> > +++ b/net/ipv6/netfilter.c
> > @@ -15,6 +15,7 @@ int ip6_route_me_harder(struct sk_buff *
> >         struct dst_entry *dst;
> >         struct flowi fl =3D {
> >                 .oif =3D skb->sk ? skb->sk->sk_bound_dev_if : 0,
> > +               .mark =3D skb->nfmark,
> >                 .nl_u =3D
> >                 { .ip6_u =3D
> >                   { .daddr =3D iph->daddr,
> >
>
>
> --
> echo '[q]sa[ln0=3Daln256%Pln256/snlbx]sb3135071790101768542287578439snlbx=
q'|dc
>


--=20
echo '[q]sa[ln0=3Daln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq'=
|dc

