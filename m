From: christophe leroy <christophe.leroy@c-s.fr>
Subject: Re: How are ct helper to be configured with NFT ?
Date: Wed, 2 Mar 2016 19:14:05 +0100
Message-ID: <56D72D6D.3060308@c-s.fr>
References: <54761724.9060201@c-s.fr> <54815E4F.10500@c-s.fr>
 <20141205103827.GB3746@salvia> <54EDBD07.5010801@c-s.fr>
 <CAJCcFsgYxFZUiCfEa4tAZV6LSt23wg5xA25=m-w7aaiZ6OX2uQ@mail.gmail.com>
 <561BF6AE.7080803@c-s.fr> <20151012182151.GA7856@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151012182151.GA7856@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jason Sipula <alupis1@gmail.com>, netfilter@vger.kernel.org



Le 12/10/2015 20:21, Pablo Neira Ayuso a =E9crit :
> On Mon, Oct 12, 2015 at 08:06:38PM +0200, christophe leroy wrote:
>> Le 25/02/2015 16:58, Jason Sipula a =E9crit :
>>> my understanding was 3.13 had the core of nftables merged
>> Yes but according to Pablo, "userspace supports this but unfortunate=
ly the
>> kernel code is still missing".
>> Hence my question.
>>
>> As of today, what is the status of nftables regarding the support of=
 ct
>> helper ?
>> If it is not in yet, how can I help getting it in ?
> I'd appreciate of you can send me patches that we can discuss on
> netfilter-devel@vger.kernel.org.
>
> I think it only requires extra little code for the nft_meta expressio=
n
> from the kernel.
>
>
Isn't it is in nft_ct instead of nft_meta ?

I'm having difficulties to understand how it works.
nft_ct_set_init() is called when I add the rule in the table. So I=20
believe I have to call nf_ct_helper_ext_add() from here, haven't I ?
But how do I get the name of the requested helper from that function ? =
I=20
suppose once I get it I can do the same as  xt_ct_set_helper() does.

Otherwise, nft_ct_set_eval() is called when the helper is needed, but I=
=20
suppose it is too late when that happens because the conntrack has=20
already said that it has used automatic helper assignment.

Christophe

---
L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=E9=
e par le logiciel antivirus Avast.
https://www.avast.com/antivirus

