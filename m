From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to advertise a route ??
Date: Thu, 20 Jun 2002 10:39:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206200945.g5K9jjU31860@vulcan.rissington.net>
References: <4.3.1.2.20020620092846.02bc88e0@193.133.103.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <4.3.1.2.20020620092846.02bc88e0@193.133.103.2>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 20 June 2002 10:28 am, Tom Walder wrote:

> I want to SNAT a whole bunch of ip addresses, I know I can add them as
> aliases to the eth0 interface but I read somewhere that routes can be setup
> and advertised. Can anyone give me a pointer on how this might be done.

Not sure what you mean by "advertised", unless you're running some sort of 
routing protocol (which seems unlikely).

Basically you need to tell the router immediately upstream of your firewall 
that instead of expecting to find the SNATted addresses on the local network, 
it should instead route the un-SNATted addresses via the firewall, and then 
let it take care of things from there.

If the addresses you are considering either routing or hiding behind SNAT 
addresses are routed from the outside world as far as your firewall's 
next-hop router, then this is a feasible option.

If the addresses your are considering routing are either private addresses, 
or are not currently routed as far as your next-hop router, then I'd suggest 
this method is more trouble than it's worth, because you'd need to get at 
least one, and possibly several, ISPs to set up static routes for you.

> Also......

> I have just read and article on proxy arp , can anyone comment on using
> proxy arp verses a snat/dnat solution ?

These are not really alternatives.

Proxy arp is necessary for the firewall to acquire packets on its external 
interface, for addresses other than the primary address of that interface, 
but what are still part of the network range which that interface's address 
belongs to.

Once the firewall has acquired the packets, you can use DNAT to send them on 
to some other destination (such as a machine on a private address inside your 
network).

If you SNAT packets from internal machines to an address which belongs in the 
network range of the external interface of your firewall, the firewall must 
respond to arp requests for that address in order to accept the replies.


I think the best answer to your initial question is "tell us the real 
addresses of the machines you are considering SNATting, and whether these 
addresses have been assigned to you by the ISP you are connected to the 
Internet through."

The answer to that will determine whether you should be using NAT/proxy arp 
or routing.

 

Antony.

