From: Cygnus - Flirttown Coder <cygnus@talker.com>
Subject: Re: moving old ips to new ips..forwarding
Date: Fri, 5 Jul 2002 14:25:50 +0000 (UTC)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.21.0207051355420.5181-100000@grabak.talker.com>
References: <200207051348.g65DmS801996@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207051348.g65DmS801996@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Fri, 5 Jul 2002, Antony Stone wrote:

> On Friday 05 July 2002 2:27 pm, Cygnus - Flirttown Coder wrote:
> 
> > Scenario:
> > X number of clients (with 1 or more ips bound to a box)
> > behind Cisco Catalysts, behind Cisco 3600, behind Internet
> >
> > Problem:
> > We want to move clients off our non-portable IP range and onto our arin
> > range.
> 
> Why ?   This sounds less secure, less portable, more expensive and less 
> future-proof to me.
> 

because our current bandwidth provider is killing us on our T3 charges,
and we can't move if our clients are on a non-portable IP range from them.

> > I was thinking of setting up a linux box with iptables (call it
> > 'forwarder'), and pointing the old ips, inbound, to 'forwarder' on the
> > cisco 3600 (forwarder is not a pass-through, just a box hanging off a
> > switch port), then using iptables to forward each old ip to the new
> > one.
> 
> Why do you want to carry on using the old IP for a client after you've 
> changed that client to a new IP ?
> 

i meant before some are changed. lets say the customer moved 1/2 of their
ips and not the other half yet.
if there was a way to have them both work AS they changed them.
the old ips can't continue to go right to the box, because they're now
going through 'forwarder', which is supposed to forward them to the old
ip, but if the new ip isn't in place yet, it'd get dropped.


> > 1. Is there a better or easier way to do this?
> 
> What are you currently using for a firewall ?   Can't you do the necessary 
> NAT on there ?
> 

no firewall. just router access lists :(

> > 2. Is there a way to get the forwarder to route the old
> >    ips to the client even if, especially if, they haven't changed them
> >    yet? i.e. say the client has an old ip of x.x.x.x and is moving to a
> >    new one of y.y.y.y, the forwarder would say, ok, traffic for x.x.x.x
> >    send to x.x.x.x AND y.y.y.y (because the forwarder doesn't know if the
> >    ip has moved yet). Maybe i'm overcomplicating it?
> 
> You can't duplicate packets - you can only change a packet so it goes to a 
> different address, but it's still only one packet.
> 
> Assuming that your terminology 'client' means these are machines initiating 
> communications, and they're not servers being accessed from other systems on 
> some presumed IP address, then once you've changed the IP on the client, why 
> would there ever be any packets destined for the old address ?
> 

i'm sorry, i meant client as in the customer. the customer's web/mail/dns
server sitting behind the catalysts. The ips on these servers being
the ones changed.

> > 3. iptable rules to do this?
> 
> Depends on whether you really do mean client as in 'system which initiates 
> connections and does not have connections initiated to it' or whether other 
> machines out on the Internet might suddenly decide to connect to one of these 
> old or new IPs and you have to route the inbound packets appropriately ?
> 

see above

> > 4. will outbound traffic from the new ipcs need to go through 'forwarder',
> >    or do programs not care if they receive answers from ips other than the
> >    one they sent them too?
> 
> If you NAT them in one direction, they must be NATted in the other direction 
> as well.   Machines WILL get extremely upset if they contact IP a.b.c.d and 
> then get a reply from IP w.x.y.z (ie it simply won't work).
> 

that presents quite a problem. short of changing each customer's gateway
from the router to the forwarder. and even so, if the forwarder was
routing outbound traffic for a customer server (and, what, NATing it to
say the source ip is the old ip instead?) how does it know that the
inbound request that came in that's being responded to is from an old ip
or new ip?
For example:
 * server has ip of x.x.x.x, DNS resolves to this, outside services
   connect to this, etc..
 * server changes ip from x.x.x.x to y.y.y.y
 * forwarder routes INBOUND x.x.x.x to y.y.y.y
 * by your info, forwarder must also route OUTBOUND for requests to
   x.x.x.x, changing OUTBOUND source ip to x.x.x.x (to correlate IP
   request was sent to, with, IP answer came from)
 * now, after DNS and other people outside update IP info, connections
   comes into the customer server for y.y.y.y, BUT, OUTBOUND traffic is
   still going to 'forwarder', when is changing the source IP to the old
   one. so requests from came into y.y.y.y and going out with answers
   labeled as x.x.x.x
 
 
> > 5. any other caveats?
> 
> What is the physical network structure - if you are changing machines from 
> one IP range to another, are they getting plugged into a physically different 
> port on your firewall / router, or how else are you making sure that packets 
> can find the correct new gateway address for the outside world ?
> 

Basically:

+----------+    +--------+    +---------+    +---------+
| Internet |----| Router |----| Switch1 |----| Switch2 |
+----------+    +--------+    +---------+    +---------+
                                |     |        |     |
                              Cust1 Cust2    Cust3 Cust4

only more switch and customers.
no physical changes. and the ips on the router and catalysts aren't being
changed yet.

Thanx,


-Tony


