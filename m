From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: conntrack table limits
Date: Wed, 26 Jan 2011 03:06:52 +0100
Message-ID: <4D3F81BC.7020600@conversis.de>
References: <4D3EB7F0.5020702@conversis.de> <4D3ED4D6.6000601@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D3ED4D6.6000601@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?UmVtemkgQUtZw5xa?= <linuxliste@gmail.com>
Cc: netfilter@vger.kernel.org

On 01/25/2011 02:49 PM, Remzi AKY=C3=9CZ wrote:
> /etc/modules
> nf_conntrack acct=3D1 hashsize=3D1048576
>
> Hashsize calc;
>
> HASHSIZE =3D CONNTRACK_MAX / 8 =3D RAMSIZE (in bytes) / 131072 =3D RA=
MSIZE (in
> MegaBytes) * 8
> HASHSIZE =3D CONNTRACK_MAX / 8 =3D RAMSIZE (in bytes) / 131072 / (x /=
 32)
> x=3D 32 or 64
>
> CONNTRACK_MAX =3D HASHSIZE * 8

That makes sense, thanks.

> you can see this
> http://antmeetspenguin.blogspot.com/2011/01/high-performance-linux-ro=
uter.html
> page.
>
> On 01/25/2011 01:45 PM, Dennis Jacobfeuerborn wrote:
>> Hi,
>> I'm trying to find out how high I can set conntrack_max on a 2GB 64 =
bit
>> system. On the net I found different ways of calculating this but th=
ey
>> seem to end up with different results. One forumla tells me that I c=
an
>> fit a maximum of 65535 connections into 2GB of RAM but the other say=
s
>> that with 304 bytes per connection (plus a bit of slab allocation
>> overhead) I can easily fit more than a million connections into the =
table.
>> Also even with the current limit 65535 and the table having ca. 30.0=
00
>> entries I've almost 1.8GB ram free/cached which leads me to believe =
the
>> second way of calculating this is more accurate.
>> What is the proper way to calculate this?
>>
>> Regards,
>> Dennis
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>

