From: Misterke <netfilter@quintux.com>
Subject: Re: Problems with bridge+router setup
Date: Mon, 28 Dec 2015 10:57:11 +0100
Message-ID: <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
 <20151227142118.27861ea5@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20151227142118.27861ea5@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Thanks Neal!

I removed eth1 from the auto line and changed stp to on instead of off. 
However, in parallel to that I also noticed a stupid DHCP config 
mistake: both the WIFI and the wired MAC of my client notebook were 
getting the same (hard configured) IP address assigned.  Normally this 
notebook operates via WIFI, but for the test here I would hook it wired 
to the RPi2 ... I guess then getting the same IP for the wired as the 
WIFI already had can totally screw up things.

Anyway, with all this modified, basic bridging seems to work fine, so 
time to move on to the more complex things I need, but also have 
numerous questions on how to get them done ...

Reduced to the minimal, the needed setup would look something like 
this:

         +------+
   A ----|      |   single IP link   +------+       +-----------+
         |Switch|--------------------| RPi2 |-------|Cable modem|
   B ----|      |                eth1+------+eth0   +-----------+
         +------+

Here client A is a normal network device for which the network it is 
connected to should look like a normal LAN and the RPi2 should act as 
firewall, DHCP & DNS server, etc.  In short: for client A the RPi2 
should look like a typical router/firewall.

Client B however is a Digital TV box and my triple-play provider 
unfortunately requires those to be directly connected to the cable 
modem, which will hand them actually a DHCP address in a particular 
range and probably do other special stuff.  In short: for client B the 
entire network between itself and the cable modem should consist solely 
of hubs/switches/bridges and hence for it to work the RPi2 should behave 
as a simple bridge.

In reality there will be more clients of both A and B type and there 
will be additional switches between the RPi2 and the clients, but in 
most locations I only have a single lead arriving (can't be changed 
without major costs) whereas I need to attach both clients of type A and 
B.

So, what I would like the RPi2 to do is:
  - For ethernet frames TO or FROM specific MAC adresses (those of 
clients of type B) on its eth1 side, just pass them on from/to eth0
  - For anything else, behave like a router and have iptables rules 
dictate what is allowed and when outputting to the eth0-side do 
NAT/masquerading

I was thinking this would mean (but have to try this still):
  - with ebtables (where xx indicates the mac of client B):
      * -t broute -A BROUTING -i eth0 -d 
xx:xx:xx:xx:xx:xx/01:00:00:00:00:00 -j ACCEPT
      * -t broute -A BROUTING -i eth1 -s 
xx:xx:xx:xx:xx:xx/01:00:00:00:00:00 -j ACCEPT
      * -t broute -P BROUTING DROP
  - with iptables:
      * -t nat -A POSTROUTING -m physdev --physdev-out eth0 -j 
MASQUERADE
      * -P INPUT DROP
      * -P FORWARD DROP
      * -A FORWARD -m physdev --physdev-in eth1 -j ACCEPT
      * -A FORWARD -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT
      * -A FORWARD -m state --state ESTABLISHED -j ACCEPT
      * -A FORWARD -m state --state RELATED -j ACCEPT
      * -A INPUT -m physdev --physdev-in eth1 -j ACCEPT
      * -A INPUT -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT
      * -A INPUT -m state --state ESTABLISHED -j ACCEPT
      * -A INPUT -m state --state RELATED -j ACCEPT
      * -A INPUT -p udp -m udp --dport 1024:65535 --sport 53 -j ACCEPT
      * -A INPUT -p icmp -m icmp --icmp-type echo-reply -j ACCEPT
      * -A INPUT -p icmp -m icmp --icmp-type destination-unreachable -j 
ACCEPT
      * -A INPUT -p icmp -m icmp --icmp-type source-quench -j ACCEPT
      * -A INPUT -p icmp -m icmp --icmp-type time-exceeded -j ACCEPT
      * -A INPUT -p icmp -m icmp --icmp-type parameter-problem -j ACCEPT
      * -A INPUT -p tcp -m tcp --dport auth -j ACCEPT
      * -A INPUT -p tcp -m tcp -m multiport -j ACCEPT --dports 22,443

So, first question of course would be whether this seems sensible and 
whether any of you can give some
input on mistakes or possible improvements.

But I also have additional questions:
   - To act as a router, I need IP addresses at both sides of the 
bridge.  At the eth0 side, that should
     be a DHCP address coming from the cable modem, but at the other end 
it should be a static address.
     Now, in the previous simple bridge setup, I already had the bridge 
get a DHCP address and I could
     even add a second static address to br0, but then those addresses 
would exist at both ends of the
     bridge, right?  So, should I then create ebtables/iptables rules 
somehow to avoid that someone
     would notice the internal IP address on the internet and vice 
versa?
   - Next to that, when running dnsmasq to hand out DHCP addresses, I of 
course don't want it to start
     offering addresses to the Internet side of the bridge.  So, either 
I somehow need to tell dnsmasq
     to only work on the LAN side (eth1) or perhaps I would again have 
to somehow limit this with
     ebtables/iptables.

Any advice from anyone on all this?

Again thanks to anyone who can offer tips, hints, ideas ...

Kind regards,
K
