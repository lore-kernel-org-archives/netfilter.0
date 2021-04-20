From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: device list reversed
Date: Tue, 20 Apr 2021 13:47:16 +0200
Message-ID: <74A02E9E-AE0B-414F-9F3F-E3A016CE1966@public-files.de>
References: <trinity-199f77e0-dc05-45d9-85a6-3b583adcee10-1618146461717@3c-app-gmx-bap41> <20210420112804.GA26530@salvia>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618919240;
        bh=DThvsHp5/E1bPSgRE/MwQ3kiHHhRlWIYqpmJcxsMHn8=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=byOmMAj5Z9oE3fDM58XqBRkzbfML44tiQixwDeoQADBMMgNA7+m2iTscP3bjclvUF
         5MAYjMPXGrD29dOEpEHvHuWqgrNA/g7EK5i6p+JfnTj/yB6uEZOvmeyusAZzDtjnPn
         qqC6vYt7Bs4UIIOBb169dMA511UPcSYkvrk95S5s=
In-Reply-To: <20210420112804.GA26530@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Am 20=2E April 2021 13:28:04 MESZ schrieb Pablo Neira Ayuso <pablo@netfilte=
r=2Eorg>:
>On Sun, Apr 11, 2021 at 03:07:41PM +0200, Frank Wunderlich wrote:
>> Hi,
>>=20
>> i import ruleset by file with a devicelist (flowtable)
>>=20
>> devices =3D { wan, lan0, lan3 }
>>=20
>> and if i do a nft list ruleset, it gets reversed
>>=20
>> devices =3D { lan3, lan0, wan }

>Each device is represented as a hook, and hook are registered using
>list_add() IIRC, which is reversing the order=2E

Should list_add not append (instead of insert at 0) and if devices read fr=
om left to right it should not reverse?

>Probably just sort device names alphanumerically?

From=20user pov i expect the order i have used for importing=2E As far as i =
understand internally order does not matter,only if device is listed or not=
=2E Maybe reversing it (again) on printing? Maybe user wants wan first and =
lan-ports after it=2E

But as far as i've wrote=2E=2E=2Eit's cosmetic=2E=2E=2Ejust stumbled over =
it
Hi Pablo,
regards Frank
