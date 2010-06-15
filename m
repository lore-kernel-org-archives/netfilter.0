From: Luis Daniel Lucio Quiroz <luis.daniel.lucio@gmail.com>
Subject: Re: [squid-users] Squid + Tproxy + Bridge on Kernel 2.6.34 - Workaround
Date: Tue, 15 Jun 2010 13:37:48 -0500
Message-ID: <201006151337.48731.luis.daniel.lucio@gmail.com>
References: <4BFCA1D3.3060505@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:organization:to:subject
         :date:user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=w259Q+ooKbNdoHjR2Q3XCycnWy2gWNE/1sHzDMC2Srs=;
        b=HIexokMkrCw2ve6jg5CeyiAJLMVH3uLMwqspAeXQSFonm5PgYUHOoOZXeHSdFL7kYP
         OVGh6qTCuU9k8Bq0Ig5sn8PiSA+kb5Ysfgq7Y567Yo+qY84blJfqXPtdwDc7yKKY4cNX
         eDL7uEt3z6Q4JbNhBSY+RKaiQwf7XzSpWMwRs=
In-Reply-To: <4BFCA1D3.3060505@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: squid-users@squid-cache.org
Cc: senthilkumaar2021 <senthilkumaar2021@gmail.com>, netfilter@vger.kernel.org

Le mardi 25 mai 2010 23:21:39, senthilkumaar2021 a =E9crit :
> Hi,
>=20
> Squid + Tproxy + Bridge Setup on latest kernel - version 2.6.34
>=20
> I had followed all the steps that had given in the
> http://wiki.squid-cache.org/Features/Tproxy4
>=20
> Kernel - 2.6.34
> iptable - 1.4.8
> ebtable - 2.0.9-1
>=20
> But clients were unable to browse and no errors in cache.log. Error -
> Network Unreachable. The error had returned by browser not squid prox=
y.
>=20
> Workaround :-
>=20
> After adding the following rules, clients are able to browse.
>=20
> # ip rule add dev <device name> fwmark 1 lookup 100
>=20
> example
>=20
> # ip rule add dev eth0 fwmark 1 lookup 100
>=20
> NOTE : Repeat the above for each interface except " lo "
>=20
> Source - https://lists.balabit.hu/pipermail/tproxy/2010-January/00121=
2.html
>=20
> Based on the above source this issue had identified on kernel version=
 -
> 2.6.32. But still not yet fixed.
>=20
> I have CC ed this mail to netfilter mailing lists also.
>=20
> Hope this helps
>=20
> Thanks,
> Senthil

I was about to  ask
if this is fixed in 2.6.33+

or shall i stay in 2.6.31.x
