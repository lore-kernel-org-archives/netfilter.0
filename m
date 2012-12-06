From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Thu, 6 Dec 2012 06:18:27 +0200
Message-ID: <CA+4D1sdBSzM6QKH1xrgXsG3SS1Quu63omvJtGPDyt1b1gDgiiA@mail.gmail.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com>
	<3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk>
	<50B84725.3080608@nottheoilrig.com>
	<50B851E8.8070107@ngtech.co.il>
	<50BC6639.3090502@nottheoilrig.com>
	<50BC9297.3050507@ngtech.co.il>
	<50BCB80F.4090208@nottheoilrig.com>
	<CA+4D1sfikOc6BqVpGNxyYUOv-CA9j0ofSf-QJ_Fvz+JSw=SH3w@mail.gmail.com>
	<50BF1011.1050709@ngtech.co.il>
	<50BF5786.3050208@nottheoilrig.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=sTyvCJKCytIoUGvi5UNVhUd1ZWPpdCbi4vDQVHoqkyo=;
        b=KT+fIVkX95R5ZD5oOpqFOLxPEguzw1mJSiUToBG14M1MKPBO8VsFLlrApXDRaTtyOK
         cmuITRNYmE/KbiJ+xY1lXLMzgg00T55d5A8RwM2r1y0YafddokubE0BWfotHS9tDhyaM
         ZVLMSe6RkqBGvfoF1EUdWV31xd+lXY8UcXnOccHiDaytt72sDg4xdm6xBAQ2m/WDb/l6
         llvBDbr2VJOMHB/N9zO8GR9wVhLdTaanbE8jRdFVefc/C9sWNWr/LHXYf8uyq4d/au1+
         cBbr21fiNnbSM1aHGJ/o1+wW8wUBdBOz3QiSGhlQd1XiodvGNKvQGPKKZkxY5xK9mBFr
         r41g==
In-Reply-To: <50BF5786.3050208@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org

IMHO, there is a bit of mess in your scheme.
Let's clarify it :)

If my assumptions are right then:
1. eth0.2 is the external shaper interface.
2. ifb0 is using for shaping incoming traffic on this interface.

To set marks for the traffic you should use something like these:

iptables -t manlge -N NEW_CONN
iptables -t mangle -A NEW_CONN -m tos --tos 12 -j MARK --set-mark 1
iptables -t mangle -A NEW_CONN -m tos --tos 28 -j MARK --set-mark 2
# to mark all the unmatched traffic and treat it separately in your shaper
iptables -t mangle -A NEW_CONN -m mark --mark 0  -j MARK --set-mark 3
iptables -t mangle -A NEW_CONN  -j CONNMARK --save-mark

iptables -t mangle -A PREROUTING -m conntrack --cstate INVALID -j DROP
iptables -t mangle -A PREROUTING -m conntrack --cstate ESTABLISHED -j
CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m conntrack --cstate NEW,RELATED -g NEW_CONN


