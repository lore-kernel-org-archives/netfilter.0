From: Ed W <lists@wildgooses.com>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 04:23:48 +0100
Message-ID: <4F8B90C4.3070600@wildgooses.com>
References: <4F8B5925.5020307@wildgooses.com> <4F8B72BB.4010307@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F8B72BB.4010307@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

On 16/04/2012 02:15, Ed W wrote:
> On 16/04/2012 00:26, Ed W wrote:
>> In particular if I lock down iptables (-P DROP), then the above 
>> command takes quite some seconds to complete, rather than instantly 
>> if I open up iptables.  This is causing me some problems with startup 
>> scripts
>>
>> Am I missing some configuration option? Is this a bug? Why is a 
>> reverse DNS lookup needed?
>
> eg
>
> $ iptables -I INPUT -j REJECT
> $ time ipset create cp2 bitmap:ip,mac range 192.168.1.1/24
> ipset v6.9.1: Set cannot be created: set with the same name already 
> exists
> Command exited with non-zero status 1
> real    0m 45.11s
> user    0m 0.01s
> sys     0m 0.00s

I upgraded to ipset 6.11 and note the same issue.  I also just 
discovered I can repro this when adding to a set, eg:

$ time /usr/sbin/ipset -! -q add cp2 192.168.105.56,58:b0:35:78:0d:f5
Command exited with non-zero status 1
real    1m 0.09s
user    0m 0.00s
sys    0m 0.01s


In this case I have multiple internet connections. Pushing IPs into an 
ipset forces that ip over a particular connection.  If the box is 
currently on some non responsive network, then the resolver isn't 
working correctly and ipset is consequently also slow.

Any ideas how I can get out of this?

Thanks

Ed W
