From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: moving old ips to new ips..forwarding
Date: Fri, 5 Jul 2002 14:48:20 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207051348.g65DmS801996@vulcan.rissington.net>
References: <Pine.LNX.4.21.0207051257520.5181-100000@grabak.talker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.21.0207051257520.5181-100000@grabak.talker.com>
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

On Friday 05 July 2002 2:27 pm, Cygnus - Flirttown Coder wrote:

> Scenario:
> X number of clients (with 1 or more ips bound to a box)
> behind Cisco Catalysts, behind Cisco 3600, behind Internet
>
> Problem:
> We want to move clients off our non-portable IP range and onto our arin
> range.

Why ?   This sounds less secure, less portable, more expensive and less 
future-proof to me.

> I was thinking of setting up a linux box with iptables (call it
> 'forwarder'), and pointing the old ips, inbound, to 'forwarder' on the
> cisco 3600 (forwarder is not a pass-through, just a box hanging off a
> switch port), then using iptables to forward each old ip to the new
> one.

Why do you want to carry on using the old IP for a client after you've 
changed that client to a new IP ?

> 1. Is there a better or easier way to do this?

What are you currently using for a firewall ?   Can't you do the necessary 
NAT on there ?

> 2. Is there a way to get the forwarder to route the old
>    ips to the client even if, especially if, they haven't changed them
>    yet? i.e. say the client has an old ip of x.x.x.x and is moving to a
>    new one of y.y.y.y, the forwarder would say, ok, traffic for x.x.x.x
>    send to x.x.x.x AND y.y.y.y (because the forwarder doesn't know if the
>    ip has moved yet). Maybe i'm overcomplicating it?

You can't duplicate packets - you can only change a packet so it goes to a 
different address, but it's still only one packet.

Assuming that your terminology 'client' means these are machines initiating 
communications, and they're not servers being accessed from other systems on 
some presumed IP address, then once you've changed the IP on the client, why 
would there ever be any packets destined for the old address ?

> 3. iptable rules to do this?

Depends on whether you really do mean client as in 'system which initiates 
connections and does not have connections initiated to it' or whether other 
machines out on the Internet might suddenly decide to connect to one of these 
old or new IPs and you have to route the inbound packets appropriately ?

> 4. will outbound traffic from the new ipcs need to go through 'forwarder',
>    or do programs not care if they receive answers from ips other than the
>    one they sent them too?

If you NAT them in one direction, they must be NATted in the other direction 
as well.   Machines WILL get extremely upset if they contact IP a.b.c.d and 
then get a reply from IP w.x.y.z (ie it simply won't work).

> 5. any other caveats?

What is the physical network structure - if you are changing machines from 
one IP range to another, are they getting plugged into a physically different 
port on your firewall / router, or how else are you making sure that packets 
can find the correct new gateway address for the outside world ?

 

Antony.

