From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables PREROUTING -drop
Date: Thu, 5 Aug 2010 13:11:43 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008051303550.30611@obet.zrqbmnf.qr>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com> <alpine.LSU.2.01.1008041343200.32671@obet.zrqbmnf.qr> <AANLkTim_=pmLER7v=rePa=ikP2Fv0bKJkN4aafNXUTNo@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTim_=pmLER7v=rePa=ikP2Fv0bKJkN4aafNXUTNo@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>

On Thursday 2010-08-05 12:42, ratheesh k wrote:
>>>
>>>What will happen, =C2=A0if we drop a packet at PREROUTING chain =C2=A0=
of ebtables ?
>>
>> Depends on the table you are referring to.
>
>What is the difference between  droppin a Pkt in Brouting chain of
>Broute table and  Drop a Pkt in  nat prerouing chain of ebtables . Or
>are they having same effect ? .

Generally, nat and broute are intended to be a configuration databases=20
only, where special semantics to standard verdicts can apply, as it doe=
s=20
for broute. To avoid confusion, the use of DROP in nat is not=20
advised, and iptables checks for such attempts. Ebtables doesn't, but=20
then again, it's the 4th-order-stepson of iptables only...
deep down below in source code, DROP just does that - drop.
