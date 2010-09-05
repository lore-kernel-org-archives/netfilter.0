From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: a single rule that mach source ip or destination ip
Date: Sun, 5 Sep 2010 17:54:19 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009051747240.9116@obet.zrqbmnf.qr>
References: <AANLkTimXBDQhkkC4UxS5N3semU6V9v46vNfqpPC2cTTZ@mail.gmail.com> <alpine.LNX.2.01.1009051110090.29132@obet.zrqbmnf.qr> <4C83A7CA.4060508@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C83A7CA.4060508@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>, netfilter@vger.kernel.org

>> 
>>> all is it possible to write a single rule that match source IP or
>>> destination IP.
>> 
>> It is possible.
>
>With the "u32" match, I suppose ?

Ah the language. A linguistic or/and is not the same as a logical 
OR/AND. Parenthesis are required in doubt.

It is possible to write a single rule that matches either src _or_ dst, 
_or_ both src addr and dst. Confusion complete!

u32 does not change that fact. Since rules themselves are ORed so to 
speak, there is few reason to do the same between matches (short of 
deeper match logic).
It is called disjunctive normal form.
