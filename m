From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Synflood filtering and Conntrack
Date: Wed, 28 Jul 2010 08:11:12 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C4FBF16.50203@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "Dennis J." <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org, Mart Frauenlob <mart.frauenlob@chello.at>, pablo@netfilter.org


On Wednesday 2010-07-28 07:24, Mart Frauenlob wrote:
> On 28.07.2010 00:50, dennisml@conversis.de wrote:
>>
>> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
>> -m recent --name synflood --set
>> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
>> -m recent --name synflood --update --seconds 1 --hitcount 30 -j DROP

Consider using -m conntrack --ctstate ...

>> What I'm wondering about is the "--state NEW" part. If I re-enable
>> connection tracking again for the above rules to work wouldn't these
>> fill up again and basically make these rules useless? Or can I
>> essentially remove the state module bits and just use the plain pack=
ets
>> for this since the syn flag is only used in establishing a new
>> connection anyway which makes the "--state NEW" bit not necessary?
>
> afaik, the (according) ct entries are destroyed on DROP.

They are not destroyed on DROP, and you can easily check that.
(And stop trimming Cc.)


Dennis,
The TCP ct starts out with something like a timeout of 2=C2=A0minutes.
Only if the connection reaches the ASSURED status (--ctstatus
ASSURED), it will get bumped to the standard lifetime of 5=C2=A0days.
Dropping all packets in a connection is of course the way to inhibit
this transition to ASSURED.

There was once a proposal to add a --timeout option to the xt_CT target=
=20
(proposed by Phil Oester IIRC), however did not show up in iptables yet=
=2E=20
Adding Pablo to Cc to suggest a way to set the initial ct timeout.=20
(Because 2 minutes still is enough to cause a reasonable fillup.)
