From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Flowtable with ppp/bridge
Date: Mon, 26 Apr 2021 20:08:05 +0200
Message-ID: <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de> <20210426172924.GA3178@salvia> <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de> <20210426175703.GA3590@salvia>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619460490;
        bh=ZT2QYRQbE7OoYFj4qhqa12VClEvy5m6B40ibqg/+1XQ=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=CSRNW+DJb7jMjFHiJzyav59Pa+/QjM8VrmzQTLHip66iimXekVN4vnSr+H7SaVdoK
         SSMUtvAVxH++9tDE9R/AUua1ZIxuhU6ExV7kstJ65D7AGlR4vqCxeTIHvcXTbj5xEF
         6KOsh+oYTOHQ7lFbHSQnuvo7HkgqHrIcI/AVTZRo=
In-Reply-To: <20210426175703.GA3590@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Am 26=2E April 2021 19:57:03 MESZ schrieb Pablo Neira Ayuso <pablo@netfilte=
r=2Eorg>:
>On Mon, Apr 26, 2021 at 07:51:11PM +0200, Frank Wunderlich wrote:
>> Hi Pablo,
>>=20
>> Is alex' guess right and i need to use physical interface instead of
>> the virtual one?
>
>Confusing, you reported an example that works:
>
>http://forum=2Ebanana-pi=2Eorg/t/new-netfilter-flow-table-based-hnat/1204=
9/30
>
>That was in March 2021=2E

That was a test without ppp/vlan/bridge on my test device (to make perform=
ance test and looking for bindings on simple setup)=2E Now i'm working on m=
y main router where i use pppoe to my isp which needs to be encapsulated in=
to a vlan (to separate from voip)=2E

>> In my case i have ppp connection over vlan on wan port=2E
>>=20
>> ppp8 =3D> wan=2E110 =3D> wan
>>=20
>> Lan side (bridge) may work,but for ppp it sounds wrong to me=2E
>
>Just add the 'wan' device to the flowtable, as you did back in March=2E

Ok, i try it=2E=2E=2EIf this works also for traffic routed to the ppp inte=
rface then it is ok=2E Forwarding is done from lanbr0 to ppp8 virtual inter=
faces not to physical interfaces directly like i've done on test in March

regards Frank
