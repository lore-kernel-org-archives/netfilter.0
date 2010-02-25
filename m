From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: MASQUERADE and ACCEPT targets
Date: Thu, 25 Feb 2010 09:31:35 +0530
Message-ID: <cfeab66d1002242001m6f3d4367m171577b852d8a590@mail.gmail.com>
References: <cfeab66d1002240645i632227ccpbe8f3e55cebaf947@mail.gmail.com>
	 <4B853E69.9040402@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4PAqSfXIgETKeQicPvnSaNjsb00JkY/kedN/8aeW61k=;
        b=NH1nrBxKgNpHVLHsvMi08iH05DdjbMHnIogf1sFCiQ4MkYXiXJZ1SWx8WPOvKAAteb
         ZiFfkew4aF4rR6QyzEZ/z38DshbwsqIxyjjqB6IqjF5di4rRayGtK/GiV3G9DUFjC5gY
         EtjJ7rCCfaX3kyuMtGJxh3mHgkO4oIP/NY1jU=
In-Reply-To: <4B853E69.9040402@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: mart.frauenlob@chello.at

>>>>>>>>>>>> The nat table only sees state NEW packets.

my default policy for FORWARD chain is ACCEPT .i failed to describe my
question .Sorry for my bad english .



                                       machine "B"
                                    -----------------------------------=
-------
                                    |                                  =
      |
                                    |                                  =
      |
machine "A"   ------> eth0 |
                                    |
      eth1----------------------------------------> internet
                                    |                                  =
      |
                                    |                                  =
      |
                                    -----------------------------------=
-------



Suppose i browse "yahoo.com" from machine A. First sync packet is sent
from machine A to Gateway machine "B"
Packet state is NEW and masqueraded to eth1 . when a packet comes from
internet back , state of packet is set as ESTABLISHED . After the
state is truned to ESTABLISHED , do we really require MASQURADE rule
for next packets ?

without this MASQUERADE target also , will the connection continue to w=
ork ?

Thanks,
Ratheesh







On Wed, Feb 24, 2010 at 8:27 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 24.02.2010 15:45, netfilter-owner@vger.kernel.org wrote:
>> All ,
>>
>> =A0 =A0 =A0R1) =A0 iptables -t nat -I POSTROUTING -o eth0 -m state -=
-state
>> ESTABLISHED,RELATED -j ACCEPT
>> =A0 =A0 =A0R2) =A0 iptables -t nat -A POSTROUTING =A0 -o eth0 -j MAS=
QERADE
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 machine "B"
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0------------------------------------------
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>> machine "A" =A0 ------> eth0 |
>> |eth1----------------------------------------> internet
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0------------------------------------------
>>
>> =A0I applied rules R2 and i am able to browse internet from machine =
A .
>>
>> =A01. Is there any problem if i apply R1 ?
>> =A02. if packet state become ESTABLISHED ( not a new packet ) , do w=
e
>> need MASQERADE target for remaing packets ???
>>
>> Thanks,
>> Ratheesh
>
> The nat table only sees state NEW packets.
> A rule with state "ESTABLISHED,RELATED" will never match there.
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE is good (without
> the typo).
>
> Do filtering (ACCEPT/DROP/REJECT) in the filter table.
> iptables -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j A=
CCEPT
>
> same for OUTPUT maybe.
>
> Best regards
>
> Mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
