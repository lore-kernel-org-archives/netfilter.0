From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: question regarding pptp
Date: Mon, 11 Apr 2005 15:14:12 +0200
Message-ID: <200504111314.j3BDECQA018701@smtp26.wxs.nl>
References: <42585697.3a8f454b.74e6.34dc@mx.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42585697.3a8f454b.74e6.34dc@mx.gmail.com>
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

 I don't see a NAT rule for the GRE protocol:

Iptables -A PREROUTING -t nat -p 47 -d xxx.xxx.xxx.xxx  -j DNAT -to
yyy.yyy.yyy.yyy

That might be your problem, as said in the error message.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Tom Cruickshank
Sent: 10 April 2005 00:27
To: netfilter@lists.netfilter.org
Subject: question regarding pptp

Hello,

     I have a question regarding pptp. I've read through many documentations
and so far not sure what I've been doing wrong.

 

I have a linux box which acts as a firewall. Port 1723 is ported to a
windows RAS box inside the internal network.

 

Here is what were my iptables rules.

 

Iptables -A PREROUTING -t nat -p tcp -d xxx.xxx.xxx.xxx  -dport 1723 -j DNAT
-to yyy.yyy.yyy.yyy:1723

Iptables -append FORWARD -s yyy.yyy.yyy.0/24 -j ACCEPT

Iptables -table nat -append POSTROUTING -out-interface ppp0 -j MASQUERADE

Iptables -append FORWARD -p 47 -s yyy.yyy.yyy.0/24 -j ACCEPT

 

xxx.xxx.xxx.xxx = external IP

yyy.yyy.yyy.yyy = internal ip (ip for windows server)

 

I was able to connect to the vpn server without any problems. Then the
external IP changed.

 

After changing the external IP in the iptables info, I keep getting 

 

A connection between the VPN server and the VPN client xxx.xxx.xxx.xxx has
been established, but the VPN connection cannot be completed. The most
common cause for this is that a firewall or router between the VPN server
and the VPN client is not configured to allow Generic Routing Encapsulation
(GRE) packets (protocol 47). Verify that the firewalls and routers between
your VPN server and the Internet allow GRE packets. Make sure the firewalls
and routers on the user's network are also configured to allow GRE packets.
If the problem persists, have the user contact the Internet service provider
(ISP) to determine whether the ISP might be blocking GRE packets.

 

For more information, see Help and Support Center at

 

As far as I can tell, the GRE packets SHOULD be going through.

 

I've modified the Iptables to something like this without any success.

 

iptables -A PREROUTING -t nat -p tcp -d xxx.xxx.xxx.xxx --dport 1723 -j DNAT
--to yyy.yyy.yyy.yyy:1723

 

iptables -m state -A FORWARD -p tcp -s xxx.xxx.xxx.xxx/32 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p udp -s xxx.xxx.xxx.xxx/32 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p tcp -s yyy.yyy.yyy.0/24 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p udp -s yyy.yyy.yyy.0/24 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p 47 -s xxx.xxx.xxx.xxx/32 --state NEW -j
ACCEPT

iptables -m state -A FORWARD -p 47 -s yyy.yyy.yyy.0/24 --state NEW -j ACCEPT

 

iptables -m state -A FORWARD -p 47 --state ESTABLISHED,RELATED -j ACCEPT

iptables -m state -A FORWARD -p tcp --state ESTABLISHED,RELATED -j ACCEPT

iptables -m state -A FORWARD -p udp --state ESTABLISHED,RELATED -j ACCEPT

 

iptables -A input -p 47 -s yyy.yyy.yyy.0/24 -d xxx.xxx.xxx.xxx -j ACCEPT

iptables --append FORWARD -p tcp --destination-port 1723 --jump ACCEPT

 

iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE

iptables --append FORWARD -s yyy.yyy.yyy.0/24 -j ACCEPT

 

Would anyone have a clue what I might be doing wrong? Would appreciate any
assistance. Thanks!

 

Sincerely,

 

Tom Cruickshank


--
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.9.5 - Release Date: 4/7/2005
 


