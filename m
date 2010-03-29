From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: ssh overflow blacklisting not working properly
Date: Mon, 29 Mar 2010 16:52:30 +0530
Message-ID: <4BB08D76.9010006@infoservices.in>
References: <4BB0574A.2060106@infoservices.in> <56378e321003290118i2fd96c99l29f2590743e5fb36@mail.gmail.com> <4BB08644.1060009@infoservices.in> <alpine.LSU.2.01.1003291303410.16683@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1003291303410.16683@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

On 03/29/2010 04:35 PM, Jan Engelhardt wrote:
> On Monday 2010-03-29 12:51, J. Bakshi wrote:
>  =20
>> On 03/29/2010 01:48 PM, Richard Horton wrote:
>>    =20
>>> On 29 March 2010 08:31, J. Bakshi <joydeep@infoservices.in> wrote:
>>>  =20
>>>      =20
>>>> iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -m
>>>> hashlimit \
>>>> --hashlimit 3/min --hashlimit-burst 1 --hashlimit-htable-expire 18=
0000 \
>>>> --hashlimit-mode srcip --hashlimit-name sshlimit -j ACCEPT
>>>>
>>>> #----------------------------------------#
>>>>
>>>> As expected connection attempt more than 3 in a min is dropped and
>>>> ensure only 3 connection per minute. But It should also block the =
source
>>>> IP for 3 min and this part is not working here.
>>>>        =20
> It should not block it, it's not part of the definition of the
> S-TBF (or any other) limiter. You have to use -m recent as a list
> to store entries once they have gone over their limit.
>
>  =20


Could you kindly enlighten me in that direction with possibly little
examples.

thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

