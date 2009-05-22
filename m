From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: tc and priority
Date: Fri, 22 May 2009 13:58:51 +0200
Message-ID: <4A16937B.8020405@duet.it>
References: <4A142FF7.1050700@duet.it>	 <38db14850905202353r3c494d15se7f53f4b508f1ba0@mail.gmail.com>	 <4A150D46.6090806@duet.it>	 <38db14850905210414p41bba89exda7aacd88d905637@mail.gmail.com>	 <4A15423C.5070208@duet.it>	 <38db14850905210607s11fd9126i4bce902a668dfc6@mail.gmail.com>	 <4A15572D.3000303@duet.it>	 <38db14850905210722k7818822en4d9ceb072ad1c6b6@mail.gmail.com>	 <4A156620.6050904@duet.it> <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <38db14850905211115h68364107vef2ff69c9dc1f0f2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Hi,
>> That's warmer :)
>> Try the next:
>> tc filter add dev eth0 protocol ip parent 1: prio 1 u32 match ip
>> protocol 6 0xFF ip sport 80 0xFFFF flowid 1:1
>> tc filter add dev eth0 protocol ip parent 1: prio 2 u32 match ip
>> protocol 6 0xFF ip sport 81 0xFFFF flowid 1:3
>> tc filter add dev eth0 protocol ip parent 1: prio 3 u32 match u8 0 0 flowid 1:2
>>
>>     
I try to use use it but I get this error:
What is "ip"?
Usage: ...

What's wrong?

Very thanks,
Fabio

