From: Lopsch <lopsch@lopsch.com>
Subject: Re: iptables and TOS 15
Date: Fri, 12 Nov 2004 17:54:11 +0100
Message-ID: <4194EAB3.5040409@lopsch.com>
References: <419551d1.7be0.0@australia.edu>
	<1100272993.3377.9.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100272993.3377.9.camel@hubcap.ljm.dom>
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
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

Jason Opperisano schrieb:
> On Fri, 2004-11-12 at 03:40, tepesu@australia.edu wrote:
> 
>>    hi,
>>
>> my ISP mark packets from some internet traffic with TOS 15 and i musst
>>filter this traffic. how and where i must odified iptables to can do some
>>filtering using this marks, TOS 15.
> 
> 
> as far as i'm aware, "15" is not a valid TOS value.  as a result of the
> way the TOS bits are set in the packet header, there are only 5 possible
> TOS settings (from RFC 1349):
> 
>   1000   --   minimize delay
>   0100   --   maximize throughput
>   0010   --   maximize reliability
>   0001   --   minimize monetary cost
>   0000   --   normal service
> 

Concerning to 
http://www.lartc.org/howto/lartc.qdisc.classless.html#AEN659 the value 
15 is a combination of all possible TOS values. What would be logical 
because with a 4bit field you are able to get the max decimal value of 
15. In my opinion marking with 15 or not marking have the same effect. 
Also using the TOS values only makes sense when using for example the 
pfifo_fast queueing discipline to schedule pakets.


