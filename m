From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: incoming interface confusion question [LONG]
Date: Mon, 21 Jun 2004 18:33:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087857206.17059.47.camel@localhost>
References: <40D71EC4.7090900@smxy.org>  <40D736F6.50405@smxy.org>
	 <1087849139.17067.25.camel@localhost>  <40D74F60.6030105@smxy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D74F60.6030105@smxy.org>
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
To: ste@smxy.org
Cc: netfilter@lists.netfilter.org

On Mon, 2004-06-21 at 17:13, Shaun T. Erickson wrote:
> Ok, here's some more detail on what happened.
> 
> I have a SonicWall firewall as my external firewall. Its external 
> address and the address of the systems in the DMZ hanging off of it, are 
> in a pool of 16 real IPs we got from the ISP.
> 
> The LAN port of the SonicWall is connected to a hub. The only other 
> thing connected to the hub is eth0 of my internal iptables 
> router/firewall. I have an internal lan hanging off eth1 of the iptable 
> system, and a second internal lan hanging off eth2 of the iptables 
> system. The SonicWall has two static routes pointing traffic for my 
> internal lans to eth0 on the iptables system. Both of my lans use 
> non-routable private ip address space.
> 
> What happened is that the iptables system dropped what appear to be 
> quite methodical scans of system on one of my lans by sites out on the 
> internet. It saw the packets coming in eth0 and destined to head out 
> eth1 and, based on my rulesets, logged and dropped them.
> 
> The problem is, the iptables system should have never seen them in the 
> first place. The source addresses are from multiple internet sites, 
> coming from either port 80 or port 443, and were destined for the 
> private address space of one of my internal lans. The initial 
> destination port seemed randomly chosen, but then incremented by 1. Most 
> often, 92 bytes was sent to each port, but not always. The ruleset of 
> the SonicWall should not allow such traffic through it. They looked over 
> my ruleset and could find nothing that would allow such traffic to pass 
> their device. Moreover, traffic destined for private non-routable 
> address space can't be routed over the internet, as routers along the 
> way would drop it, so it would seem the traffic couldn't have come in 
> the wan port of the SonicWall. Now, maybe they broke into a system on my 
> DMZ. Well, I did an nmap scan of my internal lan from the DMZ and the 
> sonicwall screamed in it's logs that a port scan was happening and it 
> dropped the packets. The iptables system never saw the scan. So that 
> suggests that it didn't come from my DMZ, either.
> 
> How else could the traffic have arrived? Well, outside the sonicwall, 
> there is a switch between it and my external router. Plugged into that 
> switch is a wireless access point. If someone was on that, the packets 
> would still have to come through the sonicwall to be seen by the 
> iptables system. Sonicwall says the packets could not have come through 
> their device.
> 
> Ok. Next theory: some system on the inside is compromised and spoofing 
> the source address of the packets it sends out. So maybe something on 
> lan2 tried to scan something on lan1. The problem with that is that on 
> the iptables system, I have a rule that says if a packet comes in eth2 
> with a source address other than one from the network attached to that 
> interface, the system is to drop the packet. I have a similar rule for 
> packets coming in eth1 from the other lan. So, that suggests that the 
> packets couldn't have come from the inside, either.
> 
> We have a separate, smaller sonicwall that acts as our vpn concentrator. 
> Only vpn traffic passes through that device. If someone broke in via our 
> vpn, they'd either get a dhcp address on that lan or they could pretend 
> to be something else. If they spoofed packet source from there, again 
> the rule saying drop packets with a source other than that net would 
> kick in.
> 
> So, The ruleset on the sonicwall says it couldn't have come from the 
> outside, and the rulset on the iptables system says it couldn't have 
> come from the inside.
> 
> Now what?
> 
> 	-ste
I have not taken a lot of time to digest your scenario but I'll share a
few spontaneous thoughts.

It is true that RFC 1918 (private) IP addresses do not traverse the
Internet between carriers, however, many carriers use these addresses
internally.  The attack could have come from inside the carrier
network.  Even then, the packets would have to know the path to your
private LAN unless they used source routing or were sitting either on
the network shared by the SonicWall and iptables device or just outside
the SonicWall (since the SonicWall does have a route to your LANs). 
Does your SonicWall let source routed packets through? Were there any
unusual tcp flags set that may have allowed the packet to slip through
the SonicWall? Does the SonicWall advertise its routes? If so, a
wireless intruder would know about them and know that they could be
reached through the SonicWall.

Is it possible the attack did come from a compromised system on the DMZ
and scanned gently enough to not trip the SonicWall port scan detection?
Do you have any HIDS on the DMZ devices to know if they have been
compromised - even something as simple and available as Osiris
(http://osiris.shmoo.com)? Could someone have compromised the SonicWall
itself?

Perhaps the attacker is on the inside - are you sure your anti-spoofing
rules are as tight as you think they are?

You don't say much about where your VPN concentrator drops off its
packets.

Just a couple of random thoughts - I hope they spark something for you -
John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


