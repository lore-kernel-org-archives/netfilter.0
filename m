From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: tc and priority
Date: Fri, 22 May 2009 21:05:17 +0300
Message-ID: <38db14850905221105l3e940df8y5eae3688f5a9028d@mail.gmail.com>
References: <4A142FF7.1050700@duet.it> <4A150D46.6090806@duet.it>
	 <38db14850905210414p41bba89exda7aacd88d905637@mail.gmail.com>
	 <4A15423C.5070208@duet.it>
	 <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>
	 <4A15572D.3000303@duet.it>
	 <38db14850905210722k7818822en4d9ceb072ad1c6b6@mail.gmail.com>
	 <4A156620.6050904@duet.it>
	 <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>
	 <4A16937B.8020405@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=pIIc5VS4v5N1rJw6lsdA1G4O16SxTgIzJJLy1YY24Lo=;
        b=wyL29TXH1HMZT5sTMASyGdeo4TxePuCCNRelBKd8jwE5xyvvJfHf0sI1TBVgBx/gUO
         i1cUuItVCg2pFAT1JsypSnv5dB6/fw/e+XcHdC6SyUBWKhyRVjKGZpdMqUqUoGl46gzq
         EVS4cU1sT/pPEQY+hEend4g70uLJbT5XBJ62Q=
In-Reply-To: <4A16937B.8020405@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

Hi Fabio,

2009/5/22 Fabio Marcone <fabio.marcone@duet.it>:
> Hi,
>>>
>>> That's warmer :)
>>> Try the next:
>>> tc filter add dev eth0 protocol ip parent 1: prio 1 u32 match ip
>>> protocol 6 0xFF ip sport 80 0xFFFF flowid 1:1
>>> tc filter add dev eth0 protocol ip parent 1: prio 2 u32 match ip
>>> protocol 6 0xFF ip sport 81 0xFFFF flowid 1:3
>>> tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match u8 0 0
>>> flowid 1:2
>>>
>>>
>
> I try to use use it but I get this error:
> What is "ip"?
> Usage: ...
>
> What's wrong?
>
> Very thanks,
> Fabio

Sorry, there was my error.
The correct version:
tc filter add dev eth0 protocol ip parent 1: prio 1 u32 classid 1:1
match ip protocol 6 0xFF match ip sport 80 0xFFFF
tc filter add dev eth0 protocol ip parent 1: prio 2 u32 classid 1:3
match ip protocol 6 0xFF ip sport 81 0xFFFF
tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match u8 0 0 flowid 1:2


-- 
Best regards
Anatoly Muliarski
