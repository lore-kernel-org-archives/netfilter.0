From: Jason Opperisano <opie@817west.com>
Subject: Re: Cisco VPN Client + Cisco 800 + Firewall
Date: Thu, 21 Oct 2004 15:29:49 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041021192949.GA11650@bender.817west.com>
References: <1098385275.7ic0vxrrb5hc@mail.sapo.pt>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1098385275.7ic0vxrrb5hc@mail.sapo.pt>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Oct 21, 2004 at 08:01:15PM +0100, shore@sapo.pt wrote:
> Hi,
> 
> I don't know how to start, so I'll just start by showing how my network is
> build:
> 
> 
> 		Internet
> 		    |
> 		    |
> 		Cisco(800)(dsl modem/router)
> 		192.168.10.254
> 		    |
> 		    |
> 		192.168.10.1(eth0)
> 		Firewall
> 		192.168.0.50(eht1)
> 		    |
> 		    |
> 		LAN 192.168.0.0/24
> 
> 
> The Cisco is controled by the ISP, so I can't change any configuration on it,
> only if I ask them to. The Firewall is running squid also.
> 
> The ISP configured the Cisco modem/router to accept VPN connections from the
> internet with Cisco VPN client, and to attribute them a 10.0.0.0/8 range ip.
> The problem is I can't access the LAN from the VPN clients. I'm not an iptables
> master, but i've already searched everywhere for a solution and could't find
> one. Mostly, I think, because I didn't want to get rid of my Firewall script,
> it is doing a nice job so far.
> 
> Thanks

before i start parsing through 800 lines of firewall script, i gotta ask
this first--when you connect with the cisco vpn client out on the
internet--what shows up in the list of "secured routes?"  is it
192.168.0.0/24?  is it 0.0.0.0/0.0.0.0?  or is it 192.168.10.0/24?

-j

-- 
Jason Opperisano <opie@817west.com>

