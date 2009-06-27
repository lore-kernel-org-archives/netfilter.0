From: "fvancrae@telenet.be" <fvancrae@telenet.be>
Subject: DHCP issue - iptables rules not hit when using ebtables - MAC based
 firewall bypass
Date: Sat, 27 Jun 2009 09:57:34 +0200
Message-ID: <4A45D0EE.50400@telenet.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

How can I block the DHCP request or answer for a specific MAC adress 
using iptables/ebtables?

I am using ebtables on my firewall to have one consumer device (client) 
bypass the firewall entirely and act as if it is directly connected to 
the internet.

For this I create a bridge (non transparant) and specify a MAC based 
rule in the BROUTING chain
 -s MAC -i eth1 -j ACCEPT
 -d MAC -i eth0 -j ACCEPT
 BROUTING POLICY DROP

eth0 is my routers WLAN interface
eth1 is my routers LAN interface

Then I wanted to block the DHCP request for that MAC on my firewall (who 
is DHCPD)
but it seems that no iptable or ebtable rule can be used to block this 
packet (or even an outgoing packet of my DHCPD)

My client always gets an IP inside my LAN.

!!This entire setup however works if I disable my DHCPD temporarily, 
boot my client (=get an external IP)
so it is really only a problem of blocking DHCP requests/responses!!

In document 'ebtables/iptables interaction on a Linux-based bridge'
http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html
I was led to believe that iptables FILTER chain INPUT and OUTPUT are 
still traversed


My bridge config:

brctl adbr br0
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig br0 up



TIA,
Frederic
