From: Jordi Warmenhoven <penguinsula@yahoo.com>
Subject: Re: Unwanted traffic to be FORWARD-ed is dropped by filter : ARP
	cache problem?
Date: Mon, 18 Oct 2004 22:06:31 +0100 (BST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041018210631.98696.qmail@web20025.mail.yahoo.com>
References: <4173DDE8.1040600@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4173DDE8.1040600@pbl.ca>
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
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

 --- Aleksandar Milivojevic <amilivojevic@pbl.ca>
wrote: 
> Jordi Warmenhoven wrote:
> > After having set up iptables, I notice that the
> Linux
> > box drops all lot of outside traffic (mostly MS
> > broadcasts) with DST=[my WinIP] SRC=[some host].
> It is
> > _always_ the MS-Windows IP address that ends up in
> > the FORWARD filter chain. Since I am just a simple
> > client on the network, is there maybe some Proxy
> ARP
> > gateway that keeps the two IP addresses mapped
> against
> > my MAC?
> 
> Back to the topic, 
> they might route traffic for both addresses to you,
> regardless of which 
> OS you are currently booted in.
>  Although, I'm not
> sure why there are no 
> ARP requests to check if the address is still alive
> and valid on that 
> wire (there should be, I'm seeing a hole lot of
> those on my cable modem).

Yes, seems like their ARP Proxy cache timeout is set
really long. I wonder what would happen if I do a "-j
REJECT --reset-with icmp-host-unreachable" on this
particular FORWARD traffic. Would it remove the false
entry in the ARP cache on the gateway?
 
> The traffic you are seeing dropped is most likely
> worms trying out 
> random IP addresses in search for new systems to
> infect.

Not so sure there. It's mostly MS-Windows TCP 445
connections I drop in the FORWARD chain, similar to
the traffic I drop in the INPUT chain (which could be
worms). I think worms prefer to really enter the box
instead of trying to get rerouted in my FORWARD chain.

>  BTW, if your 
> box is not acting as an router, you should disable
> IP forwarding.

Well, I masquerade a Sony Playstation behind my Linux
box, so I need forwarding from time to time :-)

-Jordi


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com

