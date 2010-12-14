From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: UDP MSS
Date: Tue, 14 Dec 2010 19:10:23 +0530
Message-ID: <AANLkTikpqV2aHDGdm8GtYLdapupTdjFiH9nHZT6T9Rbf@mail.gmail.com>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
	<alpine.LNX.2.01.1012140500230.21495@obet.zrqbmnf.qr>
	<AANLkTi=c1eBB669nmXiTGOOUzrDQWLc3mvw2qWuw8_Cv@mail.gmail.com>
	<4D076157.7050508@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=YPRjOz1Vdh+P17t/n+hPnb1kjS2ZVz9u+Tcrw8lEziw=;
        b=I99bJmIVhPmJcTFpzft32ABztw9dRTaQjtwoVJCJQWFkyZ1pOL06myon8F7dqMFEoY
         Ak2JHHjmu0q5EPHcljEGqQanrbtOAQo/LbHYfNmEFz0ZkhDK6rqo+zPQwNEw/pGZ1mZ6
         zlNa/60RwltuRiqYpagI7PphMOmHv6G3ey+Z8=
In-Reply-To: <4D076157.7050508@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: John Haxby <john.haxby@oracle.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, Netfilter mailing list <netfilter@vger.kernel.org>

On Tue, Dec 14, 2010 at 5:51 PM, John Haxby <john.haxby@oracle.com> wro=
te:
> On 14/12/10 10:00, ratheesh k wrote:
>>
>> How udp determines maximum sustainable =A0MSS ?
>
> Unless I'm much mistaken, the concept doesn't apply. =A0UDP doesn't h=
ave an
> MSS and "maximum sustainable MSS" would imply a connection that isn't=
 there
> are well.
>
> jch
>
>

Coool .So udp fragmentation is done by ip layer.no mss.

-Ratheesh
