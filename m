From: Jason Opperisano <opie@817west.com>
Subject: Re: IPsec through NAT Mode
Date: Mon, 22 Nov 2004 10:07:22 -0500
Message-ID: <20041122150722.GA30577@bender.817west.com>
References: <20041122104157.58409.qmail@web50505.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041122104157.58409.qmail@web50505.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: iptables <netfilter@lists.netfilter.org>

On Mon, Nov 22, 2004 at 02:41:57AM -0800, Nilesh wrote:
> Hello All, 
> 
> I am using Squid proxy and IPtables. I am having some
> problems to configure firewall. 
> The problem is SNAT rule If I put rule in script I am
> able to connect VPN server at outside world but could
> not block yahoo messengers by squid without SNAT rule
> I can block messenger through squid. 
> I have checked VPN connection properties there is
> check box IPsec through NAT mode . If I uncheck I wont
> able to connect 
> SNAT Rule 
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to
> $EXTIP

if you only need SNAT for VPN traffic, how about just SNAT-ing traffic
destined for the VPN server?

  $IPTABLES -t nat -A POSTROUTING -o $EXTIF -d $VPN_SRV \
    -j SNAT --to $EXTIP

-j

--
"Do you want to change your name to Homer Junior? The kids can call
 you Hoju!"
        --The Simpsons

