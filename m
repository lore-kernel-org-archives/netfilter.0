From: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: Flowtable with ppp/bridge
Date: Wed, 28 Apr 2021 10:07:09 +0200
Message-ID: <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
References: <16CF72C8-335A-48D2-BA6F-FF632735DCFD@public-files.de> <20210426172924.GA3178@salvia> <8AA68E42-DE50-4591-BCF0-18A058FA93F8@public-files.de> <20210426175703.GA3590@salvia> <B1C290C8-8CF7-435B-88B0-29A09E4B0CA6@public-files.de> <20210427234929.GA19570@salvia>
Reply-To: frank-w@public-files.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1619597234;
        bh=hguFBAgB7MkRHh0WdsQhbJ1aJG36KXtbeuuGQquB9yM=;
        h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
         CC:From;
        b=dnLsXBSGtFAelBMHveXbmV2j2zMeQLSSv+V1IJ5pjWB93T4Q174zFl+OyQGDDkMNF
         Z0NrHdZ4yjMykMOYyHpu1Y8qVVmLGNenl3R8HUTcwZcV+QNcmNMAiOb/mIb14R1xv6
         8h9er9XL44qzckK6YRRSOWMMfFustXcsgP5OVKq0=
In-Reply-To: <20210427234929.GA19570@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi

Does it depend on any other recent changes?

I have backported v1 of the offload-series to 5=2E10 ([1] maybe i did any =
mistake there) to have lts kernel running while testing on main-router=2E

Direct lan-wan hnat works,forward to pppoe is broken (i can apply with wan=
/lan physical devices,but no traffic through ppp)=2Eon client i get connect=
ion-reset,pppoe session on router stays alive=2E

This is an entry from the mtk entries (mt7623):

01ac6 UNB IPv4 5T orig=3D192=2E168=2E0=2E21:52136->195=2E20=2E250=2E26:443=
 new=3D217=2E61=2E147=2Exx:57010->217=2E72=2E196=2E71:443 eth=3D02:11:02:03=
:04:05->00:00:5e:00:01:02 etype=3D0101 vlan=3D140,0 ib1=3D1000019d ib2=3D00=
7ff020

Vlan140 is correct (accidentally wrote 110 above)=2E Sourceip is correctly=
 changed from private to public=2E I wonder about etype and target ip=2E I =
think target ip should stay same and etype imho should be 88xx (vlan/pppoe-=
s)=2E

[1] https://github=2Ecom/frank-w/BPI-R2-4=2E14/commits/5=2E10-hnat
regards Frank
