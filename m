From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Gigabit
Date: Tue, 9 Mar 2004 20:45:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403092045.24365.Antony@Soft-Solutions.co.uk>
References: <FOELKOFDAANJCBHBJNEBIEOACCAA.mailarchives@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FOELKOFDAANJCBHBJNEBIEOACCAA.mailarchives@mail.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 09 March 2004 8:05 pm, Vladimir Potapov wrote:

> 1)I want to use this network scheme:
>
>       subnet-1 --------
>                        | PF | --------Firewall------cisco ----- Internet
>       subnet-2 --------                           |
>                                              VPN-server
>
> PF and Firewall - box'es with iptables . Does they need to have PPTP
> support to route traffic?

The simple answer to this is "no, they do not need PPTP support in order to 
route traffic".   However, bits of information which are not obvious from the 
above description means that the answer might need to be "yes".

1. What does PF do?   To me, PF means Packet Filter, in which case, what's the 
difference between that and "Firewall"?

2. Is there any NAT involved (this is the biggest reason why you might need 
explicit PPTP support in the boxes shown above)?

3. You have shown where the PPTP server is (one endpoint of the VPN/s), but 
where are the clients (the other end/s)?   If they are on the Internet, then 
no VPN (presumably PPTP) traffic is going through PF and Firewall, therefore 
they don't need to bother about it.   If the clients are on the subnets-1/2, 
then maybe PF and Firewall do need to bother about the VPN traffic.

> 2)At all I have 7 subnets with a lot of traffic.6 subnets with users (in
> 50-400 users in each subnet) and 1 for server with web board, chat and
> news.

What are the bandwidths of the connections for each subnet, and the Internet 
link?

> Does anyone use iptables in gigabit network? How big nominally a throughput
> of gigabit network with filtering by iptables ?

That depends on things like: the hardware of the firewall machine (CPU speed, 
memory size), and very much on the number of rules you have in your ruleset.

Tell us a bit more information, and hopefully we'll be able to help a bit more 
with some suggestions.

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


