From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Denial-of-Service attack on UDP-port 5060 (SIP/VoIP)
Date: Wed, 1 Dec 2010 09:48:52 -0600
Message-ID: <20101201154852.GY23013@cardinal>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600> <4CF2A686.4000309@plouf.fr.eu.org> <72283C9ECA07450499E7F3DDA655791F@gericomfx5600> <90A4182DE3E342C191D86AE9095836B6@gericomfx5600>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <90A4182DE3E342C191D86AE9095836B6@gericomfx5600>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Mon, Nov 29, 2010 at 10:38:32PM +0100, Secure-SIP-Server wrote:
> Thanks to all your thoughts!

Unfortunately due to power problems I have had daily shutdowns 
resulting in IP address changes, so my Asterisk console is staying 
quiet until the searchbots find me. I'm hoping for a week or two on
the same IP, so I can accumulate some results.

At this point I will just share my ruleset, in relevant part:

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

:AllowHosts - [0:0]
:BadGuy - [0:0]
:Brake - [0:0]
:DropHosts - [0:0]
:Rejects - [0:0]
:State - [0:0]
:WAN - [0:0]

-A INPUT -j DropHosts
-A INPUT -j State
-A INPUT -j AllowHosts

# This chain allows known external hosts and my own networks
-A AllowHosts -i lo -j ACCEPT
-A AllowHosts -i eth0 -j ACCEPT
-A AllowHosts -i tun+ -j ACCEPT
-A AllowHosts -i wlan+ -j ACCEPT
-A AllowHosts -s x.y.z.48/29 -j ACCEPT
-A AllowHosts -s p.q.r.72/29 -j ACCEPT
# following is a SIP origination provider
-A AllowHosts -s 66.54.140.0/23 -m comment --comment "ipkall" -j ACCEPT
# following are SIP termination providers
-A AllowHosts -s 204.8.45.222 -m comment --comment "tfg" -j ACCEPT
-A AllowHosts -s 64.2.142.0/24 -m comment --comment "vitelity" -j ACCEPT
# and for anything which remains, from the Internet interface:
-A AllowHosts -i eth1 -j WAN

# Packets come here when we have determined that they are an attack
-A BadGuy -p tcp --dport 22 -j LOG --log-prefix "SSH attacker: "
-A BadGuy -p udp --dport 5060 -j LOG --log-prefix "SIP attacker: "
-A BadGuy -m recent --set --name BADGUY -j DROP

# Brake means "slow down" a possible attack. We allow 3 in 0:30 for 
# SSH attempts, 9 in 0:30 for SIP, then reject the next few up to 6
# in 0:45 for SSH and 18 in 0:45 for SIP. A host who has exceeded
# those limits is deemed an attacker (-j BadGuy).
-A Brake -p tcp -m recent --rcheck --hitcount 6 --name BRAKE --seconds 45 -j BadGuy -m comment --comment "SSH attacker"
-A Brake -p udp -m recent --rcheck --hitcount 18 --name BRAKE --seconds 45 -j BadGuy -m comment --comment "SIP attacker"
-A Brake -p tcp -m recent --update --hitcount 3 --name BRAKE --seconds 30 -j REJECT --reject-with tcp-reset -m comment --comment "probable SSH attack"
-A Brake -p udp -m recent --update --hitcount 9 --name BRAKE --seconds 30 -j REJECT --reject-with icmp-port-unreachable -m comment --comment "probable SIP attack"
-A Brake -m recent --set --name BRAKE -j ACCEPT -m comment --comment "adds source IP to BRAKE list"

# This chain comes first, and drops known attackers
-A DropHosts -m recent --rcheck --name BADGUY -j DROP -m comment --comment "checks to see if source IP has attacked us"
-A DropHosts -m mac --mac-source 00:0F:9F:6F:14:F0 -m comment --comment "example DropHosts rule" -j DROP

