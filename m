From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>
Subject: Re: Theoretical question: need for filter table in the POSTROUTING
 chain
Date: Fri, 26 Aug 2011 11:13:15 +0200
Message-ID: <4E5763AB.10106@freemail.hu>
References: <4E5634C3.80908@freemail.hu> <4E56617E.4040704@riverviewtech.net> <4E566A88.2040309@freemail.hu> <alpine.LNX.2.01.1108260954570.6835@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1108260954570.6835@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter list <netfilter@vger.kernel.org>

Hi,

2011-08-26 09:56 keltez=C3=A9ssel, Jan Engelhardt =C3=ADrta:
>>
>>> How about putting a reject route in the kernel routing table?
>> Yeah.. that is an alternative...
>> But:
>> - I want to REJECT any tcp sessions with tcp-reset,
>> - and any other protocoll with icmp-admin-prohibited.
>> - I would like to do it in iptables/netfilter.
>>
>> The main question is: Why do not we have such a table in the POSTROU=
TING chain?
> If they did not go through nat, the packet's computed state was most
> likely INVALID or UNTRACKED to begin with. And that you can already
> filter for in FORWARD.
I do not get it...
If a packet comes from the network then it is either goes to FORWARD or=
=20
to INPUT...  (You can forget INPUT for now.) And there we have nat...
If a packet comes from the local computer then it leaves out on the=20
OUTPUT chain... And there we have nat again...
So every packet should be tracked at the POSTROUTING chain...

Yes, I can filter at the FORWARD and the OUTPUT chain... But why can't =
I=20
at the POSTROUTING???
I do not seek alternatives... (I found them... :D) I want to know why i=
t=20
is not "enabled" ???

Thanx

Swifty
