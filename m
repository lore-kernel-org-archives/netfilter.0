From: Jason Opperisano <opie@817west.com>
Subject: Re: newbie question - what is the iptables equivalent of a Linksys
 "DMZ" ?
Date: Sun, 14 Nov 2004 11:44:16 -0500
Message-ID: <41978B60.80802@817west.com>
References: <1100392955.4894.25.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100392955.4894.25.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

David Williamson wrote:
> I'm brand new at this but have managed to get my Ubuntu Debian box
> routing for my home LAN.  The point for me was to replace my little blue
> Linksys router, and it's working fine so far.  About all I had to do was
> apt-get install ipmasq and dnsmasq.  
> 
> There's a feature on the Linksys box, however, that I can't figure out
> how to implement, because I don't know how it worked on the Linksys box,
> and that is the DMZ function.  When a machine behind the router was
> going to serve as a, for example, game server (like Unreal Tournament
> 2004), the only way I could get it to work was to put that particular IP
> on the DMZ, which, I gather, meant that it looked like it was right on
> the net, unprotected, unrouted, unmasqed, et cetera.  
> 
> Since I'm trying to understand what the Linksys box did and give the new
> router box the same abilities, it would help if I knew what the heck
> that feature was really called, and/or how to implement that in
> iptables. 

NOTE:  what you are about to read is a terrible, awful, ridiculous, 
horrendous idea and i condone absolutely no part of it.

what your linksys "DMZ" function performs is something along the lines of:

   iptables -t nat -A PREROUTING -i $EXTERNAL_IF -d $EXTERNAL_IP \
     -j DNAT --to-destination $DMZ_PC_PRIV_IP

   iptables -A FORWARD -i $EXTERNAL_IF -d $DMZ_PC_PRIV_IP -j ACCEPT

<rant>
using the "DMZ" function of the linksys or doing the above with 
netfilter is the ultimate act of laziness that does nothing but 
contribute to the never-ending security problems on the Internet.  if 
you desire to "step up" to a real firewall system, i would plead with 
you to do a little bit of homework and try to figure out what ports 
actually need to opened for the application in question to work.

searching the web for "unreal tournament firewall ports" turns up tons 
of information on how to do this.  you'd get much better responses on 
this list to a question like, "i found this list of ports i need to open 
for unreal tournament, but i'm not really sure how to write the rules" 
than "how do i setup a firewall to do absolutely no firewalling?"
</rant>

the answer to the question i wish you had asked (ports list taken from: 
  http://www.portforward.com/cports.htm):

   iptables -t nat -A PREROUTING -p udp -i $EXTERNAL_IF -d $EXTERNAL_IP \
     --dport 7777:7778 -j DNAT --to-destination $DMZ_PC_PRIV_IP

   iptables -t nat -A PREROUTING -p udp -i $EXTERNAL_IF -d $EXTERNAL_IP \
     --dport 7787 -j DNAT --to-destination $DMZ_PC_PRIV_IP

   iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_IF -d $EXTERNAL_IP \
     --dport 28902 -j DNAT --to-destination $DMZ_PC_PRIV_IP

   iptables -A FORWARD -p udp -i $EXTERNAL_IF -d $DMZ_PC_PRIV_IP \
     --dport 7777:7778 -j ACCEPT

   iptables -A FORWARD -p udp -i $EXTERNAL_IF -d $DMZ_PC_PRIV_IP \
     --dport 7787 -j ACCEPT

   iptables -A FORWARD -p tcp -i $EXTERNAL_IF -d $DMZ_PC_PRIV_IP \
     --dport 28902 -j ACCEPT

-j

--
Jason Opperisano <opie@817west.com>