2012/12/5, Jack Bates <uo4zau@nottheoilrig.com>:
> Thanks for this help, I think the marks are getting saved/restored
> successfully, and I can successfully classify request traffic from the
> proxy server based on the mark (statistics on the eth0.2 classes are
> incrementing) but response traffic from the origin server isn't getting
> classified yet (statistics on the ifb0 classes remain zero).
>
> Here is my complete work in progress script. How can I investigate why
> response traffic isn't getting classified? Are there any more details
> that would help explain why not?
>
> How can I classify traffic based on the restored mark? or is there
> another way to classify response traffic from the origin server based on
> the TOS/DSCP field of the request?
>
>     1: # Save/restore connection mark based on TOS field
>     2: iptables -A PREROUTING -t mangle -j CONNMARK --restore-mark
>     3: iptables -A PREROUTING -t mangle -m tos --tos 12 -j MARK --set-mark
> 1
>     4: iptables -A PREROUTING -t mangle -m tos --tos 28 -j MARK --set-mark
> 2
>     5: iptables -A PREROUTING -t mangle -j CONNMARK --save-mark
>     6:
>     7: ifconfig ifb0 up
>     8:
>     9: insmod sch_ingress
>    10: tc qdisc add dev eth0.2 ingress
>    11:
>    12: # Classify response traffic from origin server based on restored
> mark
>    13: insmod cls_fw
>    14: insmod act_mirred
>    15: tc filter add dev eth0.2 parent ffff: protocol ip pref 1 handle 1
> fw flowid 2:1 action mirred egress redirect dev ifb0
>    16: tc filter add dev eth0.2 parent ffff: protocol ip pref 1 handle 2
> fw flowid 2:3 action mirred egress redirect dev ifb0
>    17:
>    18: # Send unmarked traffic to class 2:2
>    19: insmod cls_u32
>    20: tc filter add dev eth0.2 parent ffff: protocol ip pref 1 u32
> match u32 0 0 flowid 2:2 action mirred egress redirect dev ifb0
>    21:
>    22: # Limit up and downstream to 1mbit, to "own" the queue
>    23: insmod sch_tbf
>    24: tc qdisc add dev eth0.2 root handle 1 tbf rate 1mbit burst 5k
> latency 70ms
>    25: tc qdisc add dev ifb0 root handle 1 tbf rate 1mbit burst 5k
> latency 70ms
>    26:
>    27: # High, low, and "other" priority
>    28: insmod sch_prio
>    29: tc qdisc add dev eth0.2 parent 1: handle 2 prio
>    30: tc qdisc add dev ifb0 parent 1: handle 2 prio
>    31:
>    32: # Classify request traffic from proxy server based on mark
>    33: tc filter add dev eth0.2 parent 2: protocol ip pref 1 handle 1 fw
> flowid :1
>    34: tc filter add dev eth0.2 parent 2: protocol ip pref 1 handle 2 fw
> flowid :3
>
> On 05/12/12 01:12 AM, Eliezer Croitoru wrote:
>> Thanks Anatoly,
>>
>> My idea was that based on a mark he will jump the packets to another
>> table which HE will mark TOS/DSCP.
>>
>> Eliezer
>>
>> On 12/5/2012 4:39 AM, Anatoly Muliarski wrote:
>>> Hi Jack,
>>>
>>> --restore-mark should be used for existing connections and to mark new
>>> ones you may use something like that:
>>>
>>> iptables -t mangle -A PREROUTING -i eth0.2 -m tos --tos 1 -m conntrack
>>> --cstate NEW,RELATED -j MARK --set-mark 1
>>>
>>> The main idea consists in marking packets on the physical input
>>> interface and shaping them on ifb0( where they arrive already marked
>>> ).
>>> iptables' packet marks exist only in memory of one computer, TOS/DSCP
>>> may be used for transmitting a map of them to another one.
>>> BTW, use --restore-mark on the output interface of your shaper too.
>>>
>>> 2012/12/3, Jack Bates <uo4zau@nottheoilrig.com>:
>>>> Thanks a lot for your help, how can I evaluate --restore-mark before I
>>>> classify and shape response traffic from the origin server?
>>>>
>>>> I think you mean something like:
>>>>
>>>>     # Copy ctmart to nfmark (e.g. 1, 2)
>>>>     iptables -A PREROUTING -t mangle -i eth0.2 -j CONNMARK
>>>> --restore-mark
>>>>
>>>>     # Classify by nfmark (e.g. 1, 2), send unmarked traffic to class
>>>> 2:2
>>>>     tc filter add dev eth0.2 parent ffff: protocol ip handle 1 fw
>>>> flowid
>>>> 2:1 action mirred egress redirect dev ifb0
>>>>     tc filter add dev eth0.2 parent ffff: protocol ip handle 2 fw
>>>> flowid
>>>> 2:3 action mirred egress redirect dev ifb0
>>>>     tc filter add dev eth0.2 parent ffff: protocol ip u32 match u32 0 0
>>>> flowid 2:2 action mirred egress redirect dev ifb0
>>>>
>>>> Just how can I get --restore-mark to evaluate before tc filter?
>>>>
>>>> Another way I can imagine is with the CLASSIFY target:
>>>>
>>>>     # Send unmarked traffic to class 2:2
>>>>     iptables -A PREROUTING -t mangle -i eth0.2 -m connmark --mark 1 -j
>>>> CLASSIFY 2:1
>>>>     iptables -A PREROUTING -t mangle -i eth0.2 -m connmark --mark 2 -j
>>>> CLASSIFY 2:3
>>>>     iptables -A PREROUTING -t mangle -i eth0.2 -j CLASSIFY 2:2
>>>>
>>>> But I have the same challenge, how can I evaluate the CLASSIFY target
>>>> before I shape traffic?
>>>>
>>>> Or is there another way to classify and shape response traffic from the
>>>> origin server based on the TOS/DSCP field of the request?
>>>>
>>>> On 03/12/12 03:52 AM, Eliezer Croitoru wrote:
>>>>> You use iptables mark + restore mark based on connection tracking.
>>>>> you can mark the TOS on the outgoing postrouting table.
>>>>> you can take a look at the iptabes man pages:
>>>>> http://ipset.netfilter.org/iptables.man.html
>>>>> which has --restore-mark  exaple.
>>>>>
>>>>> Eliezer
>>>>>
>>>>> On 12/3/2012 10:43 AM, Jack Bates wrote:
>>>>>> I can imagine a couple ways of classifying traffic from our proxy
>>>>>> server
>>>>>> based on the TOS/DSCP field, and also how to set the connection mark
>>>>>> based on this field. But how do I classify and shape response traffic
>>>>>> from the origin server based on the connection mark?
>>>> --
>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>
>>>
>>>
>>
>


-- 
Best regards
Anatoly Muliarski
