From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ssh overflow blacklisting not working properly
Date: Mon, 29 Mar 2010 13:05:41 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003291303410.16683@obet.zrqbmnf.qr>
References: <4BB0574A.2060106@infoservices.in> <56378e321003290118i2fd96c99l29f2590743e5fb36@mail.gmail.com> <4BB08644.1060009@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB08644.1060009@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org


On Monday 2010-03-29 12:51, J. Bakshi wrote:
>On 03/29/2010 01:48 PM, Richard Horton wrote:
>> On 29 March 2010 08:31, J. Bakshi <joydeep@infoservices.in> wrote:
>>   
>>> iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -m
>>> hashlimit \
>>> --hashlimit 3/min --hashlimit-burst 1 --hashlimit-htable-expire 180000 \
>>> --hashlimit-mode srcip --hashlimit-name sshlimit -j ACCEPT
>>>
>>> #----------------------------------------#
>>>
>>> As expected connection attempt more than 3 in a min is dropped and
>>> ensure only 3 connection per minute. But It should also block the source
>>> IP for 3 min and this part is not working here.

It should not block it, it's not part of the definition of the
S-TBF (or any other) limiter. You have to use -m recent as a list
to store entries once they have gone over their limit.
