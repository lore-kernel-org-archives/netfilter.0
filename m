From: iptables-user <iptables@theorb.net>
Subject: Re: some addresses won't route
Date: Mon, 19 Sep 2005 17:38:23 -0700
Message-ID: <432F59FF.6010003@theorb.net>
References: <432DBC78.8070504@theorb.net>
	<200509181605.16460.rob0@gmx.co.uk>	<432DE559.6070409@theorb.net>
	<200509190912.51338.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509190912.51338.rob0@gmx.co.uk>
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

/dev/rob0 wrote:
> On Sunday 18 September 2005 17:08, iptables-user wrote:
> 
>>/dev/rob0 wrote:
>>
>>>>Box is setup as a router with a WAN, DMZ, and LAN.  WAN traffic
>>>>DNAT'd to DMZ works. DMZ and LAN through WAN works. The problems
>>>>show up in LAN to DMZ traffic.
>>>
>>>Incomplete description. Does the LAN and the DMZ have different
>>>netblocks? What IP addresses are being accessed by LAN clients? Are
>>>you doing the DNAT for those?
> 
> 
> This be talk-like-a-pirate day, lad, so we be keel-haulin' yer router! 
> Arrr! http://www.talklikeapirate.com/
> 
<snip />

Thanks /dev/rob0!!!  I laughed so hard I felt like *I* was full of grog. 
  (I'm part of a small circle of friends who talk like a pirate on a 
regular basis. P)

Sorry for the delay in following up.  My ship dropped me on a jungle 
isle replete with very hungry alligators.  Kept me busy all day :)

Everything now works without delay.  Apparently specifying the output 
interface in a FORWARD chain is not enough.  By modifying the rule to 
include -i AND -o things go where they're supposed to.  Everything now 
works again except LAN traffic to the one DMZ ip:http.

As for the one IP that just won't work for HTTP I think I have a .config 
file somewhere that is conflicting with the network's new identities. 
I've recycled my boxes a couple of times and think that therein lies the 
problem.  It's not that it's being DNAT'd incorrectly, I think it has an 
identity crisis.  The current DMZ IP used to be my client box's IP on a 
different network.  Now that I know it works I can do a clean install, 
copy over the iptables rules, and flesh out the iptables rule set.

And /dev/rob0, thanks again for your detailed help and especially for my 
laugh of the day!!!  (I owe you a good pirate joke)

Here is the working iptables rule set in iptables-save format (WAN IPs 
obfuscated, some comments):

##########  VERY BASIC 3-LEGGED FIREWALL/ROUTER  ###########
#
# [eth0] LAN is 192.168.0.1 /24 (private)
# [eth1] WAN is W.A.N.1-5   /29 (dsl to internet)
# NETWORK:W.A.N.0; IPADDR:W.A.N.1-5; GATEWAY:W.A.N.6; BROADCAST:W.A.N.7
# [eth2] DMZ is 10.0.0.1    /24 (servers)
#
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:WAN_1 - [:]
:WAN_2 - [:]
:WAN_3 - [:]
:WAN_4 - [:]
:WAN_5 - [:]
## break each WAN IP into its own chain
-A PREROUTING -d W.A.N.1 -j WAN_1
-A PREROUTING -d W.A.N.2 -j WAN_2
-A PREROUTING -d W.A.N.3 -j WAN_3
-A PREROUTING -d W.A.N.4 -j WAN_4
-A PREROUTING -d W.A.N.5 -j WAN_5
-A POSTROUTING -o eth1 -j SNAT --to-source W.A.N.5
## dns, pop3, smtp, lot's of different types of webservers
-A WAN_1 -p tcp --dport 25 -j DNAT --to-destination 10.0.0.11
-A WAN_1 -p tcp --dport 53 -j DNAT --to-destination 10.0.0.11
-A WAN_1 -p udp --dport 53 -j DNAT --to-destination 10.0.0.11
-A WAN_1 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.11
-A WAN_2 -p tcp --dport 25 -j DNAT --to-destination 10.0.0.13
-A WAN_2 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.13
-A WAN_2 -p tcp --dport 110 -j DNAT --to-destination 10.0.0.13
-A WAN_3 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.14
-A WAN_4 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.15
-A WAN_5 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.16
COMMIT

*filter
:INPUT   DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]

-A INPUT -i lo -j ACCEPT
-A INPUT -p icmp -j ACCEPT
## only LAN hosts can SSH to router
-A INPUT -s 192.168.0.0/255.255.255.0 -d 192.168.0.1 -p tcp -m tcp 
--dport 22 -j ACCEPT

## all devices can go thru DMZ
-A FORWARD -i eth0 -o eth2 -j ACCEPT
-A FORWARD -i eth1 -o eth2 -j ACCEPT
## all devices can go thru WAN
-A FORWARD -i eth0 -o eth1 -j ACCEPT
-A FORWARD -i eth2 -o eth1 -j ACCEPT
## LAN must expose AUTH for access to DMZ's SMTP server...
-A FORWARD -i eth2 -o eth0 -p tcp -m tcp --dport 113 -j ACCEPT
## ...otherwise LAN access is restricted
-A FORWARD -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
COMMIT

I hope this can be a useful starting point for somebody else.

Thanks to all for your help,
San Jose Mike

