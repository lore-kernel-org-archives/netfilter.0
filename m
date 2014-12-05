From: leroy christophe <christophe.leroy@c-s.fr>
Subject: Re: Reversed byte order issue with nft ?
Date: Fri, 05 Dec 2014 07:40:29 +0100
Message-ID: <5481535D.3010703@c-s.fr>
References: <547F467B.3060206@c-s.fr> <20141204132721.GA10863@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20141204132721.GA10863@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

v2 tested, it works.

Thanks a lot.
Christophe

Le 04/12/2014 14:27, Pablo Neira Ayuso a =E9crit :
> On Wed, Dec 03, 2014 at 06:20:59PM +0100, leroy christophe wrote:
>> Hi,
>>
>> When doing 'nft list ruleset', I get a bad result (see below),
>> fields appear as "unknown" and/or as numeric values.
> Please, test this:
>
> http://patchwork.ozlabs.org/patch/417775/
>
> and confirm that this resolves your problem. Thank you.
>

--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
