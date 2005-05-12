From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Transparent proxy to remote squid box
Date: Thu, 12 May 2005 20:00:05 +0300
Message-ID: <42838B95.4080901@hotpop.com>
References: <42837F81.6050305@phreaker.net> <4283892B.1080005@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4283892B.1080005@hotpop.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Georgi Alexandrov wrote:

> ro0ot wrote:
>
>> Hi,
>>
>> I have a working "transparent proxy to remote squid box" rules as 
>> below: -
>>
>> $IPTABLES -t nat -A PREROUTING -i eth1 -s ! 10.59.2.4 -p tcp --dport 
>> 80 -j DNAT --to 10.59.2.4:3128
>> $IPTABLES -t nat -A POSTROUTING -o eth1 -s 10.59.2.0/24 -d 10.59.2.4 
>> -j SNAT --to 10.59.2.1
>> $IPTABLES -t filter -A FORWARD -s 10.59.2.0/24 -d 10.59.2.4 -i eth1 
>> -o eth1 -p tcp --dport 3128 -j ACCEPT
>>
>> How can I not route the following network "1.1.1.0/24" to the remote 
>> squid box using IPTABLES?
>>
>> Regards,
>> ro0ot
>>
>>
> Hello,
>
> U can put 1 rule above the DNAT like this:
>
> $IPTABLES -t nat -A PREROUTING -i eth1 -s 1.1.1.0/24 -p tcp --dport 80 
> -j ACCEPT
> $IPTABLES -t nat -A PREROUTING -i eth1 -s ! 10.59.2.4 -p tcp --dport 
> 80 -j DNAT --to 10.59.2.4:3128
>
> The first rule matches the requests coming from 1.1.1.0/24 to tcp port 
> 80 and accepts them, e.g. the packets won't hit the next rule.
>
> P.S.
> you probably meant 10.1.1.0/24 ?
>
> regards,
> Georgi Alexandrov
>
>
For the sake of completeness - you can also you the RETURN target in the 
first rule, that will cause packets not to travel this chain anymore and 
hit the chain's default policy. In most cases it's "ACCEPT" so the 
RETURN target will do, if the chain's policy is DROP you should use the 
ACCEPT target in the first rule.

regards,
Georgi Alexandrov

