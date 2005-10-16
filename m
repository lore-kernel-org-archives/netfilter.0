From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: iptables & squid
Date: Sun, 16 Oct 2005 20:16:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510161939460.32106@filer.marasystems.com>
References: <435109FC.7000903@supportivo.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <435109FC.7000903@supportivo.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Daniel Ivanov <sertys@supportivo.org>
Cc: netfilter@lists.netfilter.org

On Sat, 15 Oct 2005, Daniel Ivanov wrote:

> I could finally manage to bump packets from a bsd box to my squid and thanks 
> to ipfw they come un-rewritten in the form
> {internal_net_ip} -> {destination_ip}
> This is ok. I set a simple redirect rule in the prerouting:
> iptables -t nat -A PREROUTING -p tcp --dport 80 -s internal_net/mask -j 
> REDIRECT --to-ports 80
>
> Packets jump to my proxy and pass through.
> But i get them returned in the form:
> {squid_box} -> {ip_from_internal_network}

Only locally on the Squid/iptables server. On the network the packets MUST 
be

   {destination_ip} -> {internal_net_ip}

If not the client won't accept the connection (wrong sender).

> Would a DNAT do the trick and will it be hit if a have a REDIRECT target 
> already in the PREROUTING.
> Otherwise the REDIRECT is also available in the OUTPUT chain of the nat 
> table.

Return traffic in response to connections which was intercepted by 
REDIRECT is implicitly SNAT:ed in POSTROUTING, and the original 
{destination_ip} should be visible to tc and external traffic shapers just 
as it is when routing the traffic.


I don't quite get what your problem is.


Traffic from the proxy to the requested web site will be

   {squid_box} -> {destination_ip}

In theory it is possible to use TPROXY to have the proxy use the original 
client source IP when making the connection to the requested web site, but 
this has very strict requirements on your network layout (the return 
traffic MUST pass via the proxy server, even if the destination ip of the 
return traffic is the original client)

Regards
Henrik

