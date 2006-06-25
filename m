From: Chris Miller <cmiller@servermotion.com>
Subject: Please Review My Rules
Date: Sun, 25 Jun 2006 14:09:21 -0500
Message-ID: <42CD7FAD-A949-4A63-9A0A-873EB8005FAF@servermotion.com>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hey guys, if it's not too much trouble I would like to ask you all to  
take a second and review my rules. I have a CentOS box running  
iptables. I have servers in two different VLAN's (VLAN 5 and VLAN 6)  
that are all assigned private IP addresses in the 10.176.x.x range. I  
assign the public IP addresses to the iptables firewall and use  
static 1:1 NAT to translate traffic to the 10.176.x.x block. The  
public network is in VLAN 9.

In my example below, I have changed the public IP addresses to be  
192.168.x.x just for the sake of not revealing the real IP addresses.

- -----------------------------------
iptables -A INPUT -d 192.168.59.5 -p icmp -j REJECT --reject-with  
icmp-port-unreachable
iptables -A INPUT -d 192.168.59.7 -p icmp -j REJECT --reject-with  
icmp-port-unreachable
iptables -A INPUT -d 192.168.56.8 -p icmp -j REJECT --reject-with  
icmp-port-unreachable
iptables -A INPUT -d 192.168.58.4 -p icmp -j REJECT --reject-with  
icmp-port-unreachable
iptables -A INPUT -d 192.168.58.37 -p icmp -j REJECT --reject-with  
icmp-port-unreachable
iptables -A INPUT -d 192.168.57.6 -p icmp -j REJECT --reject-with  
icmp-port-unreachable

iptables -A FORWARD -o eth0.5 -m state --state  
NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -o eth0.6 -m state --state  
NEW,RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth0.9 -m state --state RELATED,ESTABLISHED -j  
ACCEPT

iptables -t nat -A PREROUTING -d 192.168.56.8 -i eth0.9 -j DNAT --to- 
destination 10.176.56.8
iptables -t nat -A PREROUTING -d 192.168.59.7 -i eth0.9 -j DNAT --to- 
destination 10.176.59.7
iptables -t nat -A PREROUTING -d 192.168.59.5 -i eth0.9 -j DNAT --to- 
destination 10.176.59.5
iptables -t nat -A PREROUTING -d 192.168.58.37 -i eth0.9 -j DNAT --to- 
destination 10.176.58.37
iptables -t nat -A PREROUTING -d 192.168.58.4 -i eth0.9 -j DNAT --to- 
destination 10.176.58.4
iptables -t nat -A PREROUTING -d 192.168.58.21 -i eth0.9 -j DNAT --to- 
destination 10.176.58.21
iptables -t nat -A PREROUTING -d 192.168.58.29 -i eth0.9 -j DNAT --to- 
destination 10.176.58.29
iptables -t nat -A PREROUTING -d 192.168.56.7 -i eth0.9 -j DNAT --to- 
destination 10.176.56.7
iptables -t nat -A PREROUTING -d 192.168.56.5 -i eth0.9 -j DNAT --to- 
destination 10.176.56.5
iptables -t nat -A PREROUTING -d 192.168.56.6 -i eth0.9 -j DNAT --to- 
destination 10.176.56.6
iptables -t nat -A PREROUTING -d 192.168.57.5 -i eth0.9 -j DNAT --to- 
destination 10.176.57.5

iptables -t nat -A POSTROUTING -s 10.176.56.8 -o eth0.9 -j SNAT --to- 
source 192.168.56.8
iptables -t nat -A POSTROUTING -s 10.176.59.7 -o eth0.9 -j SNAT --to- 
source 192.168.59.7
iptables -t nat -A POSTROUTING -s 10.176.59.5 -o eth0.9 -j SNAT --to- 
source 192.168.59.5
iptables -t nat -A POSTROUTING -s 10.176.58.37 -o eth0.9 -j SNAT --to- 
source 192.168.58.37
iptables -t nat -A POSTROUTING -s 10.176.58.4 -o eth0.9 -j SNAT --to- 
source 192.168.58.4
iptables -t nat -A POSTROUTING -s 10.176.58.21 -o eth0.9 -j SNAT --to- 
source 192.168.58.21
iptables -t nat -A POSTROUTING -s 10.176.58.29 -o eth0.9 -j SNAT --to- 
source 192.168.58.29
iptables -t nat -A POSTROUTING -s 10.176.56.7 -o eth0.9 -j SNAT --to- 
source 192.168.56.7
iptables -t nat -A POSTROUTING -s 10.176.56.5 -o eth0.9 -j SNAT --to- 
source 192.168.56.5
iptables -t nat -A POSTROUTING -s 10.176.56.6 -o eth0.9 -j SNAT --to- 
source 192.168.56.6
iptables -t nat -A POSTROUTING -s 10.176.57.5 -o eth0.9 -j SNAT --to- 
source 192.168.57.5
- -----------------------------------

Currently I don't do any filtering, it just forwards any and all  
requests for incoming traffic to whatever I have it set to translate  
to. I'm going to create a separate chain for each server and jump to  
that chain before I do the DNAT or SNAT rules to do traffic  
filtering. Is that a good approach?

Is there anything I should keep in mind when doing this type of setup?

Thanks,

Chris Miller
ServerMotion
www.servermotion.com



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)

iD8DBQFEnt9kxBwlCB7CRwsRAukCAJ91Q6pkkJ4Hc/Fb3PBOVzqjzBvCCACdEOqj
2/DPOQKCVn1n+EEF8s+D5mg=
=I2kw
-----END PGP SIGNATURE-----

