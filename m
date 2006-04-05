From: Casey Scott <casey@phantombsd.org>
Subject: Re: Throttling NAT interface
Date: Wed, 5 Apr 2006 10:35:26 -0700 (PDT)
Message-ID: <6440356.271144258526830.JavaMail.root@tomcat.phantombsd.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Randy Grimshaw <rgrimsha@syr.edu>
Cc: netfilter@lists.netfilter.org

Thanks for the response. Will using iptables in that 
manner cause the firewall to just drop the packets that 
arrived after the limit has been reached? I don't want 
to have to drop packets that have already used up 
bandwidth getting to the machine, and making matters 
worse by requiring the packets to be sent again. 

Thanks,
Casey
----- Original Message -----
From: Randy Grimshaw <rgrimsha@syr.edu>
To: netfilter@lists.netfilter.org, casey@phantombsd.org
Sent: Wednesday, April 5, 2006 10:27:48 AM GMT-0800
Subject: Re: Throttling NAT interface

Our throttle is really in the other direction but the 
idea may work for you.
iptables [traffic pattern spec] -m limit --limit 
40/second --limit-burst 60 -j LEVEL2
LEVEL2 is a user defined chain that specifies other 
restrictions or in your case NAT translations. 
The point is that you can match the traffic patterns 
that you need before applying the limit match.
hope this is helpful.
<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu

>>> Casey Scott <casey@phantombsd.org> 4/5/2006 12:44 PM >>>
The gist of what I need to do is restrict the rate of
 off-network traffic coming in through a host. The host
is providing basic NAT to an internal network. I have
gotten pretty close to what I need to do with iptables
 and tc. The problem is that when an interface is throttle
 with tc, the source of the traffic doesn't matter. I don't
 want to throttle local traffic, just traffic coming through
 the machine from a WAN. The next step was to add another
NIC to the machine. Something like this:

eth0:  <local IP1>
eth1: <WAN IP>
eth2: <local IP2>

The problem is that even if  traffic destined to be routed
off network comes into eth2, which is throttle via tc, the
return traffic comes back through eth0. Since tc (tbf filter)
just controls the transmitting of an interface, I need to
force the NAT traffic to use eth2. Traffic that is meant to
stay local can use eth0. Is possible to do something like this?
How can I this host to only eth2 for NAT even though both eth0
and eth2 are in the same network?  eth0 is not throttled, which
 is why local traffic needs to use it.

TIA,
Casey




