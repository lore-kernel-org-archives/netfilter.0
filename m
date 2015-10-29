From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Thu, 29 Oct 2015 15:21:15 -0700
Message-ID: <C08DF2C0-0990-4A0C-885A-4841224B78FC@gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com> <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com> <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:subject:from:in-reply-to:date
         :content-transfer-encoding:message-id:references:to;
        bh=5wbcMD3jnvRgwDvQYVv6ZAwsHIQtVvJSD0oLNak1Kxc=;
        b=SebFuSJ7I5mibtGdF93CNqhTaxbM5gVT5+6oAWqplnLtdGfSQAxHjFkJlTxM2VgfH4
         qNGWlF+dgzGOp6I1qJD2MB69Px9cnxSMQisLaqcO57uKNo+TSkYno774TctFW9rD+n2p
         tnmPiljQDUup65EYeIM8oniYSiDmkNHyLVVqU+B2kePqL9MQ6zAcTOPOe0rOpYnFLxTr
         L8u0n0W5oP7v4smTADYBU6Z/h5Nzx6LnRiyQ2DwIYkVZb2UWSOzKUpqPi/QqacA+JvMX
         YwXkhtLG2hloSCRHxo/ln8G6npWeg7RLTQB5lJ2bVdPojRtdypFybDKZ5Y3XYVBOeFSq
         5ZrQ==
In-Reply-To: <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

>>> CONFIG_NFT_MASQ=3Dm
>>=20
>> Ahh, that might be it. The Arch build script is here [2] and I don=E2=
=80=99t see anything that looks like CONFIG_NFT_MASQ. I=E2=80=99ll reco=
mpile tomorrow and see where that leads us.
>=20
> this config option is from the linux kernel,=20

Sorry, my bad, should have recognized that. Turns out that I have anoth=
er Arch box in which the masquerade keyword does not produce an error. =
Looks like different kernel modules are being loaded. While I=E2=80=99m=
 investigating, I=E2=80=99m noticing that Arch does use slightly differ=
ent options for its default kernel, specifically:

CONFIG_NFT_REDIR_IPV4=3Dm
CONFIG_NFT_MASQ_IPV6=3Dm

are both set (compared to the list sent by Arturo). I do not know what =
those mean, but I assume they won=E2=80=99t hurt?

Cheers,



Johannes.


