From: "Hudson Delbert J Contr 61 CS/SCBN" <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: Protecting multiple webservers
Date: Wed, 19 Jan 2005 13:07:13 -0800
Message-ID: <186AC876521E0F46BDE77079A6567FD06F5F87@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: gui <whereisgui@gmail.com>, netfilter@lists.netfilter.org

are these webservers goingto be part of a cluster or do they need to =
have there own resolved hostnames?
we need more info as there are several different ways to do this.

are they to be part of virtual hosting scenario ?

more info, plz...

~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of gui
Sent: Wednesday, January 19, 2005 12:37 PM
To: netfilter@lists.netfilter.org
Subject: Re: Protecting multiple webservers


Hi,

I did some work but I still can't get my new set up to work.

I'm going describe my problem again to avoid confusions.

Some background info:
Firewall: linux kernel 2.6.9-1.667 & iptables v1.2.11
Zinfandel and Cabernet (not the actual names) are web servers with
real domain names and public IP addresses.
Zinfandel's  public IP address x.x.174.104
Cabernet's   public IP address x.x.174.106		    =20
I don't have access to the DNS server and the IT dept doesn't want to
make any changes to the DNS server.

Problem: I need to put two web servers behind a firewall without
making changes to the DNS server.

My new set up:

   Zinfandel              Cabernet   =20
  192.168.0.2	     192.168.0.3
	 |		             |
	 `---------- ------------'
	            |
	          switch       =20
	            |
	            |    eth1 192.168.01 =20
	       FIREWALL
		    |    eth0 x.x.174.103 (Primary address)
		    |    eth0:0 x.x.174.104
		    |    eth0:1 x.x.174.106
		    |
		Internet =20

I added the two IP addresses to eth0 using iproute2 as previously
suggested and I can ping the new addresses without a problem. I can
even connect to the firewall with SSH using those addresses. This
tells me that anti-arp spoofing is not an issue on the network and
that I can have multiple IP addresses binded to one NIC. However, the
forward rules don't work. I will appreciate any help that you can
provide.

The following is my ruleset file:

# Firewall configuration written by system-config-securitylevel
# Manual customization of this file is not recommended.
*filter

:INPUT DROP
:FORWARD DROP
:OUTPUT ACCEPT

# allow local loopback connections
-A INPUT -i lo -j ACCEPT

# allow pings
-A INPUT -i eth0 -p icmp -j ACCEPT

# drop INVALID connections
-A INPUT   -m state --state INVALID -j DROP
-A OUTPUT  -m state --state INVALID -j DROP
-A FORWARD -m state --state INVALID -j DROP

# allow all established and related
-A INPUT        -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT    -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT


# allow connections to DNS servers
-A OUTPUT  -d x.x.100.129 -m state --state NEW -p udp --dport 53 -o
eth0 -j ACCEPT

#allow computers behind the firewall to access the DNS servers.
-A FORWARD -d x.x.100.129 -m state --state NEW -p udp --dport 53 -i
eth1 -o eth0 -j ACCEPT

# allow incoming SSH connections
#Only my desktop can ssh to the firewall
-A INPUT -i eth0 -s x.x.174.12 -p tcp --dport ssh -j ACCEPT=20

# allow outgoing connections from web servers.
# added these lines so I can browse the web from the web servers=20
-A OUTPUT -d 0/0 -m state --state NEW -p tcp -m multiport --dport
http,https -o eth0 -j ACCEPT

-A FORWARD -s 192.168.0.3 -d 0/0 -m state --state NEW -p tcp -m
multiport --dport http,https -o eth0 -i eth1 -j ACCEPT
-A FORWARD -s 192.168.0.2 -d 0/0 -m state --state NEW -p tcp -m
multiport --dport http,https -o eth0 -i eth1 -j ACCEPT

COMMIT

*nat
#set up IP forwarding and nat
#This is the primary IP address for eth0
-A POSTROUTING -o eth0 -j SNAT --to x.x.174.103

# forward ports to the proper servers
-A PREROUTING -i eth0 -p tcp -d 130.17.174.104 --dport 80 -j DNAT --to
192.168.0.2:80
-A PREROUTING -i eth0 -p tcp -d 130.17.174.106 --dport 80 -j DNAT --to
192.168.0.3:80

COMMIT

Thanks.


