From: slow_speed@att.net
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 16:57:19 -0400
Message-ID: <d03acc84-93b2-c901-d897-f93748c5babd@att.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
 <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
 <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
 <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
 <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
 <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
 <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
 <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
 <bc2e17dc-76ad-cc86-733b-32700b5adc07@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624827446; bh=7JnYZa+xh/Y9rjfvk0VxNJlrSx5v3PsI9+Xm4bgVr08=; h=Subject:To:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=E5MQm61uN8g9GsPTfExEyt0NcpJYvHhS2XYz1+bxpg+ztC5zv5vrzxJZLgY921Lz4TJ8CAz5YL1LYP/DTuZ8aqeE3/yP+wEWLSvvl7p7uw3fY6jEYrivB6I+oYLPg8U0p3THdTyQa5i6XfvhE189ieNMWjf6X1Ck7dZpcsPsqFg=
In-Reply-To: <bc2e17dc-76ad-cc86-733b-32700b5adc07@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org


On 6/27/21 2:57 PM, Reindl Harald wrote:
>
> it's very distribution specific and that's why this is likely the=20
> wrong mailing list
Yes, I understand the distribution issue; I was just pointing that out.=C2=
=A0=20
However, netfilter@vger.kernel.org appears to be the end-all and be-all=20
of netfilter issues.=C2=A0 Thus, one should address this list.

Further, we should not learn just for one distro.=C2=A0 That would be a h=
uge=20
mistake.

> why do you think you need a manual flush?=20

Because I do not have the experience regarding the internal workings of=20
iptables/nftables in this regard.

It is very simply; does one need to flush before reloading or not?


