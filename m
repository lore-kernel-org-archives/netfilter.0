From: Mike McLean <libolt@libolt.net>
Subject: Continuing Tribes 2 problems with NAT
Date: Fri, 21 Nov 2003 12:42:05 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311211242.05614.libolt@libolt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I have a tribes 2 server behind an iptables NAT system.  I have forwared the 
ports for Tribes 2 to the server.  It connects to the master server and show 
sup in the servers list.  However it shows up with it's internal IP address, 
not the public IP the network connects to the internet with.  This seems to 
cause problems for those outside the lan trying to connect to the server.

Below I have listed my iptables rules set.  Any help is appreciated:

iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F -t mangle
iptables -F -t nat
iptables -X

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 37373 -j DNAT --to 
192.168.0.1:37373

# Tribes 2 ports forwarded
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 27999 -j DNAT --to 
192.168.0.7:27999

iptables -t nat -A PREROUTING -i eth0 -p udp --dport 28000 -j DNAT --to 
192.168.0.7:28000
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 28000 -j DNAT --to 
192.168.0.7:28000
iptables -A FORWARD -i eth0 -o eth1 -p udp -d 192.168.0.7 --dport 28000 -j 
ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 192.168.0.7 --dport 28000 -j 
ACCEPT

iptables -t nat -A PREROUTING -i eth0 -p udp --dport 28001 -j DNAT --to 
192.168.0.7:28001
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 28001 -j DNAT --to 
192.168.0.7:28001
iptables -A FORWARD -i eth0 -o eth1 -p udp -d 192.168.0.7 --dport 28001 -j 
ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 192.168.0.7 --dport 28001 -j 
ACCEPT

iptables -t nat -A PREROUTING -i eth0 -p udp --dport 28001:29000 -j DNAT --to 
192.168.0.7:28001-
29000
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 15101 -j DNAT --to 
192.168.0.7:15101
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 15104 -j DNAT --to 
192.168.0.7:15104
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 15024 -j DNAT --to 
192.168.0.7:15024
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 15206 -j DNAT --to 
192.168.0.7:15206
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 15800 -j DNAT --to 
192.168.0.7:15800

echo 1 > /proc/sys/net/ipv4/ip_forward


Mike


