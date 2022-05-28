From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Re: traffic shaping with tc and nft
Date: Sat, 28 May 2022 14:21:34 +0300
Message-ID: <dd0cbe95-1e86-9150-cc28-649f873742d8@gmx.com>
References: <c3bc1649-d70b-ae7b-b306-0d5f2a765857@gmx.com>
 <877d66t0v5.fsf@alfa.kjonca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1653736895;
        bh=bYKFtDMMwL1T6CO05IIGqdednZNkpsT5RlMMJANaQTk=;
        h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
        b=NYuppeZ/auBLTppkb7V6wIOqkL8lNcotkR0h430UjRS4xAudUhZhU5IAzbpddVXjQ
         ApNs+Ir5vlryhVO5n2FFMoRslK9qHRzPM9uCbvF/84Deh0H+4A/YQl3TQFKebScOia
         MoELca+gSU5VTaLdwwD7WIXA+sawVGXwzqUNhqVY=
Content-Language: en-US
In-Reply-To: <877d66t0v5.fsf@alfa.kjonca>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

On 5/28/22 13:20, Kamil Jo=C5=84ca wrote:
> Lars Nood=C3=A9n <lars.nooden@gmx.com> writes:
>
>> Hello,
>>
>> I'm working on traffic shaping with tc and have some old iptables rules
>> with which I've tried to use iptables-translate to convert legacy
>> instructions to nftables.  For example, I have the following:
>>
>>      iptables -t mangle -A OUTPUT -p tcp --match multiport \
>> 	--sports 22,1965 -j MARK --set-mark 100
>>
>> and the result is,
>>
>>      nft add rule ip mangle OUTPUT ip protocol tcp \
>> 	tcp sport {22,1965} counter meta mark set 0x64
>
> Blind shot: in nftables you have no OUTPUT chain by default so I suspect
> you have to create it manually.
>
> nft add chain ip mangle  OUTPUT ...
>
> KJ

Thanks.  I think that was it.  I had to create both the table and the
chain first.

/Lars
