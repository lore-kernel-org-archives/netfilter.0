From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: ebtables PREROUTING -drop
Date: Thu, 5 Aug 2010 16:12:48 +0530
Message-ID: <AANLkTim_=pmLER7v=rePa=ikP2Fv0bKJkN4aafNXUTNo@mail.gmail.com>
References: <AANLkTikUczLiyxy3A5eVv7bg1XWhH-ggN1yUv2-EwLYM@mail.gmail.com>
	<alpine.LSU.2.01.1008041343200.32671@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=it51lsuoy+1n8NUntLYIfPe4siNguVJ/OddJqYJhv+s=;
        b=Rq6YyW2JXijWn2zzC2Y+Kkn4hGQgOQHlUofLa7EqQcwLmYZwCeakn45GkkjaRVOix/
         KwjMBlWVT52HT/WQ9kXLP7y2PWoxJcFcW3/WBg2yy6R3GKZtSgkHje/ReDpTroXIJ++Z
         xinveFFfV8PHSoe2x7tU52TirWVTN+yurRM6I=
In-Reply-To: <alpine.LSU.2.01.1008041343200.32671@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: bridge@lists.linux-foundation.org, Netfilter mailing list <netfilter@vger.kernel.org>

On Wed, Aug 4, 2010 at 5:13 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> On Wednesday 2010-08-04 13:05, ratheesh k wrote:
>
>>I =A0googled and =A0understood that "If we =A0DROP a packet at BROUTE=
R chain
>>, it will be passed to upper layer =A0and netfilter subsystem will
>>process those packets .
>>
>>What will happen, =A0if we drop a packet at PREROUTING chain =A0of eb=
tables ?
>
> Depends on the table you are referring to.
>

Ok .
Could you please answer below question . i got little confused here .
This answer may solve some confusion .

What is the difference between  droppin a Pkt in Brouting chain of
Broute table and  Drop a Pkt in  nat prerouing chain of ebtables . Or
are they having same effect ? .
