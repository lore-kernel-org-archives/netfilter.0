From: fuzzy_4711 <fuzzy_4711@gmx.de>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 13:40:12 +0200
Message-ID: <4E50EE9C.6000603@gmx.de>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com> <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com>
Reply-To: fuzzy_4711@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJ1a920zedy041MoUtYfbDCjMtzcg86Xd-i7ugP2zwDmGg7gXQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>, Netfilter <netfilter@vger.kernel.org>



-------- Original - Text --------

> subnet 192.168.0.0 netmask 255.255.255.0 {
>>    option routers 192.168.0.1;
>>    option domain-name "onix";
>>    range 192.168.0.2 192.168.0.10;
>>    option domain-name-servers 201.10.120.2, 201.10.128.2;
>>    option broadcast-address 192.168.0.1;
>>    option ip-forwarding on;
>> }

You are using IP 192.168.0.1 for 2 purposes:
a) router
b) broadcast

-fuz

