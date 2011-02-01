From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Tue, 01 Feb 2011 13:01:30 +0100
Message-ID: <4D47F61A.3010702@freemail.hu>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com>	<alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr>	<AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com>	<alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr>	<AANLkTikxZf8zMJxRTGg6BS4uc0PDus+E6cEtfLDQRTQu@mail.gmail.com>	<4D46824B.2010706@netfilter.org> <AANLkTimLxY-sM28GHq_RYKyMzN-7n6VXaDJD7FLz4vv4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimLxY-sM28GHq_RYKyMzN-7n6VXaDJD7FLz4vv4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: JeHo Park <linuxpark@gmail.com>, netfilter list <netfilter@vger.kernel.org>

2011-02-01 02:50 keltez=C3=A9ssel, JeHo Park =C3=ADrta:
> hello Pablo
>
> i have two more questions

>> You should use the string match in the filter or raw tables.
>>
> and second,
> i think some people might also want such a functionality like what i
> want to do,
> redirection some connection to other server judging from its TCP
> contents infomation.
> [in this case, the URI  infomation of the HTTP transaction]
> i want to know how you think about ..
>
> previously thanks ~
=46irst of all: This question has been answered many times... Here on t=
he=20
list and you can find it in other online documentation.

Please understand that the nat table sees only the first packet of the=20
whole connection. This is by design. (There is no need for the judgemen=
t=20
of the nat table when we already know how to handle the connection...)

The string match is much like a toy and not a real help in the iptables=
=2E=20
(Sorry, I do not really "believe" in this match. But also I understand=20
the need for such match. Sometimes it can be very usefull.)  As already=
=20
mentioned before, the main problem is the fragmentation.

=46or your needs: please use a proxy. In your case iptables is not the=20
right tool.

Swifty