-A Rejects -i eth0 -m comment --comment "from LAN"
-A Rejects -i wlan+ -m comment --comment "from Wifi"
-A Rejects -i eth1 -m comment --comment "from WAN"
-A Rejects -i tun+ -m comment --comment "from VPN"
-A Rejects -p tcp -j REJECT --reject-with tcp-reset
-A Rejects -m comment --comment "This takes the place of a default DROP policy" -j DROP
-A Rejects -m comment --comment "This should always be [0:0]" -j DROP

# The second chain, has the SIP bypass
-A State -m conntrack --ctstate INVALID -j DROP
-A State -m conntrack --ctstate RELATED -j ACCEPT
-A State -i eth1 -p udp --dport 5060 -j AllowHosts -m comment --comment "later goes to WAN"
-A State -m conntrack --ctstate ESTABLISHED -j ACCEPT

# Packets coming in the external interface come here
-A WAN -p tcp --dport 22 -j Brake
-A WAN -p udp --dport 1194 -j ACCEPT -m comment --comment "openvpn"
-A WAN -m conntrack --ctstate NEW -p udp --dport 5060 -j LOG --log-prefix "NEW SIP: "
-A WAN -p udp --dport 5060 -j Brake
-A WAN -p icmp -m icmp --icmp-type 0 -m limit --limit 5/min --limit-burst 3 -j ACCEPT
-A WAN -p icmp -m icmp --icmp-type 0 -j DROP
-A WAN -p icmp -j ACCEPT
-A WAN -i eth1 -m comment --comment "from WAN" -j Rejects

> I found a solution on how to tell iptables not to see the 
> continuous flow of SIP-packets as an ESTABLISHED connection. I 
> split
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> into
> # iptables -A INPUT -p ! udp -m state --state ESTABLISHED -j ACCEPT

This is wrong. You probably want UDP ESTABLISHED packets, in general, 
my ruleset above only separates out SIP.

> # iptables -A INPUT -m state --state RELATED -j ACCEPT
> The ESTABLISHED rule has not to work for UDP, so I excluded it. I 
> don't know why iptables does not exclude it by default! Someone 
> knows???

This is wrong too. ESTABLISHED is fine for UDP; our problem here 
being that the attack bots use the same --source-port for the whole 
attack, and that by having sent our SIP reply to the initial few 
registration attempts, connection tracking considers these to be in
ESTABLISHED state.

> Now I can put below:
> # iptables -A INPUT -p udp --dport 5060 -m recent --name  
> DENIAL_OF_SERVICE --update --seconds 1 --hitcount 20 -j REJECT 
> --reject-with icmp-admin-prohibited
> # iptables -A INPUT -p udp --dport 5060 -m recent --name  
> DENIAL_OF_SERVICE --set -j ACCEPT
>
> This works for me!!! < I'm happy!!! :-)) >

We're trying with different numbers. After I've accumulated some 
results with my numbers, I might try shorter --seconds values.

> Now the malicious UDP-packet stream
> - always pass the ESTABLISHED rule
> - first pass the upper DENIAL_OF_SERVICE rule
> - and some packets are accepted by the second DENIAL_OF_SERVICE rule 
> (about 4 or 5 REGISTER requests)
> - but then the first DENIAL_OF_SERVICE rule rejects all following 
> spam from this IP (requests from other IPs are still accepted!), 
> and it is doing this now since hours rejecting several hundred MB 
> traffic received.

You might find that the same host will continue to bombard you 
indefinitely. I think there is a bug in the malware. :)

> All others with normal traffic can pass to my SIP-Server without 
> problems! @ marcos: Of course I could also drop the packets instead 
> of rejecting them, but I prefer this for the moment with: 
> icmp-admin-prohibited.

I think you should DROP known attackers. When I was under that attack 
from mid-November, the ICMP would have significantly hurt my limited 
upstream bandwidth (cheap rural consumer-grade DSL here.)

If I ever convert to business-class DSL here, which I might, I'd 
demand service from the ISP when my static IP is under such attack. 
I'd insist to have it blocked upstream.
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
