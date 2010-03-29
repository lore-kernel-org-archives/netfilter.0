From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: ssh overflow blacklisting not working properly
Date: Mon, 29 Mar 2010 16:21:48 +0530
Message-ID: <4BB08644.1060009@infoservices.in>
References: <4BB0574A.2060106@infoservices.in> <56378e321003290118i2fd96c99l29f2590743e5fb36@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e321003290118i2fd96c99l29f2590743e5fb36@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

On 03/29/2010 01:48 PM, Richard Horton wrote:
> On 29 March 2010 08:31, J. Bakshi <joydeep@infoservices.in> wrote:
>  =20
>> iptables -A INPUT -p tcp -m state --state NEW --dport $SSH_PORT -m
>> hashlimit \
>> --hashlimit 3/min --hashlimit-burst 1 --hashlimit-htable-expire 1800=
00 \
>> --hashlimit-mode srcip --hashlimit-name sshlimit -j ACCEPT
>>
>> #----------------------------------------#
>>
>> As expected connection attempt more than 3 in a min is dropped and
>> ensure only 3 connection per minute. But It should also block the so=
urce
>> IP for 3 min and this part is not working here. Could any one kindly
>> suggest any clue or reason behind this ?
>>    =20
>
> Unless you have other rules floating around all the rule does is allo=
w
> upto 3 connections per minute to ssh based on source-ip. It won't
> block other connections from that source ip, just the ssh ones which
> exceed your defined limit (3/min).
>
> I'd guess from your comments there are additional rules, without
> seeing them though very hard to work out what is wrong as all I can
> say is that rule does its job... blocking ssh > 3 connection attempts
> per min per soucre ip.
>
>  =20

Thanks for your attention. Yes, I have already mentioned that it does
the overflow restriction i.e. 3 connection/per min/per src ip

But additionally it should block that ip for 3 min as

```````````
--hashlimit-htable-expire 180000

```````````

Unfortunately it is not doing that.


--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

