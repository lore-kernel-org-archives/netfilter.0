From: Paul Dorman <pauld@cwa.co.nz>
Subject: Seamless communication across VPN link
Date: Tue, 15 Mar 2005 20:33:01 +1300
Message-ID: <1110871981.692.68.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi everyone, I've been struggling with a problem for a while now, and
haven't have any success, so I'm writing to you all in the hope that
someone will be able to point out the error(s) of my ways.

We have two networks connected via two smoothwall VPN machines and a
wireless link. On one side (I'll call it "this_side") we have a
10.10.10.x network and the VPN router's address is 10.10.10.5. On the
other ("the_other_side") there is a 10.10.15.x network and the VPN
router's address is 10.10.15.253. The 10.10.15.x network connects to the
Internet via the link and uses our 10.10.10.1 gateway. All of this works
well.

We recently shifted a video conference system from this_side to
the_other_side, and this unfortunately must preserve its network
settings. The main unit has an IP address of
192.168.130.4/255.255.255.248, which must be seen from both our network,
as well as our provider's 192.168.0.0/255.255.128.0 network.

On the_other_side I have assigned an alias to the VPN router's internal
ethernet adapter of eth0:1 192.168.130.1, which acts as the gateway to
the 192.168.130.x computers associated with the VC unit.

On this_side I have set the gateway on our main router (10.10.10.1) to
10.10.10.5 for the 192.168.130.x network.

If I give this directive to this_sides VPN router:

iptables -t nat -A PREROUTING -d 192.168.130.1 -i eth0 -j DNAT
--todestination 10.10.15.253

What I was hoping was that I could do a host route on our main router to
this 192.168.130.1 address and a network route to the rest of the
192.168.130.x machines using 192.168.130.1 as the gateway. No luck
there :o(.

My current plan is to set up three additional aliases on the
other_side's VPN router of 192.168.130.2-4 and to use these lines to get
the 192.168.130.x traffic to the other_side's VPN router:

iptables -t nat -A PREROUTING -d 192.168.130.2 -i eth0 -j DNAT
--todestination 10.10.15.250

iptables -t nat -A PREROUTING -d 192.168.130.3 -i eth0 -j DNAT
--todestination 10.10.15.251

iptables -t nat -A PREROUTING -d 192.168.130.4 -i eth0 -j DNAT
--todestination 10.10.15.252

This works insofar as I can get to the other_side's VPN router through
any of the 192.168.130.x addresses.

What I would *like* to do is use the same method to redirect packets
sent to the 10.10.15.250-252 addresses to the 192.168.130.2-4 addresses
on the other_side's network. So:

iptables -t nat -A PREROUTING -d 10.10.15.250 -i eth0 -j DNAT
--todestination 192.168.130.2

etc.

My hope is to make the link completely invisible and allow traffic to
get to the VC unit from both this network and the VC network provider
outside our network. Unfortunately this doesn't work for me and my lack
of experience at this stuff is really letting me down. All I get when I
try the 192.168.130.x addresses is the other_side's VPN router. I've
spent hours trying to understand the problem and how iptables works, but
the task is still beyond me.

I hope that I've provided enough information here for someone to
immediately see what I'm trying to achieve and perhaps post some
possible solutions.

Thanks very much for taking the time to read through this. It's not the
nicest of problems and I would like to set up a better VPN link using
something other than Smoothwall, but at the moment it's not a
possibility as the other office depends on this link being continuously
available. 

Sorry for the long post! I'll be happy to provide more information if
necessary on or off the list.

Regards,
Paul



