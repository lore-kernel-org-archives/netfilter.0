From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 20:10:09 +0100
Message-ID: <20210627201009.f0c024fbd3bc15c6482427de@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
        <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
        <20210627200752.694217a849963715fd782049@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        +El6t6zBniYk04tL9yt9PcSbtyX91aIusHddgDAzTT0=; b=J9tCVWj3oxacnfvj
        YQ4UFsvQT7Xf5wxt8NShvEN5DwiH38mf4dACMp90Nvz3EuE4AzXd1cAJcyIyMFOA
        zlc9+o2uM7i5yZuL/AMw1y07zD0h/faEB3qZDTvksy39YohsuhidNPwYUFG8UmsR
        Vs3N9tbUF8Xb1FtS/NOck34vWi2OMuBRt5chIlNoyT6lpDxzVJ+2rMESOM0Ik66m
        b+BVWN0idL3GvHWYkrObKbeyW2yWT/aAAxDenN7+08DDw3bqzUfkaTIzZfuNI8No
        gYH9kdaqhKhRMBHmFyXD0JUskdTUJKqGw2bMieCSNeQh5okiSOv8t/af0qVWsDkH
        lhJWXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=+El6t6zBniYk04tL9yt9PcSbtyX91aIusHddgDAzT
        T0=; b=jP/+1ETU4SlfsEmpnL6lgw3iKOQ6r3OcTz0U7b8sfxuTf7nh5bqR7sEAn
        wlC0sSQXIUFdxZ2/J/ouqbkumMA4HfeJnhLCAFvKLWcWINjeVTQXaiNly3b2Gw2w
        KSWNfn3O15odBWGC5bq2zEEeHqUddQSDCXfgHdhN0WVnIBfx7D1Mqbru2kkOvxRA
        yVEgCQWRaN6/SoVSAzBkz+OH7nEG/e+N5Kqm4CXhQflsdhT8RosGmNP4O7bvCTIa
        9+ysbrYPe1AB/eXYyuBSh9EcPbjnZz4vE1R/76fuB0Lxw5p1FcepiWlVCsa4T3HE
        m7Z91ITN/MnCzzOys6zMAxew2Qlqw==
In-Reply-To: <20210627200752.694217a849963715fd782049@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

On Sun, 27 Jun 2021 20:07:52 +0100
Kerin Millar <kfm@plushkava.net> wrote:

Self-correction follows ...

> On Sun, 27 Jun 2021 14:32:39 -0400
> slow_speed@att.net wrote:
>=20
> > Thank you for that very good explanation.
> >=20
> > As it turns out, I am learning two ways at once.=A0 One is my desktop=20
> > computer running Debian 10 which used nftables (and I believe=20
> > nftables-persistent is built-in to the nftables mechanism).=A0 The othe=
r=20
> > is a little Raspian server which is based on Debian 10, but does not us=
e=20
> > nftables.
> >=20
> > In the second case, one must reload iptables when changes are made to=20
> > it.=A0 If I correctly understand, one must use sudo iptables -F, follow=
ed=20
> > by sudo iptables-restore < /etc/iptables.up.rules (or wherever they=20
> > are).=A0 Doesn't it need the little left arrow/less-than sign?=A0 Does =
that=20
> > sound correct?
>=20
> Concerning wherever they may be, they would be at "/etc/iptables.rules.v4=
" in the event that you are using iptables-persistent.

Of course, I meant to write "/etc/iptables/rules.v4" here.

--=20
Kerin Millar
