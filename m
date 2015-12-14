From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Linux 4.3.1 regression: -m state returns "Protocol wrong type
 for socket"
Date: Mon, 14 Dec 2015 22:19:34 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1512142215460.32166@blackhole.kfki.hu>
References: <566C0E75.6080800@familie-kuntze.de> <566c4622.936d810a.ece67.ffffdfc9@mx.google.com> <20151212232044.GE12854@breakpoint.cc> <566cae67.86f60d0a.f3ad2.2638@mx.google.com> <alpine.LSU.2.20.1512130032300.32038@nerf40.vanv.qr>
 <566cb640.46dc0d0a.5c3cc.287a@mx.google.com> <alpine.LSU.2.20.1512130124180.832@nerf40.vanv.qr> <566cbcbe.01ed0d0a.36f37.2c88@mx.google.com> <alpine.LSU.2.20.1512130135350.32160@nerf40.vanv.qr> <alpine.DEB.2.10.1512142140550.31836@blackhole.kfki.hu>
 <20151214205556.GA2927@salvia>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	blackhole.kfki.hu; h=content-type:content-type:mime-version
	:user-agent:references:message-id:message-id:in-reply-to:from
	:from:date:date:received:received:received; s=20151130; t=
	1450127973; x=1451942374; bh=WKw/qpwKUnKhfm0EnAodSdKWfAaRGTiHzoP
	gxC0+lmc=; b=JUpvlPHaWoleZ2BGd18yBlWrchHnz3/nkKZ/tYTc3scWE/xny5X
	pCVfjPruSSiZQHrFZfLjQzieRMMMH4jQpL0KnTpbppqYFOK1BmTQqFHbfpiWVQPT
	1LifqzXm10e27C34WFegbCacLPVput5Huv9/fBxE4o0Ke+oDo72+JMsc=
In-Reply-To: <20151214205556.GA2927@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jan Engelhardt <jengelh@inai.de>, =?ISO-8859-15?Q?D=E2niel_Fraga?= <fragabr@gmail.com>, Florian Westphal <fw@strlen.de>, Noel Kuntze <noel@familie-kuntze.de>, =?ISO-8859-15?Q?Remzi_AKY=DCZ?= <linuxliste@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Mon, 14 Dec 2015, Pablo Neira Ayuso wrote:

> On Mon, Dec 14, 2015 at 09:47:31PM +0100, Jozsef Kadlecsik wrote:
> > diff --git a/net/ipv4/netfilter/Kconfig b/net/ipv4/netfilter/Kconfig
> > index a355841..a1dfd23 100644
> > --- a/net/ipv4/netfilter/Kconfig
> > +++ b/net/ipv4/netfilter/Kconfig
> > @@ -12,6 +12,7 @@ config NF_DEFRAG_IPV4
> >  config NF_CONNTRACK_IPV4
> >         tristate "IPv4 connection tracking support (required for NAT)"
> >         depends on NF_CONNTRACK
> > +       default NETFILTER_XT_MATCH_CONNTRACK
> 
> I know of some people already giving a try to compiling nftables only
> kernels, I think this would create an unnecessary dependency.
> 
> >         default m if NETFILTER_ADVANCED=n
> >         select NF_DEFRAG_IPV4
> >         ---help---

It don't see why would it be a dependency for nftables only kernels. In 
that case NETFILTER_XT_MATCH_CONNTRACK is set to "n", so the default would 
be the same as currently and just right.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
