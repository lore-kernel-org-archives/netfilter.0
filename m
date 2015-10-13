From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Tue, 13 Oct 2015 07:49:39 +0200
Message-ID: <561C9B73.9020509@c-s.fr>
References: <54761724.9060201@c-s.fr> <54815E4F.10500@c-s.fr>
 <20141205103827.GB3746@salvia> <54EDBD07.5010801@c-s.fr>
 <CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
 <561BF6AE.7080803@c-s.fr>
 <CAJCcFsip+zxLgOTjHfeWGug+up0+T3LM4Tb9+9uvvr0KDcBjMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJCcFsip+zxLgOTjHfeWGug+up0+T3LM4Tb9+9uvvr0KDcBjMQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jason Sipula <alupis1@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org



Le 12/10/2015 20:11, Jason Sipula a =C3=A9crit :
> Maybe we're talking about different things? I had read in some places
> that linux kernel version 3.13 had the core of nftables merged.
>
> https://wiki.archlinux.org/index.php/Nftables
>
> I do not know anything about ct helper, however.

"ct helper" stands for conntrack helper. It is some part of netfilter=20
that helps conntrack
to track complex streams like FTP or TFTP streams where the conntrack=20
needs to identify and keep
track of the data stream associated to the signalling stream

Christophe
