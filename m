From: Martijn Lievaart <m@rtij.nl>
Subject: Re: NAT on stateless firewall ?
Date: Fri, 03 Aug 2007 21:15:01 +0200
Message-ID: <46B37EB5.3060803@rtij.nl>
References: <46B26400.7050504@andrei.myip.org>	<46B2FB97.3090605@plouf.fr.eu.org>	<46B3729A.8030605@andrei.myip.org>
	<46B37DD2.8020606@andrei.myip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B37DD2.8020606@andrei.myip.org>
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

Florin Andrei wrote:
> Florin Andrei wrote:
>> Grant Taylor wrote:
>>>
>>> Dare I ask why you are wanting to use Proxy ARP?
>>
>> Well, it's required by DNAT, isn't it?
>
> I take that back. I figured it out.
>
> I actually tested the idea yesterday, but it failed because one of the 
> test machines was not configured properly.
>
> To make proxy ARP work with DNAT, an IP alias must be created on the 
> external interface, with the public IP address of the machine behind 
> the firewall.
>
> ip address add XXX.YYY.ZZZ.KKK dev eth0
>
> where XXX.YYY... is the public IP address that corresponds to the 
> private IP address of a server behind the firewall.
>
> It's not even necessary to play with proxy_arp in /proc. Just the IP 
> alias and DNAT.
>


I think you could even get away with just creating a static arp entry.

M4


