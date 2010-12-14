From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 15:35:28 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012141534470.31658@obet.zrqbmnf.qr>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com> <alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr> <AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com> <4D076157.7050508@oracle.com> <AANLkTikpqV2aHDGdm8GtYLdapupTdjFiH9nHZT6T9Rbf@mail.gmail.com>
 <alpine.LNX.2.01.1012141444540.24260@obet.zrqbmnf.qr> <AANLkTi=DVeXDZDdj30qSuCurCVyq-Lf+mukAVA1yCgfx@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=DVeXDZDdj30qSuCurCVyq-Lf+mukAVA1yCgfx@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: John Haxby <john.haxby@oracle.com>, Netfilter mailing list <netfilter@vger.kernel.org>

On Tuesday 2010-12-14 15:18, ratheesh k wrote:

>On Tue, Dec 14, 2010 at 7:15 PM, Jan Engelhardt <jengelh@medozas.de> wrote:
>
>> Fragmentation is always done by the IP layer, even with
>> protocols like TCP.
>> You must mix up fragmentation and segmentation.
>
>Jan,
>
>  what will be normal size of udp  segments ?

Counterquestion because yours does not seem to make sense: what is a 
normal size for TCP?
