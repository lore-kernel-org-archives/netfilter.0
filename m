From: John Haxby <john.haxby@oracle.com>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 12:21:43 +0000
Message-ID: <4D076157.7050508@oracle.com>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>	<alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr> <AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, Netfilter mailing list <netfilter@vger.kernel.org>

On 14/12/10 10:00, ratheesh k wrote:
> How udp determines maximum sustainable  MSS ?

Unless I'm much mistaken, the concept doesn't apply.  UDP doesn't have 
an MSS and "maximum sustainable MSS" would imply a connection that isn't 
there are well.

jch

