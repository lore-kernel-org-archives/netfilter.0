From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 05:59:44 -0400
Message-ID: <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID; bh=tqIml/Y+llbNr3/Q3UYVL2E+flFujKtGhQW+rnBAs04=;
        b=fvBCgjPhWe1D+ob6LSvWAkTfRYwaBc2S/64qrWhU3w0glNnEPA2VRteo/VA3ir2VbJttfihhsaSw43NI6jWmqX9lglLVmoASUOW0j6kJsV1JMqmcE9HOTSdLDCJ4it8q8EHAywkJM1VyS6yR1nAWn0MUll8C3hNDQ/tx3WpQdnI=;
Content-Language: en-US
In-Reply-To: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>, netfilter@vger.kernel.org

On 2022/07/06 05:36, Nuno Gon=C3=A7alves wrote:
> https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_se=
rver
>=20
> I believe in this example ct will accept echo-request regardless of
> the rate limit.
>=20
> To fix it, the line
>=20
>> icmp type echo-request limit rate 5/second accept
>=20
> Must be followed by
>=20
>> icmp type echo-request drop
>=20
> Also the same for icmpv6.
>=20
> And ct must be moved to the end of the chain.
>=20
> I suggest this is changed in the wiki.
>=20
> Thanks,
> Nuno


Hi Nuno,

The icmp and icmpv6 rules you refer to are in regular chains, both=20
called by base chain "inbound" that has policy drop and no other icmp /=20
icmp6 rules. Therefore there is no need for the additional "drop" rules=20
that you suggest; packets arriving faster than the limit rates will be=20
dropped by the calling base chain's default policy.

Best regards,
Frank
