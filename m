From: manish <manishsoft@yahoo.com>
Subject: Re: help with wireless routing
Date: Thu, 31 Jul 2003 08:33:42 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030731153342.51145.qmail@web13708.mail.yahoo.com>
References: <3F287001.6E47AC4B@optonline.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F287001.6E47AC4B@optonline.net>
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
Content-Transfer-Encoding: 7bit
To: Jason <arnjuka@optonline.net>, netfilter@lists.netfilter.org

You are trying to build up a Mixed network: wired,
wireless and Internet.
Just look a simple example.

                Internet
		   |
		   |     E
		   |   /
		   | /		   
      A------------C- - - - -F   Wireless
      | \_      _/ | \
Wired |	  \____/   |   \
      |	 _/    \_  |     G
      |	/	 \ |
      B------------D 

The box C has 3 network connections:

eth0 - dsl
eth1 - wired network
wlan0 - wifi network

What IP Address You are assigning to hosts? You have 2
possible solutions:

   1) Split up network in 2 subnets: for example  
      192.168.1.0/24 and 192.168.2.0/24.This solution 
      is quickly but is not scalable if you are using 
      Internet IP addresses coz you have to drop too 
      many IPs.

   2) Enable Proxy Arp feature to C for all 2 
      interfaces. Network parameters (net address and 
      netmask) are the same for Wireless and Wired,
      but with proxy-arp enabled you can choose which 
      IPs are on Wired and which on Wireless.

 Now we will see solution 2
 
For example: Consider you have Internet public subnet
x.y.z.0/24. 
Interface are:

1) ifconfig eth0 x.y.z.C netmask 255.255.255.255(to
Internet)
2) ifconfig eth1 x.y.z.C netmask
255.255.255.255(Wired)
1) ifconfig eth2 x.y.z.C netmask
255.255.255.255(Wireless)

static routes on eth0:
       1. route add IPGW dev eth0
       2. route add default gw IPGW

This route stands for addressing all Internet requests
to your Default GW: as you notice, first you have to
tell Linux where is the router, then let default
requesting through it.

  static routes on eth1:
	1. route add x.y.z.A dev eth0
	2. route add x.y.z.B dev eth0
	3. route add x.y.z.D dev eth0
  Hosts A, B, and D on the Wired Network

static routes on eth2:
	1. route add x.y.z.E dev eth2
	2. route add x.y.z.F dev eth2
	3. route add x.y.z.G dev eth2
  Hosts E, F and G on the Wireless Network

Note that flexibility is very high, but you have to
manually set each host or later you can make runtime
script.

Other than that you have to do some more juggling-
You just need to check some forwarding setting like:
Ip forwarding file: file "/etc/sysctl.conf", line
"net.ipv4.ip_forfard = 0" must be
"net.ipv4_forward = 1" so that you can forward packets
to all interfaces.
proxy_arp = 1
ip_forward should be 1.

First make things working then we will see Security.

hope help

Manish                         






--- Jason <arnjuka@optonline.net> wrote:
> I'm setting up a wireless access point for my local
> community.  I have
> an external cantenna that I'm building for it. It's
> running redhat9 and
> a netgear card that has the prism2 chipset and the
> hostap driver
> installed.
> 
> The box has 3 network connections:
> 
> eth0 - dsl
> eth1 - wired network
> wlan0 - wifi network
> 
> I need to route traffic between the three
> connections.  The internet
> iface will have a dynamic ip address from a dsl
> provider.  The other two
> will only have private ips.  I was reading the Linux
> Wifi Access Point
> howto and they say to setup zebra and ospfd.  I've
> tried this and it
> desn't seem to work.
> 
> Whats the best way to route traffic between these
> all 3 ifaces.  What
> should I use for security.
> 
> If anyone has an examples, or good docs for me to
> read, please point me
> in the right direction.
> 
> - jason
> 
> 
> 


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

