From: Akao <technique@akao.fr>
Subject: Re: Relay to DNS Server ?
Date: Thu, 17 Jun 2004 09:11:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D14429.8090803@akao.fr>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108> <40D04BB9.2030907@akao.fr> <20040616155319.3ae01819.leslie.polzer@gmx.net> <200406161830.21188.Antony@Soft-Solutions.co.uk> <40D08704.7020804@lot66.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D08704.7020804@lot66.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Mark Anacker wrote:

> Antony Stone wrote:
>
>> On Wednesday 16 June 2004 2:53 pm, Patrick Leslie Polzer wrote:
>>
>>
>>> On Wed, 16 Jun 2004 15:31:37 +0200
>>>
>>> Akao <technique@akao.fr> wrote:
>>>
>>>> Is it possible to use netfilter rules to "relay" clients DNS 
>>>> requests ?
>>>
>>>
>>> Masquerading does that, but you must allow packets to port 53 
>>> tcp/udp to
>>> pass through to your ISP's DNS servers and their related packets back.
>>
>>
>>
>> This is a completely correct and accurate answer to your question, 
>> however I think you would get much better performance for very little 
>> effort if you set up a simple caching-only name server somewhere on 
>> your network (possibly even on the firewall itself, but don't tell 
>> anyone I suggested that :)
>>
>> Regards,
>>
>> Antony.
>>
>
> You might want to run a DNS cache like dnsmasq on the firewall box, 
> then use a REDIRECT or DNAT rule to grab client's requests and force 
> them into the cache.  That way, the client's don't have to change 
> their DNS server list, and you get the benefits of caching.
>
Ok, thanks for your answers.
 I managed to complete clients DNS requests with masquerading. I will 
look for a dns cache as you adviced me.

Thanks again for your answers.

Axel


