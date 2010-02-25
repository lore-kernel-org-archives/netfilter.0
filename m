From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: MASQUERADE and ACCEPT targets
Date: Thu, 25 Feb 2010 18:06:25 +0530
Message-ID: <cfeab66d1002250436l5342d102hbdbe15e57f56881d@mail.gmail.com>
References: <cfeab66d1002240645i632227ccpbe8f3e55cebaf947@mail.gmail.com>
	 <4B853E69.9040402@chello.at>
	 <cfeab66d1002242001m6f3d4367m171577b852d8a590@mail.gmail.com>
	 <4B8649E7.20401@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=D7S64sare4k+0CKHv9ldJ/jR9gH2WY9PDX+Fk4CAVUY=;
        b=q6vFuoDOJsr3bs1/d8QYe+fq7pBa5FoFidfKnboJMlRVmg77oaTDas9ygbBY8ccRFK
         LH5NdMRYbXyFFTrAmakf16w/wvjiXQ7vwO85l4FV382Go5bembp//nOPVznO0xcZwSdf
         Uskdhz5PaI5xifbci5sV3S0nmCdVrDYO86gog=
In-Reply-To: <4B8649E7.20401@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thanks a ton .


On Thu, Feb 25, 2010 at 3:29 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> On 25.02.2010 05:01, netfilter-owner@vger.kernel.org wrote:
>>>>>>>>>>>>>> The nat table only sees state NEW packets.
>>
>> my default policy for FORWARD chain is ACCEPT .i failed to describe =
my
>> question .Sorry for my bad english .
>>
>>
>>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0machine "B"
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ------------------------------------------
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0|
>> machine "A" =A0 ------> eth0 |
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 |
>> =A0 =A0 =A0 eth1----------------------------------------> internet
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0|
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ------------------------------------------
>>
>>
>>
>> Suppose i browse "yahoo.com" from machine A. First sync packet is se=
nt
>> from machine A to Gateway machine "B"
>> Packet state is NEW and masqueraded to eth1 . when a packet comes fr=
om
>> internet back , state of packet is set as ESTABLISHED . After the
>> state is truned to ESTABLISHED , do we really require MASQURADE rule
>> for next packets ?
>>
>> without this MASQUERADE target also , will the connection continue t=
o work ?
>>
>> Thanks,
>> Ratheesh
>>
>>
>>
>>
>>
>>
>>
>> On Wed, Feb 24, 2010 at 8:27 PM, Mart Frauenlob
>> <mart.frauenlob@chello.at> wrote:
>>> On 24.02.2010 15:45, netfilter-owner@vger.kernel.org wrote:
>>>> All ,
>>>>
>>>> =A0 =A0 =A0R1) =A0 iptables -t nat -I POSTROUTING -o eth0 -m state=
 --state
>>>> ESTABLISHED,RELATED -j ACCEPT
>>>> =A0 =A0 =A0R2) =A0 iptables -t nat -A POSTROUTING =A0 -o eth0 -j M=
ASQERADE
>>>>
>>>>
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 machine "B"
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0------------------------------------------
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>>>> machine "A" =A0 ------> eth0 |
>>>> |eth1----------------------------------------> internet
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0|
>>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0------------------------------------------
>>>>
>>>> =A0I applied rules R2 and i am able to browse internet from machin=
e A .
>>>>
>>>> =A01. Is there any problem if i apply R1 ?
>>>> =A02. if packet state become ESTABLISHED ( not a new packet ) , do=
 we
>>>> need MASQERADE target for remaing packets ???
>>>>
>>>> Thanks,
>>>> Ratheesh
>>>
>>> The nat table only sees state NEW packets.
>>> A rule with state "ESTABLISHED,RELATED" will never match there.
>>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE is good (witho=
ut
>>> the typo).
>>>
>>> Do filtering (ACCEPT/DROP/REJECT) in the filter table.
>>> iptables -A FORWARD -o eth0 -m state --state ESTABLISHED,RELATED -j=
 ACCEPT
>>>
>>> same for OUTPUT maybe.
>>>
>>> Best regards
>
> Do you read the reply?
> Did you understand it?
> Does not look so.
> Please go and learn netfilter basics. (netfilter.org,
> http://www.frozentux.net/iptables-tutorial/iptables-tutorial.html)
>
> A simple g00gle search will give you ~ 120.000 results about masquera=
ding:
> http://www.google.at/search?q=3Diptables+nat+masquerade&ie=3Dutf-8&oe=
=3Dutf-8&aq=3Dt&rls=3Dorg.mozilla:en-US:official&client=3Dfirefox-a
>
> P.S. why CC me if i explicitly set the reply addr. to netfilter@....?=
??
>
> Bye bye
>
> Mart
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
