From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Feature suggestion ...
Date: Mon, 7 Sep 2015 01:37:28 +0530
Message-ID: <CAA5aLPjhXREe9W6fT1oNj=mKV3Yb6CBSLP44do-sgBrhKHa2mA@mail.gmail.com>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
	<alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=QkXKzaQdqJ4jv58cS9co9101zPaQTyLAYIehjJXonDE=;
        b=cRSNkjx8a1Z85yDPQhjPVv2quwgsI1EUAmFdjpZHTS/JzGDxLIILzdvo3srT8P5icP
         9l75g/G1XVqidvYMzRukrWdsYG0lRVOo08YIt/xRGCp7fxbaATGr475Y60qHg8rc2O1N
         6WFx2KjjmuP+O8Ha7VAZo/nPXTkvHxJYSIdU1bUBnsdlLiME0bERWXCD2zpE6oah3XBc
         NzgOCT88/OKzQcxkDeZZobz5DFnqCQb18DrcZwQlfAU9gvMHUsXZlE1QY7fMVMtjqWeU
         x2Wq6OjQiC/OZy4vTqtgzUMatXvmyH/Jfawn+gulWChNZtQJmh0YyC6Xtn6pHVWbHSbk
         rMQQ==
In-Reply-To: <alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am suggesting an ipset hash:mark.

Let me explain the motivation for this requirement:

Assume we have 100 fw rules each marking packet as 1 to 100. I am
marking these to do traffic shaping, so that I need not check fw
matching conditions on every packet. Simple check on mark will be
sufficient.
iptables -t mangle  -A Forward -j mark --restore-mark
iptables -t mangle -A Forward -m mark ! --mark 0 -j Accept

iptables -t mangle -A FORWARD -i etho -o eth1 <firewall match
condition 1> -j MARK --set-mark 1

iptables -t mangle -A FORWARD -i etho -o eth1 <firewall match
condition 2> -j MARK --set-mark 2
.
.
.
iptables -t mangle -A FORWARD -i etho -o eth1 <firewall match
condition 100> -j MARK --set-mark 100

iptables -t mangle -A Forward -j Connmark --save-mark

Next would be Filter table in Forward chain:

iptables -t filter -m connmark ! --mark 0 -j Accept

Note that as we are using connmark so we don't require related,
established rule.

Now as I have to do bw shaping, so I need 100 tc filter rules, something like

tc filter add dev eth1 protocol ip parent 1:0 prio 1 handle 1 fw flowid 1:1

tc filter add dev eth1 protocol ip parent 1:0 prio 1 handle 2 fw flowid 1:2

tc filter add dev eth1 protocol ip parent 1:0 prio 1 handle 3 fw flowid 1:3
.
.
.
tc filter add dev eth1 protocol ip parent 1:0 prio 1 handle 100 fw flowid 1:100
(pardon me if I am wrong on syntax, idea is to give a feel of things)

Now visualize traffic for rule 100. every pkt, in tc, will face a
delay equal 100T where T is the time to search first entry, as search
will be linear. Clearly this doesn't scale well when rule count moves
to thousand or more.

However, if we have an ipset hash:mark with skbinfo support, then we
can store this mark - tc_class membership in it and then with a
constant lookup time we can scale to any no. of rules with cost being
only memory:

ipset -N mark_tc_class_map hash:mark skbinfo

ipset -A mark_tc_class_map 1 skbprio 1:1
ipset -A mark_tc_class_map 2 skbprio 1:2
ipset -A mark_tc_class_map 3 skbprio 1:3
.
.
.
ipset -A mark_tc_class_map 4 skbprio 1:100

Please note that this is not storing mark in skbinfo but creating hash
of marks and then storing skbinfo against each mark.

This ipset then we will use in mangle chain of postrouting

iptables -t mangle -A Postrouting  -j Set --map-set mark_tc_class_map --map-prio
With above rule we don't require those 100 tc filters mentioned above.
It all reduces to single rule in iptables and constant lookup time for
traffic shaping.



On 9/7/15, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> On Sun, 6 Sep 2015, Akshat Kakkar wrote:
>
>> With latest addition of storing skbinfo (mainly skbprio) in ipset and
>> then applying it later to the traffic as and when it passes the iptables
>> ruleset, it becomes relatively easy and simple to do traffic shaping.
>>
>> IMHO what one of the feature set which we can add is to have an ipset of
>> only fwmarks i.e. fw-marks will be hashed and stored in the ipset and
>> then later using these marks we can instantly (in single look up) set
>> traffic class.
>
> You can already store skbmark in the set element extension and set the
> mark value to the matching packets.
>
>> Motivation for this is the fact that just reading the mark can signify
>> which fw rule it belongs to (no matter how complex was that firewall
>> rule). So if we do traffic shaping based on marks, it becomes
>> straightforward traffic shaping for that fw rule. Now as no of rules
>> increase, this lookup will also increase linearly and
>> more-importantly, we cant take advantage of any statefulness over
>> here, i.e. if there are 100 rules then everytime my packet will have
>> to go down 100 lines, get it matched, get its skbprio value and then
>> move forward.
>
> Sorry, but I don't undestand this...
>
>> however, if we such an ipset as I am mentioning, so all these skbprio
>> settings and all can always be done in single shot,
>>
>> say we make something like
>> ipset -N MARK-TC-MAP hash:mark skbinfo
>>
>> iptables -t mangle -A POSTROUTING -j SET --map-set MARK-TC-MAP src
>> --map-prio
>
> ...and your example doesn't help either. Why do you need the set at all?
> You could simply write
>
> iptables -t mangle -A POSTROUTING -j MARK --set-mark value
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
>
