From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 13:11:30 +0200
Message-ID: <4C5161E2.8020407@chello.at>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jengelh@medozas.de
Cc: netfilter@vger.kernel.org, "\"Dennis J.\" cc: netfilter@vger.kernel.org" <dennisml@conversis.de>, pablo@netfilter.org

On 28.07.2010 08:11, netfilter-owner@vger.kernel.org wrote:
>
> On Wednesday 2010-07-28 07:24, Mart Frauenlob wrote:
>> On 28.07.2010 00:50, dennisml@conversis.de wrote:
>>>
>>> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
>>> -m recent --name synflood --set
>>> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
>>> -m recent --name synflood --update --seconds 1 --hitcount 30 -j DROP
>
> Consider using -m conntrack --ctstate ...
>
Which in this case makes no difference but more typing.

>>> What I'm wondering about is the "--state NEW" part. If I re-enable
>>> connection tracking again for the above rules to work wouldn't these
>>> fill up again and basically make these rules useless? Or can I
>>> essentially remove the state module bits and just use the plain packets
>>> for this since the syn flag is only used in establishing a new
>>> connection anyway which makes the "--state NEW" bit not necessary?
>>
conntrack is not disabled only because you do not use a match.
once conntrack is loaded (module) it is active.
using --[c]state NEW -p tcp ! --syn -j DROP|REJECT sorts out all tcp 
connection attempts of state NEW (for ct) not starting with a syn packet.

>> afaik, the (according) ct entries are destroyed on DROP.
>
> They are not destroyed on DROP, and you can easily check that.

We're not talking about ASSURED/ESTABLISHED connections, do we?

> (And stop trimming Cc.)
There was no Cc to trim?!
What do you want me (not) to do?

> Dennis,
> The TCP ct starts out with something like a timeout of 2 minutes.
> Only if the connection reaches the ASSURED status (--ctstatus
> ASSURED), it will get bumped to the standard lifetime of 5 days.
> Dropping all packets in a connection is of course the way to inhibit
> this transition to ASSURED.
>
> There was once a proposal to add a --timeout option to the xt_CT target
> (proposed by Phil Oester IIRC), however did not show up in iptables yet.
> Adding Pablo to Cc to suggest a way to set the initial ct timeout.
> (Because 2 minutes still is enough to cause a reasonable fillup.)

So what's the deal?
Not assured, but deliberately dropped packets still linger around 2 
minutes in the ct table?
Don't think so.
Testing this, nothing shows up here for 2 minutes (using conntrack -L).

Best regards

Mart


