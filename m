From: "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
Subject: Re: cannot use != with ct status
Date: Wed, 14 Oct 2020 23:29:27 +0000
Message-ID: <CY4PR1001MB2311F902F3F9E05F3F9397E4E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>
References: <CY4PR1001MB23116E94084D4CC5610C79C2E8050@CY4PR1001MB2311.namprd10.prod.outlook.com>,<20201014100402.GA19556@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NorbaKAWnVnFtvQrXwTbVzKzT5jOMMutbNi2N2lhWcw=;
 b=guLwNGHrkbQF0mqionDOVmwCf8SfuOQFToJUQX33GlPnd6S9Ti+jFTCCx2Ytc6+RQrmmfGFBohp+/Vdeh2Q/G3TBjjkwCYjEZLAfcwe3gAzPOL0st1Af26EMu00Bm1HS4BEK7wMvXH20FgqjcmN60Rt6IzLHFS/vnk4hMuFZtAM=
In-Reply-To: <20201014100402.GA19556@salvia>
Content-Language: en-AU
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Pablo,=0A=
=0A=
> ct status =3D=3D dnat and ct state !=3D dnat checks for _exact_ matching.=
=0A=
=0A=
But if ct status !=3D dnat is an exact equality check... why did it return =
true for all of the possible values?=0A=
=0A=
> Then:=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 ct status dnat=0A=
> =0A=
> based on the datatype, provides a shortcut for=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 ct status and dnat =3D=3D dnat=0A=
> =0A=
> For inverted matching, please use:=0A=
> =0A=
> =A0=A0=A0=A0=A0=A0=A0 ct status and dnat !=3D dnat=0A=
=0A=
Aha! I had a suspicion something like this might be possible but I couldn't=
 figure out how to make it work. Maybe the documentation* for ct status sho=
uld include examples like this?=0A=
=0A=
Here's what I did...=0A=
=0A=
        nft add rule inet PerIfRouteTable PerIfRoute_Forward \( ct status \=
& dnat \) !=3D dnat ct mark !=3D 0 ct mark set 0=0A=
=0A=
And how it got reported back to me...=0A=
=0A=
        ct status & dnat !=3D dnat ct mark !=3D 0x00000000 ct mark set 0x00=
000000=0A=
=0A=
It works as expected :)=0A=
=0A=
=0A=
* I'm not sure where all the documentation is, but I found this page and it=
 only suggested no-op, !=3D and {} matching.=0A=
=0A=
https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_=
in_10_minutes#Ct=0A=
=0A=
I did a bit of experimentation... I failed to make =3D=3D and !=3D do anyth=
ing useful, at least with ct status (but nftables does not expose all of th=
e underlying bitmask values, so maybe that's why?). It more or less seems l=
ike this to me...=0A=
=0A=
        ct status =3D=3D value # never matches=0A=
        ct status !=3D value # always matches=0A=
=0A=
But I was able to observe these things working:=0A=
=0A=
        ( ct status & token ) =3D=3D token # true if the token bit is set=
=0A=
        ct status and token =3D=3D token # shell-friendly alternative=0A=
        ct status token # convenient alternative=0A=
=0A=
        ( ct status & token ) !=3D token # true if the token bit is not set=
=0A=
        ct status and token !=3D token # shell-friendly alternative=0A=
=0A=
        ct status {token1,token2} # true if either token bit is set=0A=
        ct status token1,token2 # shell-friendly alternative=0A=
=0A=
        ct status token1 ct status token2 # true if both token bits are set=
=0A=
=0A=
=0A=
Lincoln=
