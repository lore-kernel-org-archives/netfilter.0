From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Feature suggestion ...
Date: Mon, 7 Sep 2015 17:39:59 +0530
Message-ID: <CAA5aLPi2of6Z4UGmD9pqvcq3hr2HCgVMrK46MxRKDbYL-jwK5w@mail.gmail.com>
References: <CAA5aLPgmP6hKQasPo+o6oQkZMMtuXieyxCadZ+1dzoaT1HmzkA@mail.gmail.com>
	<alpine.DEB.2.10.1509062024540.12913@blackhole.kfki.hu>
	<CAA5aLPjhXREe9W6fT1oNj=mKV3Yb6CBSLP44do-sgBrhKHa2mA@mail.gmail.com>
	<alpine.DEB.2.10.1509062215520.13557@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=CTpVRF9asTBidabSymO5NtBGIVa+AD4oY0hl4fth5I0=;
        b=ioYOBdOCnseMyz7PB8bz5KfIRQPEGAppNChN/iyttM7zSibHKk2+XeWCdS2ZXOx5Ur
         MlmtjNM6qsWQP6NXB04ADKo2GIjFY1mdsNG0OboG+WlRuMN6IL1VwBSV36CqIiv0JbUy
         flD1gbrcFFIRhU13bHo//yE5w8NfxS2JHqu26Ydaq2Qw3AABqRljcy3gdeCX8UylIGKH
         SIUqZJJnEWnp2O/mueAFHQ8V5BDO7GPbng4vkk7Gb4ijbvvFn9Enf1y71yWDANJ+DLI4
         n5FahwsWvMh9xvAgBe5u3TVqqwerYazz7+vOce0zM8yMqigOAmldtqR7utCqP79dN/IT
         RNBQ==
In-Reply-To: <alpine.DEB.2.10.1509062215520.13557@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Mon, Sep 7, 2015 at 1:53 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Mon, 7 Sep 2015, Akshat Kakkar wrote:
>
>> I am suggesting an ipset hash:mark.
>>
>> Let me explain the motivation for this requirement:
>>
>> Assume we have 100 fw rules each marking packet as 1 to 100. I am
>> marking these to do traffic shaping, so that I need not check fw
>> matching conditions on every packet. Simple check on mark will be
>> sufficient.
>> iptables -t mangle  -A Forward -j mark --restore-mark
>> iptables -t mangle -A Forward -m mark ! --mark 0 -j Accept
>>
>> iptables -t mangle -A FORWARD -i etho -o eth1 <firewall match
>> condition 1> -j MARK --set-mark 1
>> .
>> .
>> iptables -t mangle -A FORWARD -i etho -o eth1 <firewall match
>> condition 100> -j MARK --set-mark 100
>>
>> iptables -t mangle -A Forward -j Connmark --save-mark
>>
>> Next would be Filter table in Forward chain:
>>
>> iptables -t filter -m connmark ! --mark 0 -j Accept
>>
>> Note that as we are using connmark so we don't require related,
>> established rule.
>>
>> Now as I have to do bw shaping, so I need 100 tc filter rules, something like
>>
>> tc filter add dev eth1 protocol ip parent 1:0 prio 1 handle 1 fw flowid 1:1
>> .
>> .
>> tc filter add dev eth1 protocol ip parent 1:0 prio 1 handle 100 fw flowid 1:100
>> (pardon me if I am wrong on syntax, idea is to give a feel of things)
>>
>> Now visualize traffic for rule 100. every pkt, in tc, will face a
>> delay equal 100T where T is the time to search first entry, as search
>> will be linear. Clearly this doesn't scale well when rule count moves
>> to thousand or more.
>
> tc is not bad at evaluating large number of rules. You should compare
> measured performances instead of assuming those.
>
>> However, if we have an ipset hash:mark with skbinfo support, then we
>> can store this mark - tc_class membership in it and then with a
>> constant lookup time we can scale to any no. of rules with cost being
>> only memory:
>>
>> ipset -N mark_tc_class_map hash:mark skbinfo
>>
>> ipset -A mark_tc_class_map 1 skbprio 1:1
>> .
>> ipset -A mark_tc_class_map 4 skbprio 1:100
>>
>> Please note that this is not storing mark in skbinfo but creating hash
>> of marks and then storing skbinfo against each mark.
>>
>> This ipset then we will use in mangle chain of postrouting
>>
>> iptables -t mangle -A Postrouting  -j Set --map-set mark_tc_class_map --map-prio
>> With above rule we don't require those 100 tc filters mentioned above.
>> It all reduces to single rule in iptables and constant lookup time for
>> traffic shaping.
>
> You can already do this with the hash:ip,mark type if your rules allow
> reducing the conditions to IP address + mark value pairs.

Well, I am having some mix of rules. Some are per IP bandwidth shaping
rules. So that I have taken care by hash:ip,mark.
However, there are other rules also, same as the one I have mentioned
above in example. So if I use tc filter for these rules, then my per
IP bandwidth limited traffic unnecessarily has to pass through all
those filters, which in the presence of ipset:mark will also go to tc
class directly.
