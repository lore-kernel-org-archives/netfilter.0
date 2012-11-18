From: Karthikeyan Vinayagam <vkarthik@yahoo.com>
Subject: Re: Conntrack-tool error -  undefined symbol: nfct_filter_dump_create
Date: Sun, 18 Nov 2012 05:11:00 -0800 (PST)
Message-ID: <1353244260.90955.YahooMailClassic@web184805.mail.gq1.yahoo.com>
References: <alpine.LNX.2.01.1211071038070.10969@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1353244260; bh=jMPuMEbrDpBLe6XqZCBwkLcYDusPoW9NGmUZBEokZLU=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=VixHildnnFszY5mTmg7GFxdNVAvCXq16zIQDIdK1CnHc2bjxlXemk3sSTqILkzzGI1oItg6VlwOzZRC+fq6eI45AVxFdvucHxuoMgfDqP9wJySag07YNmVqZiLKodyvBVe5cjw932AlqDpi7fY7P9Mh4RP/aAfBF79Iw3VLUT4g=
In-Reply-To: <alpine.LNX.2.01.1211071038070.10969@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

Thank you. found out there was a earlier version of libnetfilter_conntr=
ack in /usr/lib. and finally managed to remove the package. now everyth=
ing works fine.

thanks
Karthik

--- On Wed, 11/7/12, Jan Engelhardt <jengelh@inai.de> wrote:

> From: Jan Engelhardt <jengelh@inai.de>
> Subject: Re: Conntrack-tool error -  undefined symbol: nfct_filter_du=
mp_create
> To: "Karthikeyan Vinayagam" <vkarthik@yahoo.com>
> Cc: "Netfilter user mailing list" <netfilter@vger.kernel.org>
> Date: Wednesday, November 7, 2012, 1:40 AM
> On Wednesday 2012-11-07 09:25,
> Karthikeyan Vinayagam wrote:
>=20
> >I am getting the following error while running
> conntrack, this is under=20
> >under=A0 ubuntu 12.04 (3.2.0-30-generic-pae),
> compiling latest of=20
> >libnetfilter_conntrack 1.02, conntrack_tools 1.4
> >
> >conntrack: symbol lookup error: conntrack: undefined
> symbol:=20
> >nfct_filter_dump_create
>=20
> It would seem that you ultimately do not have
> libnetfilter_conntrack=20
> in the required version.
> Check for the symbol.
>=20
> $ readelf -a /usr/lib64/libnetfilter_conntrack.so.3 | grep
> dump_cr
> =A0=A0=A0112: 0000000000007a90=A0 =A0 15
> FUNC=A0 =A0 GLOBAL DEFAULT=A0=A0=A011
> nfct_filter_dump_create
>=20
> (Use ldd on conntrack-tools to find the actual location of
> the lib)
>=20
>=20
