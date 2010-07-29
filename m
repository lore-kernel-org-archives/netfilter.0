From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 13:31:19 +0200
Message-ID: <4C516687.6060602@chello.at>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org, netfilter@vger.kernel.org

On 29.07.2010 13:21, Jan Engelhardt wrote:
>
> On Thursday 2010-07-29 13:11, Mart Frauenlob wrote:
>> On 28.07.2010 08:11, netfilter-owner@vger.kernel.org wrote:
>>>
>>> On Wednesday 2010-07-28 07:24, Mart Frauenlob wrote:
>>>> On 28.07.2010 00:50, dennisml@conversis.de wrote:
>>>>>
>>>>> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
>>>>> -m recent --name synflood --set
>>>>> iptables -A INPUT -m state --state NEW -p tcp -m tcp --syn \
>>>>> -m recent --name synflood --update --seconds 1 --hitcount 30 -j DROP
>>>
>>> Consider using -m conntrack --ctstate ...
>>
>> Which in this case makes no difference but more typing.
>
> Oh we'll all die of earlier arthritis now...
>
FU

>>>>> What I'm wondering about is the "--state NEW" part. If I re-enable
>>>>> connection tracking again for the above rules to work wouldn't these
>>>>> fill up again and basically make these rules useless? Or can I
>>>>> essentially remove the state module bits and just use the plain packets
>>>>> for this since the syn flag is only used in establishing a new
>>>>> connection anyway which makes the "--state NEW" bit not necessary?
>>
>> conntrack is not disabled only because you do not use a match.
>> once conntrack is loaded (module) it is active.
>
> And can be disabled again by -j CT --notrack.
>
>>>> afaik, the (according) ct entries are destroyed on DROP.
>>>
>>> They are not destroyed on DROP, and you can easily check that.
>>
>> We're not talking about ASSURED/ESTABLISHED connections, do we?
>
> It does not matter what state a ct is in; DROP won't destroy a ct (see
> below).
>
>>> Dennis,
>>> The TCP ct starts out with something like a timeout of 2 minutes.
>>> Only if the connection reaches the ASSURED status (--ctstatus
>>> ASSURED), it will get bumped to the standard lifetime of 5 days.
>>> Dropping all packets in a connection is of course the way to inhibit
>>> this transition to ASSURED.
>>>
>>> There was once a proposal to add a --timeout option to the xt_CT target
>>> (proposed by Phil Oester IIRC), however did not show up in iptables yet.
>>> Adding Pablo to Cc to suggest a way to set the initial ct timeout.
>>> (Because 2 minutes still is enough to cause a reasonable fillup.)
>>
>> So what's the deal?
>> Not assured, but deliberately dropped packets still linger around 2 minutes in
>> the ct table?
>> Don't think so.
>> Testing this, nothing shows up here for 2 minutes (using conntrack -L).
>
> Perhaps you've forgot something?
>
> # iptables -I INPUT -p tcp --dport 23 -j DROP
> # conntrack -E&   telnet localhost 23
> [1] 6949
> Trying ::1...
> telnet: connect to address ::1: Connection refused
refused? on DROP?
my nc does show a timeout.

> Trying 127.0.0.1...
>      [NEW] tcp      6 120 SYN_SENT src=127.0.0.1 dst=127.0.0.1 sport=59734 dport=23 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=23 dport=59734
>
> ...seconds later...
> # conntrack -L | grep =23
> conntrack v0.9.14 (conntrack-tools): 12 flow entries have been shown.
> tcp      6 97 SYN_SENT src=127.0.0.1 dst=127.0.0.1 sport=59734 dport=23 packets=1 bytes=60 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=23 dport=59734 packets=0 bytes=0 mark=0 secmark=0 use=2
>
> 2 minutes it is.
>
oh, well exactly what I did.
maybe my conntrack tools version is too old.
I don't care atm.
Software is full of bugs.
Anyway /me out of this l33t list.

thanks a bunch for nothing.


Mart
