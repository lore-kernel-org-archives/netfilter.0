From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: tc and priority
Date: Thu, 21 May 2009 21:15:56 +0300
Message-ID: <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>
References: <4A142FF7.1050700@duet.it>
	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>
	 <4A150D46.6090806@duet.it>
	 <38db14850905210414p41bba89exda7aacd88d905637@mail.gmail.com>
	 <4A15423C.5070208@duet.it>
	 <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>
	 <4A15572D.3000303@duet.it>
	 <38db14850905210722k7818822en4d9ceb072ad1c6b6@mail.gmail.com>
	 <4A156620.6050904@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=oMCP3DaQT0/vsS5Zvw26pOkFkTUd5DIIwWw/33RR+Ew=;
        b=OI7LMxJsfBPD279hmX0E6/+zg63wSAvSzaiDYyTgc18ilBqm+vp/ME7H8ls+UV/zKD
         2odp6Kp3uT9gXPCETAchw7PUMsYYvu0cxOG5WBoI0O6Sng6VxHx1XM1td4FaidbH5vRZ
         IA4OExQ3ij8oZXLCEL5Oj/NEhRxE6ySzEC4AA=
In-Reply-To: <4A156620.6050904@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

2009/5/21 Fabio Marcone <fabio.marcone@duet.it>:
>
>>
>> OK.
>> The starnge thing is: =A0match 00500000/ffff0000 at 20.
>> I suppose you try to match on dst_ip - there =A0must be 'at 16'!
>>
>
> what does it mean?
>
> this is my filter code:
> tc filter add dev eth0 protocol ip parent 1: prio 1 u32 match ip spor=
t 80
> 0xffff flowid 1:1
> tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match ip spor=
t 81
> 0xffff flowid 1:3
>
> and packets are queued in the right queue. If you prefer I can filter=
 using
> iptables mangle, I think it's the same.
>
>
> Fabio

That's warmer :)
Try the next:
tc filter add dev eth0 protocol ip parent 1: prio 1 u32 match ip
protocol 6 0xFF ip sport 80 0xFFFF flowid 1:1
tc filter add dev eth0 protocol ip parent 1: prio 2 u32 match ip
protocol 6 0xFF ip sport 81 0xFFFF flowid 1:3
tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match u8 0 0 fl=
owid 1:2

--=20
Best regards
Anatoly Muliarski
