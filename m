From: "Daniel L. Miller" <dmiller@amfes.com>
Subject: Re: Connection tracking counters increasing
Date: Thu, 07 Mar 2013 09:21:58 -0800
Message-ID: <assp.177886a3c9.5138CCB6.3050705@amfes.com>
References: <5138BC91.9060903@amfes.com> <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr> <5138C95B.1080405@amfes.com> <alpine.LNX.2.01.1303071816090.23717@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=Os5DF3Kqedbfa2t6gFm771xlQSQ=; b=uzcgmKok8yCv1DSWip4fSWP6pJ8V0wLobfrOgR6iG60qXrhTNSego+FPvm5lEfjsFtwBEIKUHGvqhKqwxDPy4+u3dd8iF5R60ZnWWwtYvgg4rLfufgYvhjxXzgroJU0QHCzAGPluOIjHEiTXeW0e6GWIl9b13ygp/o256yUujfg=
In-Reply-To: <alpine.LNX.2.01.1303071816090.23717@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter-Users <netfilter@vger.kernel.org>

On 3/7/2013 9:16 AM, Jan Engelhardt wrote:
> On Thursday 2013-03-07 18:07, Daniel L. Miller wrote:
>
>> On 3/7/2013 8:29 AM, Jan Engelhardt wrote:
>>> On Thursday 2013-03-07 17:13, Daniel L. Miller wrote:
>>>
>>>> I've noticed that my connection tracking counters keep increasing -
>>> Which counters?
>>>
>> /proc/sys/net/netfilter/nf_conntrack_count
>>
>> and when it reaches /proc/sys/net/netfilter/nf_conntrack_max things break.
> Could it be you are being DDoSed?

Anything's possible - but I don't have a high-visibility site.  The 
connection counter increments gradually - a new connection every couple 
of seconds or so.

Trying to understand what's going on, I installed the "conntrack" tool.  
conntrack -S yields:
entries                 28752
searched                27822
found                   11950927
new                     457431
invalid                 333
ignore                  347677
delete                  465404
delete_list             428962
insert                  414575
insert_failed           0
drop                    0
early_drop              0
icmp_error              0
expect_new              0
expect_create           0
expect_delete           0
search_restart          0

But more confusing is conntrack -L only shows 52 entries.

-- 
Daniel

