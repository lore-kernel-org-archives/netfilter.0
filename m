From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 07:26:06 -0400
Message-ID: <d8aa9eed-4e9f-7385-6908-438e71c8c2d1@fhmtech.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
 <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
 <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com>
 <CAEXMXLSGWtT_6JrCEFhRgvG4-Ssj1jnVUs_r4JjoFzwjiip=mA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=FExDQNCszm66Fm7g5S4Exhw0uM1KNG4lLAPv43caNxE=;
        b=IFEOyJ518HI+70WB94rG7Ap+XVdZwJUugT8ghJE8PbCQAStB8Uu8o85bWoCP4jhcXSGLyYgNT2FyHkKI+a/OxHMyJbt49WoYqhoW1MJ5DF1VYIihK0LyLUelv5viIQLh4T0KKfRmYHNnRqOG81AeSuaR/CORBtzkJENoRlZ0kpw=;
Content-Language: en-US
In-Reply-To: <CAEXMXLSGWtT_6JrCEFhRgvG4-Ssj1jnVUs_r4JjoFzwjiip=mA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>
Cc: netfilter@vger.kernel.org

On 2022/07/06 06:27, Nuno Gon=C3=A7alves wrote:

> Yes. I am testing and always and the bug is exposed with a flood ping,
> for example, so from the same IP.
>=20
> Yes, I agree that this should accept 5 new sources per second, but
> each can then do unlimited requests.
>=20
> That is why I suggest the wiki to be updated.

Thanks for clarifying. Now I understand your need to also move the ct=20
accept rule to the end of the "inbound" base chain to counter the ping=20
flood from a single ip address.

I'm not going to update the wiki page just yet, for several reasons:

* I'm not the author of the example ruleset.

* In general I prefer to have ct accept rules near the top of base=20
chains, as in the existing example. That way existing connections get=20
matched and accepted as quickly as possible without having to first=20
evaluate all the other rules in the chain.

* I agree that your modifications will counter a single-ip ping flood=20
attack. Whether that attack is significant compared with, say, DDoS ping=20
floods or attacks against other services, will depend on the particulars=20
of your installation. If the single-ip ping flood *is* a big concern, it=20
may be better to use a different ruleset construction with icmp in a=20
dedicated chain.

* Most significantly: To me the behavior you describe smells like a bug=20
in ICMP connection tracking, better fixed in ct than with nftables=20
ruleset work-arounds. I expect a big part of the difficulty is caused by=20
trying to track "state" of stateless ICMP. Even so, why does ct consider=20
additional incoming echo requests to be part of the "connection"?=20
Naively, it seems to me that ct should count only outgoing echo replies=20
as part of the established connection, and that all incoming echo=20
requests should be considered "new connections". Maybe that wasn't done=20
because in practice it leads to too many conntrack entries. Hopefully=20
someone more familiar with ct implementation will comment.

Best regards,
Frank
