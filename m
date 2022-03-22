From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: bug report and future request
Date: Wed, 23 Mar 2022 00:55:13 +0200
Message-ID: <04C4931B-553E-4FEA-85D4-B3E186520EE5@gmail.com>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
 <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
 <20220322103203.GD24574@breakpoint.cc>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dPberEcHvinDoL0MKw9Bz1UY9GEmtToHC5YiJuekCnU=;
        b=AM5y89ikFNJYcD0ADphc0QQyruNgYtKcdfFImynxTU2lxZw8FYhLISPvUzEKEIPLgb
         ECFQb9Tuq6T+hlansIUhfgkOoq3u74QiWKrFfJmdShKbh/Z2ll2UowVchfWOj8OZ6X5f
         GBVaUv/bvGBVvYmym4zTmtnQuLzh+nCXy72uCXGNP0tDJ2d003qSNoRJB52HsRDHchXS
         s84s7tOgvXJDMVFxjHDFtyqCCN7fUE/vaLzl02qCRy3PTlE6zLCA/N0G0n0tEp35u1X7
         C3gum2jIBiHdfsVfsaeu1gJHTpNIoddytUpTm49Zu744QUjhu0ma0SRVdfO1Lcg+KwjF
         5qkw==
In-Reply-To: <20220322103203.GD24574@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org, pablo@netfilter.org

Hi Florian

yes now work perfect
i will test with 1-4k ips to see performance vs qdisc or iptables.

for second offload question:

is it possible to make limiter work in offload mode and ia it posible to =
add dynamic interface like ppp* or vlan* or other type.



P.S.

thanks for fast reply for first part!

P.S.2=20

resend mail to netfilter group

Martin

> On 22 Mar 2022, at 12:32, Florian Westphal <fw@strlen.de> wrote:
>=20
> Martin Zaharinov <micron10@gmail.com> wrote:
>> Hi Florian
>>=20
>> Look good this config but not work after set user not limit by speed.
>=20
> Works for me.  Before:
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-10.00  sec  5.09 GBytes  4.37 Gbits/sec    0 sender
> [  5]   0.00-10.00  sec  5.08 GBytes  4.36 Gbits/sec receiver
>=20
> After:
> [  5]   0.00-10.00  sec  62.9 MBytes  52.7 Mbits/sec    0 sender
> [  5]   0.00-10.00  sec  59.8 MBytes  50.1 Mbits/sec receiver
>=20
>> table inet nft-qos-static {
>>        set limit_ul {
>>                typeof ip saddr
>>                flags dynamic
>>                elements =3D { 10.0.0.1 limit rate over 5 =
mbytes/second burst 6000 kbytes, 10.0.0.254 limit rate over 12 =
mbytes/second burst 6000 kbytes }
>>        }
>> 		set limit_dl {
>>                typeof ip saddr
>>                flags dynamic
>>                elements =3D { 10.0.0.1 limit rate over 5 =
mbytes/second burst 6000 kbytes, 10.0.0.254 limit rate over 12 =
mbytes/second burst 6000 kbytes }
>>       }
>>=20
>>        chain upload {
>> 			type filter hook postrouting priority filter; =
policy accept;
>> 			ip saddr @limit_ul drop
>>        }
>> 		chain download {
>> 			type filter hook prerouting priority filter; =
policy accept;
>> 			ip saddr @limit_dl drop
>> 		}
>=20
> daddr?
>=20
>> With this config user with ip 10.0.0.1 not limited to 5 mbytes ,=20
>=20
>> When back to this config :
>>=20
>> table inet nft-qos-static {
>> 	chain upload {
>> 		type filter hook postrouting priority filter; policy =
accept;
>> 		ip saddr 10.0.0.1 limit rate over 5 mbytes/second burst =
6000 kbytes drop
>> 	}
>>=20
>> 	chain download {
>> 		type filter hook prerouting priority filter; policy =
accept;
>> 		ip daddr 10.0.0.1 limit rate over 5 mbytes/second burst =
6000 kbytes drop
> 	           ~~~~~

