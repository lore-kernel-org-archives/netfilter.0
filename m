From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: RE : [IP ?] what ip must be filtered ?
Date: Thu, 11 Dec 2003 08:04:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071147873.1871.27.camel@jasiiitosh.nexusmgmt.com>
References: <015501c3bfdb$de9c8ad0$02fea8c0@ALESK>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <015501c3bfdb$de9c8ad0$02fea8c0@ALESK>
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
To: Tanen <tanen@tanen.dyndns.org>
Cc: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Thu, 2003-12-11 at 06:42, Tanen wrote:
> Hellon
> Thanks for your help,
> This dedicated box, is on my local network, but don't be a reuters, just a
> server, i have a hard reuters, with hard firewall integrate in this reuters.
> My question is not realy clear, i try again to explain it :
> I want block, all attack, and all flood or other shit related to the
> hackers, of my server, for this, i have only forward few ports on my
> hardware reuters, 80, 110, 25, 143, 21, 53, 443, 993, all others are blocked
> by the hardware firewall. Now i want prevent any thing would be attempt by
> using this ports. So i want create an firewall for prevent this, and
> authorise ALL traffic in the local network, but filtering the outgoing
> packets from the server, for not allow any other things that the things
> requested by the puters itself. I'm not sure to be clear if no, i can try
> again to explain it, but i'm not speaking english very well, that's not my
> main language. I'm a realy begginer to Iptables, and a novice to Linux. Ihe
> local network, but filtering the outgoing packets from the server, for not
> allow any other things that the things requested by the puters itself. I'm
> not sure to be clear if no, i can try again to explain it, but i'm not
> speaking english very well, that's not my main language. I'm a realy
> begginer to Iptables, and a novice to Linux. I'm listening ALL help ... :)
> and any help would be appreciated.
> <snip>---> > i'm filtering my local ip, or my external ip, my mail server, isn't
> ---> getting
> ---> > any mail from www, someone can help me please ?
> ---> 
> ---> The simplest way to do what you want is not to think about IP addresses
> ---> so
> ---> much as which interface they're connected to.
> ---> 
> ---> Let's assume that your firewall has 192.168.0.100 on eth0 (private,
> ---> internal)
> ---> and 63.x.y.z on eth1 (public, external)
> ---> 
> ---> Then a good start to your ruleset would be:
> ---> 
> ---> iptables -P FORWARD DROP
> ---> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
> ---> iptables -A FORWARD -i eth1 -o eth0 -m state --state
> ---> ESTABLISHED,RELATED -j
> ---> ACCEPT
> ---> iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to 63.x.y.z
> ---> 
> ---> An improvement on the above rules would be to be more restrictive about
> ---> what
> ---> traffic you allow from internal clients to the Internet, however this
> ---> is a
> ---> start.
> ---> 
> ---> If you don't understand anything about the above rules feel free to ask
> ---> again.
> ---> 
> ---> Antony.
<snip>

Let me try to rephrase your question first so we can try to understand
it better.
You have a physical router with a firewall between your internal network
and the Internet.  This is NOT the iptables firewall.  It is forwarding
ports to your internal network.  Are you saying that on that network you
have an iptables firewall and you want to use it to restrict inbound
traffic to only be the reply packets to sessions the internal computers
have initiated?

If this is true, then your first problem is a routing one.  How do you
get all packets to pass through the iptables device.  Probably the
cleanest way is to create a new network so that the iptables device has
two interfaces - one connected to the router and the other to an
entirely different network - different IP address.  Then you can set the
default gateway of the local computers to the iptables computer.

An alternative is to forward all traffic from the router to the iptables
server and set the default gateway of all the local computers to be the
iptables server.  You must be careful to make sure that no one is
listening to redirection packets or the traffic flow will be diverted
from the iptables server to be directly between the hardware router and
the local computers.  You will generate a constant stream of redirection
notifications on you network unless you also turn off the ability to
send ICMP redirects.

Once you have your routing straight, then we can worry about filtering
packets.  As already described, the easiest way to assure that only
outbound initiated traffic is allowed is set DENY policies and then
allow:
iptables -A FORWARD -i eth1 -m state --state NEW - j ACCEPT
iptables -A FORWARD -i eth0 -m state --state RELATED, ESTABLISHED -j
ACCEPT

Do I correctly understand that you have an e-mail server? Are you sure
that you do not need to allow inbound initiated traffic to this device?
In other words, do other devices on the Internet send e-mail to it
without it first asking for the e-mail? If so, then you will need to add
rules to allow this inbound initiated traffic.  It would be wisest to
put this "public" server on a separate network connected to the iptables
server, a DMZ, to keep it away from the internal computers.

Finally, you will need to worry about malicious traffic traveling on the
allowed ports.  Here is an example of some rules that I load with
iptables-restore -n (thus the different syntax) for such protection.  I
am sure they could be greatly improved:

*mangle
:PREROUTING ACCEPT
:INPUT ACCEPT
:OUTPUT ACCEPT
:FORWARD ACCEPT
:POSTROUTING ACCEPT
-I PREROUTING 1 -p 6 -j ProtectionMangleTCP
-I PREROUTING 1 -p 1 -j ProtectionMangleICMP
-A ProtectionMangleBadTCP -p 6 -m tcp --tcp-flags SYN,ACK SYN,ACK -m
state --state NEW -m limit --limit 1/s -j LOG --log-level warning
--log-prefix "[SYN,ACK First Packet] "
-A ProtectionMangleBadTCP -p 6 -m tcp --tcp-flags SYN,ACK SYN,ACK -m
state --state NEW -j DROP
-A ProtectionMangleBadTCP -m limit --limit 1/s -j LOG --log-level
warning --log-prefix "[Suspect TCP Flags] "
-A ProtectionMangleBadTCP -j DROP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags SYN,ACK SYN,ACK -m state
--state NEW -j ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ALL ALL -j
ProtectionMangleBadTCP 
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ALL NONE -j
ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags SYN,FIN SYN,FIN -j
ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags SYN,RST SYN,RST -j
ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags RST,FIN RST,FIN -j
ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ACK,FIN FIN -j
ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags ACK,PSH PSH -j
ProtectionMangleBadTCP
-A ProtectionMangleTCP -p 6 -m tcp --tcp-flags URG,ACK URG -j
ProtectionMangleBadTCP
-A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -d 255.255.255.255 -m
limit --limit 1/s -j LOG --log-level warning --log-prefix "[Broadcast
Ping] "
-A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -d 255.255.255.255 -j
DROP
-A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -m limit --limit
200/s --limit-burst 500 -j RETURN
-A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -m limit --limit 1/s
-j LOG --log-level warning --log-prefix "[Ping Flood] "
-A ProtectionMangleICMP -p 1 -m icmp --icmp-type 8 -j DROP

mangle
-I PREROUTING 1 -f -i eth1 -j DROP # fragments
-A PREROUTING -i ! $PUBLICIF -s $PRIVATENETWORK -j DROP # anti-spoofing
COMMIT

You may also want to look at some of the settings available to you via
/proc to handle spoofing, source route bridging, icmp redirects, etc.

You may want to take a tour through Oskar Andreasson's fine tutorial on
the netfilter web site.
You can also find an iptables slide show in the training section at
http://iscs.sourceforge.net

Have I understood your questions properly?

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


