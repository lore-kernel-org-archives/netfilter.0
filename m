From: Eddie <lists@neteconomist.com>
Subject: RE: IPTABLES for dual homed machine and public IP addresses
Date: 19 Aug 2004 15:50:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092945022.5955.43.camel@thunder.neteconomist.com>
References: <D5C9032B2B09C64EA2409D6214E91AC9051271@asimail2.alphanumeric.com>
Reply-To: lists@neteconomist.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051271@asimail2.alphanumeric.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have chosen to go with the subnet solution and reserved 65.x.x.0/25
for my  production servers. I have also reserved 65.x.x.254/30 for
router internal interface, 65.x.x.253/30 for firewall external interface
and 65.x.x.1/25 for firewall internal interface.

Most of the services allowed will be similar across servers and I was
planning to set up as follows.

DNS_SERVERS= '65.x.x.2 65.x.x.3'
WEB_SERVERS= '65.x.x.4 65.x.x.5'
MAIL_SERVERS= '65.x.x.6 65.x.x.7'


There are some servers that I want to be accessed directly only from the
internal network which is masqueraded as 65.x.x.99.

Below is mostly pseudo code.
#take care of generic services
modprobe modules

delete existing chains

set default policies

take care of ip forwarding, rpfilter, proxyarp 

create new chains.

drop all new on external with rfc1918 addresses or internal IP
addresses.

Allow new on external interface for specified services like below.

for a in DNS_SERVERS 
 iptables allow udp tcp 57 new 
 drop all except from 65.x.x.99


I have a basic and general understanding of iptables. What I need is a
really basic script that will do basic protection and I will later
strengthen it. In other words can somebody help me with something to
build on?

iptables v1.2.9
Kernel 2.6.5 (redhat)


Thanks in advance




if i understand you correctly; you currently have:

 INTERNET
    |
    |
a.b.c.d
	ROUTER
65.x.x.1
    |
    |
40 Servers with 65.x.x.x IP addresses and 65.x.x.1 as their default gateway.

your desire is to insert a firewall in between the 40 servers and the router without having to re-address all the servers, right?  if not--disregard the rest of this...

you have two options:  a layer 2 approach to solve the problem, and a layer 3 approach to solve the problem.

layer 2 would involve configuring a netfilter machine as a bridge between the servers and the router where all the IP addresses would stay the same.  the project handling this sort of thing is:  http://ebtables.sourceforge.net/

layer 3 solution would depend on what IP's were in use currently.  we know that 65.x.x.1 is used and is configured as the default gateway for all those servers--so that IP has to go on the internal interface of the new firewall.  which leaves us to re-address the outside of the new firewall and the inside of the existing router.  in the simplest case, 65.x.x.252 - .255 aren't in use.  we take 65.x.x.252/30 and assign .253 to the outside of the new firewall, and .254 to the inside of the existing router and set that as the default gateway of the new firewall.  put a static route for 65.x.x.0/24 via 65.x.x.253 on the router so all your traffic continues to get to your servers.  short of some arp-cache timeouts on the 40 servers to pick up the new MAC for 65.x.x.1, we're done.

sound plausible?

-j



