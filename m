From: "John Lister" <john.lister@kickstone.com>
Subject: Re: Checking line status
Date: Wed, 2 Sep 2009 12:21:38 +0100
Message-ID: <651A8A44F51C4F56859EE3C4E9D7B84B@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com> <4A9E4796.2040202@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=response"
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

> I have written a target for this:  www.glsys.eu/iface

Thanks for your reply, I'm not sure this would help me in my situation =
for 2=20
reasons:

=46irstly doesn't it just report on the state of the interface, I need =
to know=20
if any intermediary router/line is down after the interface, this is wh=
y i=20
was using ping to check known remote sites.
Secondly my rules are fairly complex and trying to design in dynamic ch=
ecks=20
in the ruleset is probably too complicated. For example i have 4 lines =
at=20
the minute which are load balanced, i would need to repeat the rules 15=
=20
times to cover all combinations of lines up/down. It seems simpler to=20
generate a new ruleset based on the active lines when a change is detec=
ted.

any other ideas gratefully received

> Swifty
>
> John Lister =EDrta:
>> Hi, I have a multihomed machine to which i'd like to check the statu=
s of=20
>> each line periodically. I want to do this so that I can modify the=20
>> iptables rules and send new connections out over the active lines an=
d=20
>> restore service when the line comes back up.
>>
>> I thought I could use ping with the -I option, but that doesn't seem=
 to=20
>> work, it always uses the default route. However if I get rid of the=20
>> default route and modify the rules to match the packets I get a "net=
work=20
>> unreachable" message without it ever hitting iptables. For example a=
dding=20
>> something like this never gets matched for the ping.
>>
>> iptables -t mangle -I OUTPUT -j LOG --log-prefix "output: "
>>
>> Normally ping results in ICMP messages being traversed, but not this=
=20
>> time.
>>
>> Could someone explain what is going on and I'd be grateful if there =
were=20
>> any suggestions on other ways to detect if a line is down - simply=20
>> looking in /proc/net/dev or similar wouldn't help as the local conne=
ction=20
>> is likely to be up, but the physical line to the ISP may be down.

Thanks

John=20

