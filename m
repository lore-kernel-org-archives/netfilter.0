From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Reject non-ipsec traffic
Date: Wed, 20 Jul 2011 22:30:33 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com> <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr> <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Ryan Whelan <rcwhelan@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-07-20 22:13, Ryan Whelan wrote:
>On Wed, Jul 20, 2011 at 3:56 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
>> On Wednesday 2011-07-20 21:20, Ryan Whelan wrote:
>>
>>>I have IPSec setup between 2 hosts and would like to stop all
>>>inter-host traffic thats not secured with IPSec (They have a GRE
>>>tunnel between them, and I want to be sure the GRE traffic fails to
>>>transmit if the IPSec daemon fails)
>>>
>>>iptables -A OUTPUT -p udp --dport 500 -d hostB.example.com -j ACCEPT
>>>iptables -A OUTPUT -p tcp --dport 500 -d hostB.example.com -j ACCEPT
>>>iptables -A OUTPUT -p esp -d hostB.example.com -j ACCEPT
>>>iptables -A OUTPUT -d hostB.example.com -j REJECT
>>>
>>>The reject rule is rejecting all traffic to that host[...]
>>>If i remove that rule, everything works and i
>>>see the packets get counted on the ESP protocol rule.=C2=A0 I though=
t the
>>>rules were processes in order until a match was found. Clearly I'm
>>>wrong.
>>
>> They are indeed processed in order, and until a match is found --
>> and match _was_ found (packet which has dst=3DhostB, which is not
>> ESP, and which does not have tcpudp-500 in its headers).
>>
>> A `ping hostB` would match the criteria of this 4th rules, as would
>> opening http://hostB.example.com in a browser, for example.
>
>but if i remove that the last rule, the 3 rule starts counting matches
>(the ESP protocol rule).

Sure, because once you are not dropping the original packet in rule
4, it has a chance to get encrypted, show up as ESP, and match rule
3.
