From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Flowtable with ppp/bridge
Date: Wed, 28 Apr 2021 19:26:14 +0200
Message-ID: <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de> <20210426172924.GA3178@salvia> <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de> <20210426175703.GA3590@salvia> <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de> <20210427234929.GA19570@salvia> <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619630779;
        bh=Ifr0K6QKL3MtNYexpgU9mFISZO+fTeIsR5pDruw+LXg=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=YUPoRI8r5jHoFjj1cA3HVeApceMtO7E1h34VED+wbkPVF+WEGxZN2vlC4+52Xdzhr
         WMNy7UB4tUghmnlfgCQuFEy17/oEEzocR6jf81jxQnh5V4DRTgKihh9ahC4tLFuM82
         mg32m/k0Pre4BmkACHZfyic/nN5dl+JvLoWjcGwU=
In-Reply-To: <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Tested again and found bnd-entry with correct src+dst ip=2E But i wonder ab=
out etype=3D0101, i expect 8100 here as top most ethertype should be 802=2E=
1q/vlan

Pppoe=3D>vlan=3D>dsa

00c22 BND IPv4 5T orig=3D192=2E168=2E0=2E21:33676->213=2E95=2E41=2E4:443 n=
ew=3D80=2E245=2E76=2E249:33676->213=2E95=2E41=2E4:443 eth=3D02:11:02:03:04:=
05->00:00:5e:00:01:02 etype=3D0101 vlan=3D140,0 ib1=3D214949a7 ib2=3D007ff0=
20

I looked in mtk_foe_entry_set_vlan and it seems ethertype is not set,have =
not found position where 0x101 gets set=2E=20

https://patchwork=2Eozlabs=2Eorg/project/netfilter-devel/patch/20210311003=
604=2E22199-22-pablo@netfilter=2Eorg/

As it is not ETH_P_PPP_SES=3D0x8864 and not ETH_P_IP=3D0x0800, i guess it =
is calculated in mtk_foe_entry_set_dsa

Am i on the right way?
regards Frank
