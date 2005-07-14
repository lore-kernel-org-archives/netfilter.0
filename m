From: primero <primero@fastwebnet.it>
Subject: Re: DNS and NAT
Date: Thu, 14 Jul 2005 18:00:59 +0200
Message-ID: <42D68C3B.30002@fastwebnet.it>
References: <BAY17-F22074E1DF13F87E0D94A0C80D10@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY17-F22074E1DF13F87E0D94A0C80D10@phx.gbl>
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
To: Suzana Lojic-Skoric <s_lojic@hotmail.com>
Cc: netfilter@lists.netfilter.org

Suzana Lojic-Skoric wrote:

>> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>
>> and everything is as described.
>>
> Yes, you are right, but the problem is between my inside client and 
> the NAT gateway I have a machine that drops everything that is not 
> 10.x.x.x. I know, I know, it is insane... but my job is to find a 
> solution for DNS in such network.
>
> So basically, my inside network can only route 10.x.x.x and everything 
> else is dropped.
>
>> As /dev/rob0 pointed out, if you don't want your clients to talk with
>> google directly use proxies.
>>
>
> I'll check out the proxy idea. Thanks for your input.
>
> Suzana
>
You could use a Proxy but this would not solve your problem of 'have a 
machine that drops everything that is not 10.x.x.x' ... even with a 
proxy you would need that at least that machine would be able to access 
Public Big Internet.

Maybe i missed the point ... but if you can not access anything else 
then 10.x.x.x because something beetween clients and DefaultGW would 
drop it i don't see any escape other then configuring the proxy on your 
NAT Device because it should have not problem accessing the Public Internet.

Bye
Francesco

