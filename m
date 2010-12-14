From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 14:45:25 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012141444540.24260@obet.zrqbmnf.qr>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com> <alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr> <AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com> <4D076157.7050508@oracle.com>
 <AANLkTikpqV2aHDGdm8GtYLdapupTdjFiH9nHZT6T9Rbf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikpqV2aHDGdm8GtYLdapupTdjFiH9nHZT6T9Rbf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: John Haxby <john.haxby@oracle.com>, Netfilter mailing list <netfilter@vger.kernel.org>

On Tuesday 2010-12-14 14:40, ratheesh k wrote:

>On Tue, Dec 14, 2010 at 5:51 PM, John Haxby <john.haxby@oracle.com> wr=
ote:
>> On 14/12/10 10:00, ratheesh k wrote:
>>>
>>> How udp determines maximum sustainable =C2=A0MSS ?
>>
>> Unless I'm much mistaken, the concept doesn't apply. =C2=A0UDP doesn=
't have an
>> MSS and "maximum sustainable MSS" would imply a connection that isn'=
t there
>> are well.
>>
>> jch
>>
>>
>
>Coool .So udp fragmentation is done by ip layer.no mss.

=46ragmentation is always done by the IP layer, even with
protocols like TCP.
You must mix up fragmentation and segmentation.
