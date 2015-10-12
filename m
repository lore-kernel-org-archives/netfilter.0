From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Mon, 12 Oct 2015 20:21:51 +0200
Message-ID: <20151012182151.GA7856@salvia>
References: <54761724.9060201@c-s.fr>
 <54815E4F.10500@c-s.fr>
 <20141205103827.GB3746@salvia>
 <54EDBD07.5010801@c-s.fr>
 <CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
 <561BF6AE.7080803@c-s.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <561BF6AE.7080803@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: christophe leroy <christophe.leroy@c-s.fr>
Cc: Jason Sipula <alupis1@gmail.com>, netfilter@vger.kernel.org

On Mon, Oct 12, 2015 at 08:06:38PM +0200, christophe leroy wrote:
>=20
> Le 25/02/2015 16:58, Jason Sipula a =E9crit :
> >my understanding was 3.13 had the core of nftables merged
> Yes but according to Pablo, "userspace supports this but unfortunatel=
y the
> kernel code is still missing".
> Hence my question.
>=20
> As of today, what is the status of nftables regarding the support of =
ct
> helper ?
> If it is not in yet, how can I help getting it in ?

I'd appreciate of you can send me patches that we can discuss on
netfilter-devel@vger.kernel.org.

I think it only requires extra little code for the nft_meta expression
from the kernel.

Thanks.
