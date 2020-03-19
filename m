From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables 0.9.2 | kernel 4.19.93] flowtable throws error on
 deployment (not on check however)
Date: Thu, 19 Mar 2020 12:27:47 +0000
Message-ID: <0f897dc7-b77c-838c-576a-bea2d06cfabf@gmx.net>
References: <513b3942-8b97-bb22-c608-6076c932c4f7@gmx.net>
 <20200319113858.vuy7fgtbwsqovnmx@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1584620876;
        bh=Z7LCtdnDop7RW2ZUuMvT1YK5rVX6Qv4R0via30oXcJw=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:References:From:Date:
         In-Reply-To;
        b=P5n9cww2iclyCD2puE6Mes3Ph9/jZAbN7RluCAXMVNjv6QBi+UahwC14SJD/Kubtz
         MGnt22dPLV4bzW7iuft+ryg5R04DgKojzhFtlCh112tGyvPY5wRB9nXFyo5bEd/+5O
         DkAUrz7UIhYHYyrE7kFMxocLSrEyHfoyWvhEZUqs=
In-Reply-To: <20200319113858.vuy7fgtbwsqovnmx@salvia>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 19/03/2020 11:38, Pablo Neira Ayuso wrote:
> On Wed, Mar 18, 2020 at 04:46:08PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> Trying to get flowtables to work but hitting a bit of a snag. Whilst nf=
t
>> -cf /path/to/conf (strangely) does not produce any error on deployment
>> nft -f /path/to/conf it throws this error however:
>>
>> Error: Could not process rule: Not supported
>> ip protocol tcp flow offload @ft
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> table inet filter {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flowtable f {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 hook ingress priority filter
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 devices =3D { pppoe-wan, lan0, lan1, lan2, lan3, lan=
4,
>> br-lan }
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook input priority filter; policy drop;
> You can only use the flowtable to accelerate the forwarding path.
> Please, define use the forward hook, ie.
>
>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain forward {
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 type filter hook forward priority filter; policy dro=
p;

Thanks for the pointer, got it working now. Had the forward hook defined
but misread the wiki article and placed the > flow offload @ft < rule
erroneously in the ingress path. Now in the forwarding path it is working.


