From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: squid + clamp-mss-to-pmtu
Date: Thu, 5 May 2005 06:32:38 -0400
Message-ID: <200505050632.38221.Alistair@nerdnet.ca>
References: <1115219353.2802.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115219353.2802.11.camel@localhost.localdomain>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On May 4, 2005 11:09 am, jonathan wrote:
> Hi,
> I have a problem with squid and iptables.
> I have to use "TCPMSS --clamp-mss-to-pmtu" to adapt the mtu with the ISP
> requirement, but since I have installed the squid proxy, it seems like
> the iptables chains below doesn't work.

	I doubt that squid 'broke' iptables mss clamp.
>
> $iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN /
> -j TCPMSS --clamp-mss-to-pmtu
>
> $iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN /
> -j TCPMSS --clamp-mss-to-pmtu
>
> Some websites still are unaccessible.

	You are doing the clamp in both FORWARD and OUTPUT.  This is a good idea on 
systems that require this function.  However since we don't know the flow on 
your system we can't offer much in the way of advice.

	Please let us know the following:
	1) what is the basic layout of your network 
	2) where are the systems initiating the failed connections located on that 
network
	3) where is squid on that network?
	4) what are you doing to get connections to go through squid?
	5) what other rules are there?
	6) what are the tcp_ecn settings on the firewall (I'd suspect ecn before 
anything else since there are so many b0rken firewalls out there that don't 
understand it)
	7) what is meant by inaccessible? what functions of squid might affect this?

	8) Are you absolutely sure you checked to make sure tcp_ecn is off?
	   Completely?

	Alistair Tonner
	

>
> Is there a way to make it work?
>
> thanks

