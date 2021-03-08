From: Amish V <anon.amish@gmail.com>
Subject: Re: when will nftables have ability to delete matching rule like iptables?
Date: Tue, 9 Mar 2021 04:16:14 +0530
Message-ID: <D0655906-0F05-4EDE-AE96-AE153DA2A856@gmail.com>
References: <d27a2a67-6739-6ade-d822-bbefd9c8bcd4@gmail.com> <0a56115b-e5aa-81a9-2b69-3cd5d11609c9@plushkava.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rlqGEvF3RMpr9T5pkDqqIMFWRRlt1ilE4pWhhsD9/0c=;
        b=t7F0vJWdkv6Ya4irpbuh1qnE+dg1/2hF7CXP6bjIpasg+McEhh0jr5+pS64OsR/CPF
         JuxsC/wAKvzXhpiSoSoptATJYToWwBx34FjKcBm+rZnTvUh+8/eATIWS6fpoD6YYdKVe
         yxI+EwOX3AtMaoWy/3plr8xNaVeE11fypifPL4CCq+Oa+hosUQ3355+1jyHzLhxucd7E
         5cUQKWnji1CDPTgMqnDx0Iy49+ME1u63HTs/B+hXO9XcIf/VMT4v5+tVGnK6JwKzYJ7d
         remVJBBVNduTu5mh1IIGCX6O7ione7wv/1g4sXVncOCGbSnj+Nr6RYqKFopqG5UXYPAt
         owWQ==
In-Reply-To: <0a56115b-e5aa-81a9-2b69-3cd5d11609c9@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: kfm@plushkava.net
Cc: netfilter@vger.kernel.org


> On 08-Mar-2021, at 8:54 PM, "" <kfm@plushkava.net> <kfm@plushkava.net> wro=
te:
>=20
>> On 08/03/2021 13:14, Amish wrote:
>> Hello,
>> I have few programs that currently use iptables to add / delete firewall r=
ules.
>> I have been waiting to migrate to nftables from 3-4 years. (I do not want=
 to use nft based iptables)
>> But roadblock for me is inability of nftables to delete a matching rule. (=
similart to iptables -D INPUT -s 192.168.1.10 -j ACCEPT)
>> Obtaining the handle first and then deleting is difficult programmaticall=
y.
>> Have I missed any easy way out here?
>=20
> Assuming that "-D INPUT -s 192.168.1.10 -j ACCEPT" is indicative of the ru=
les that are being added and removed, the easy way would be to manipulate a s=
et rather than a chain. That also goes for iptables, given the existence of i=
pset.

No I have many complex rules. Above was just an example.

When rules are complex parsing the nft output programmatically to find the h=
andle of the rule is not easy.

Regards,

Amish=
