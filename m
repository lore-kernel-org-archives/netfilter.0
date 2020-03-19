From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] flowtable - number of devices
 limited (7)?
Date: Thu, 19 Mar 2020 12:02:51 +0000
Message-ID: <16170a6c-4aaa-ae1e-4e7a-d5a772b211d3@gmx.net>
References: <dd0815e7-2cae-afa9-0c54-240687c75c06@gmx.net>
 <20200319113326.vfmsaqjtoxrus2d3@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584619379;
        bh=HNsB1CUMywFy7/+0RXVGiXnL9keUmNF+jCuWklnlJTI=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=GKF4bKOGoXMcKUeGSAMJ1ZYo1t56BZZyVVpYZVZnSuohfD135IHwvDPsxlYXAfsEg
         tksm4JkdU44JdO0Z5wR4baDIxpHhaA14MYara791J9tpbIBpPoklX7dsSm2gpMtz92
         Zj+tUzgakPEJJSmO+LPps3ogDvTI4TSIsO4LVEOM=
In-Reply-To: <20200319113326.vfmsaqjtoxrus2d3@salvia>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 19/03/2020 11:33, Pablo Neira Ayuso wrote:
> On Wed, Mar 18, 2020 at 12:37:28PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> When exceeding the number of devices > 7 NFT prints:
>>
>> Illegal instruction
>>
>> This does not print the error:
>>
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-lan }; }
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-guest }; }
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-mgt }; }
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan3, lan4, br-mgt, br-guest }; }
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan3, br-mgt, br-guest, br-mgt }; }
>>
>> But this prints the error:
>>
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-lan, br-mgt }; }
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-guest, br-lan }; }
>> flowtable ft =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 {=
 hook ingress priority 0; devices =3D {
>> pppoe-wan, lan0, lan1, lan2, lan3, lan4, br-mgt, br-guest }; }
> Linux kernel >=3D 5.5 removes this cap, from there on the maximum number
> of devices is 256.

Thanks for the feedback/info.

What I noticed too:

* wildcard device naming (e.g. lan*, br-*) does not work
* nft fails silently to start at boot time if a device stated in the
flowtable rule is not available at the time nft is invoked during boot
process, e.g. pppoe-wan (not uncommon for CPE routers)
