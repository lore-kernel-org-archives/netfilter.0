From: "John Lister" <john.lister@kickstone.com>
Subject: Re: Problem with statistic module nth mode
Date: Tue, 25 Aug 2009 13:55:17 +0100
Message-ID: <62FE92107C6F4C28993F30CAF00E52B5@squarepi.com>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org


----- Original Message ----- 
From: "Patrick McHardy" <kaber@trash.net>
To: "John Lister" <john.lister@kickstone.com>
Cc: <netfilter@vger.kernel.org>
Sent: Tuesday, August 25, 2009 1:48 PM
Subject: Re: Problem with statistic module nth mode


> John Lister wrote:
>> Hi, I have a set of rules as follows
>>
>> iptables -t nat -N SNAT1
>> iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 0 -j
>> SNAT --to-source 87.194.x.1
>> iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 1 -j
>> SNAT --to-source 87.194.x.2
>> iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 2 -j
>> SNAT --to-source 87.194.x.3
>> iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 3 -j
>> SNAT --to-source 87.194.x.4
>> iptables -t nat -A SNAT1 -m statistic --mode nth --every 5 --packet 4 -j
>> SNAT --to-source 87.194.x.5
>>
>> iptables -t nat -A POSTROUTING -o eth1 -j SNAT1
>> ...
>> iptables -t nat -A POSTROUTING -o eth1 -j LOG --log-prefix "Failed to 
>> nat"
>>
>>
>> The last rule is occasionally triggered, is this a bug? I could put a
>> catch all there, but the 5 "nth" rules should cover all possible cases
>> or have I missed something obvious??
>
> This is a common misunderstanding - the counters are not shared and
> since the rules are all terminal, the second rule will only see the
> packets not caught by the first rule etc. So the proportions need to
> be adjusted for the "missing" packets:
>
> ... --mode nth --every 5 ...
> ... --mode nth --every 4 ...
> ... --mode nth --every 3 ...
> ... --mode nth --every 2 ...
> ... <unconditional> ...
> --


Thanks for that, I was slightly confused - I had originally done it using 
"random" with decreasing percentages but wanted to use nth.


I'll let you know how I get on...

JOHN 

