From: Mikael Nehlsen <joyride-02ecni/8Nmo@public.gmane.org>
Subject: bridge+nat
Date: Fri, 14 Jan 2005 18:44:26 +0100
Message-ID: <41E804FA.2020309@sics.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Sender: ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Errors-To: ebtables-user-admin-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ebtables-user>,
	<mailto:ebtables-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum=ebtables-user>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ebtables-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

Hi!

I am posting this in ebtables and iptables mailing lists since I think 
it might have to do with both.

I have an interesting problem that I tried to solve for a while now. I 
am trying to make a wavelan gateway much like nocat but with a small 
twist. I want it to be able to forward packets with real ip:s as well as 
nat:ed ip:s.
When I set it up it does usually work for a few minutes then the bridged 
addresses start giving me a hard time. It works just fine if I open up a 
path through the gateway for them but I want to have some kind of 
authentication system (web) for the uses before they get out into the 
world freely. So when I connect a computer it gets an ip-address, if it 
gets a real ip it can talk to the gateway computer (for a while) then 
after a while it can't anymore.
I have tried pinging the box with the real ip, after it stopped being 
able to talk to the gateway box, from the gateway box and what I see is 
that the gateway box sends out the icmp requests on the wrong interface 
even though I can see that it knows that the mac address of the box it 
pings is on the other interface with brctl showmacs br0.
For nat:ed addresses I haven't noticed any problems so far.

The internet is connected to eth0 and the wavelan is connected to eth1.

The script I use looks like this:

#!/bin/bash
#Some parameters (the 10 addresses here represent real addresses on the 
#net)
DHCPSERVER=10.0.0.10
NAMESERVER=10.0.0.10
NAMESERVER2=10.0.0.11
OUTIP=10.0.0.5
NATNET=192.168.50.0/24

#A second interface to use as gateway for the nat
ifconfig br0:1 192.168.50.1 netmask 255.255.255.0

#The DHCP relay agent for some fancy scripting in the dhcpd.conf file on
#the real DHCP server
killall dhcrelay
dhcrelay -i br0  -a -d -A 1400 $DHCPSERVER &

#Flush all rules
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
ebtables -F
ebtables -t broute -F

#Set some default actions
iptables -P INPUT DROP
iptables -P FORWARD DROP
ebtables -P FORWARD DROP

#DHCP stuff so that the dhcrelay only relay inside requests
ebtables -A INPUT -i eth0 -d ff:ff:ff:ff:ff:ff/ff:ff:ff:ff:ff:ff -p IPv4 
--ip-prot udp --ip-dport 67:68 -j DROP

#fixing for some stupid boxes that answer that they have all private
#addresses
ebtables -A INPUT -i eth0 -p arp --arp-ip-src $NATNET -j DROP

#Accept everything from the outside to the inside
ebtables -t filter -A FORWARD -i eth0 -j ACCEPT

#Letting dns requests trough
ebtables -t filter -A FORWARD -i eth1 -p IPv4 --ip-dst $NAMESERVER 
--ip-proto udp --ip-dport 53 -j ACCEPT
ebtables -t filter -A FORWARD -i eth1 -p IPv4 --ip-dst $NAMESERVER2 
--ip-proto udp --ip-dport 53 -j ACCEPT
ebtables -t filter -A FORWARD -i eth1 -p ARP --arp-ip-dst $NAMESERVER -j 
ACCEPT
ebtables -t filter -A FORWARD -i eth1 -p ARP --arp-ip-dst $NAMESERVER2 
-j ACCEPT
iptables -A FORWARD -m physdev --physdev-in eth1 -m udp -p udp --dport 
53 -d $NAMESERVER -j ACCEPT
iptables -A FORWARD -m physdev --physdev-in eth1 -m udp -p udp --dport 
53 -d $NAMESERVER2 -j ACCEPT

#More from the outside
iptables -A FORWARD -m physdev --physdev-in eth0 -j ACCEPT

#Accept everything else into the machine
iptables -A INPUT -j ACCEPT

#More DHCP stuff
iptables -I INPUT -m udp -p udp --dport 67:68  -j DROP
iptables -I INPUT -m physdev --physdev-in eth1 -m udp -p udp --dport 
67:68 -j ACCEPT
iptables -I INPUT -m physdev --physdev-in eth0 -m udp -p udp --dport 
67:68 -s $DHCPSERVER -j ACCEPT

#Masquerading
iptables -t nat -A POSTROUTING -m physdev --physdev-in eth1 -s $NATNET 
-j SNAT --to-source $OUTIP

#Redirect web traffic
iptables -t nat -A PREROUTING -m physdev --physdev-in eth1  -p tcp 
--dport 80 -j REDIRECT
iptables -t nat -A PREROUTING -m physdev --physdev-in eth1  -p tcp 
--dport 443 -j REDIRECT

#Start forwarding in the kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

And then I use these short scripts to open up and close traffic for people:

#open
ebtables -t filter -A FORWARD -i eth1 -s $MACADDRESS -j ACCEPT
iptables -t nat -I PREROUTING -m physdev --physdev-in eth1 -s $IPADDRESS 
-j ACCEPT
iptables -A FORWARD -s $IPADDRESS -j ACCEPT

#close
ebtables -t filter -D FORWARD -i eth1 -s $MACADDRESS -j ACCEPT
iptables -t nat -D PREROUTING -m physdev --physdev-in eth1 -s $IPADDRESS 
-j ACCEPT
iptables -D FORWARD -s $IPADDRESS -j ACCEPT



I must do something wrong, does anyone know what?

Here are some additional facts, I run fedora core 2 on the box using the 
2.6.10-1.8_FC2smp kernel the networkcards are "Intel Corp. 82541GI/PI 
Gigabit Ethernet Controller".

Sorry for the confused mail.

I would be very happy if someone can solve my problem or atleast give me 
a pointer in the right direction.

/Mikael


-------------------------------------------------------
The SF.Net email is sponsored by: Beat the post-holiday blues
Get a FREE limited edition SourceForge.net t-shirt from ThinkGeek.
It's fun and FREE -- well, almost....http://www.thinkgeek.com/sfshirt
