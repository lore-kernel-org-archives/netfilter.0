From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: redirecting traffic through firewall problem
Date: Wed, 19 Mar 2003 13:17:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C6B@hslex01.hslbz.local>
References: <244640-22003331992321632@M2W069.mail2web.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <244640-22003331992321632@M2W069.mail2web.com>
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

> my mail goal here is to 
> 
> 1) setup a firewall that enables internet access from the internal LAN
> 2) redirect inbound http and smtp traffic from the external 
> network to web
> servers and mail servers on the lan
> 
> for security I will say here that the external subnet is 
> 192.168.1.* eth1
> the internal network will be described here as 192.168.0.* eth0
> 
> The firewall is assigned to 192.168.1.33
> with three extra ips that are aliased to the same card using ->
> 
> ip addr add 192.168.1.34/27 broadcast 255.255.255.224 dev eth1
> ip addr add 192.168.1.35/27 broadcast 255.255.255.224 dev eth1
> ip addr add 192.168.1.36/27 broadcast 255.255.255.224 dev eth1
> 
> inbound mail to the company is sent to 192.168.1.34 from the 
> isp's smart mail host
> and redirected to 192.168.0.7 redhat linux 7.3 mail server 
> running sendmail
> 
> the company hosts two web sites on the LAN redhat 7.3 linux apache web
> server.
> the addresses below are aliased on that server for the web traffic
> 192.168.0.220 website 1
> 192.168.0.221 website 2

So, what you want is :
192.168.1.34 -> 192.168.0.7
192.168.1.35 -> 192.168.0.220
192.168.1.35 -> 192.168.0.220

Where :
eth0 : 192.168.1.33
eth1 : 192.168.0.?

This may be a start :

----

# Disable forwarding
echo 0 > /proc/sys/net/ipv4/ip_forward

# Default things
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Accept connections from LAN to INET
iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT

# Accept connections for specific services from INET to LAN
iptables -A FORWARD -i eth0 -o eth1 -d 192.168.0.7 -p tcp --dport 25 -j
ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -d 192.168.0.220 -p tcp --dport 80
-j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -d 192.168.0.221 -p tcp --dport 80
-j ACCEPT

# SNAT connections from LAN to INET
iptables -t nat -A POSTROUTING -o eth1 -s 192.168.0.0/24 -j SNAT
--to-source 192.168.1.33

# DNAT specific connections from INET to LAN
iptables -t nat -A PREROUTING -i eth1 -d 192.168.1.34 -j DNAT
--to-destination 192.168.0.7
iptables -t nat -A PREROUTING -i eth1 -d 192.168.1.35 -j DNAT
--to-destination 192.168.0.220
iptables -t nat -A PREROUTING -i eth1 -d 192.168.1.36 -j DNAT
--to-destination 192.168.0.221

# Enable forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

---


Rob


