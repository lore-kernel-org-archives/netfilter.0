From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Weird problem
Date: Tue, 14 Oct 2003 11:31:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8C16C6.2010801@Loudoun-Fairfax.com>
References: <1066129218.13064.13.camel@forbidden.cipanb.ca>	 <3F8BEAEB.1060005@Loudoun-Fairfax.com> <1066136413.12935.43.camel@forbidden.cipanb.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1066136413.12935.43.camel@forbidden.cipanb.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


>Here are the rules I'm using:
>
>*nat
>:PREROUTING ACCEPT [242:28183]
>:POSTROUTING ACCEPT [63:13135]
>:OUTPUT ACCEPT [9:3439]
>-A PREROUTING -d 123.123.123.2 -j DNAT --to-destination 192.168.0.2
>-A PREROUTING -d 123.123.123.3 -j DNAT --to-destination 192.168.0.2
>-A PREROUTING -d 123.123.123.7 -j DNAT --to-destination 192.168.0.6
>-A PREROUTING -d 123.123.123.10 -j DNAT --to-destination 192.168.0.4
>-A PREROUTING -d 123.123.123.12 -j DNAT --to-destination 192.168.0.2
>-A PREROUTING -d 123.123.123.13 -j DNAT --to-destination 192.168.0.8
>-A PREROUTING -d 123.123.123.51 -j DNAT --to-destination 192.168.1.51
>-A PREROUTING -d 123.123.123.52 -j DNAT --to-destination 192.168.1.52
>-A PREROUTING -d 123.123.123.53 -j DNAT --to-destination 192.168.1.53
>-A PREROUTING -d 123.123.123.54 -j DNAT --to-destination 192.168.1.54
>-A PREROUTING -d 123.123.123.55 -j DNAT --to-destination 192.168.1.55
>-A PREROUTING -d 123.123.123.56 -j DNAT --to-destination 192.168.1.56
>-A PREROUTING -d 123.123.123.57 -j DNAT --to-destination 192.168.1.57
>-A PREROUTING -d 123.123.123.58 -j DNAT --to-destination 192.168.1.58
>-A PREROUTING -d 123.123.123.59 -j DNAT --to-destination 192.168.1.59
>-A PREROUTING -d 123.123.123.60 -j DNAT --to-destination 192.168.1.60
>
Are your internal boxes going to be servers? You generally don't need 
DNAT unless the outside needs access to the private lan boxes.

>-A POSTROUTING -s 192.168.0.2 -o eth0 -j SNAT --to-source 123.123.123.12
>-A POSTROUTING -s 192.168.0.6 -o eth0 -j SNAT --to-source 123.123.123.7
>-A POSTROUTING -s 192.168.0.8 -o eth0 -j SNAT --to-source 123.123.123.13
>-A POSTROUTING -s 192.168.0.4 -o eth0 -j SNAT --to-source 123.123.123.10
>-A POSTROUTING -s 192.168.1.51 -o eth0 -j SNAT --to-source
>123.123.123.51
>-A POSTROUTING -s 192.168.1.52 -o eth0 -j SNAT --to-source
>123.123.123.52
>-A POSTROUTING -s 192.168.1.53 -o eth0 -j SNAT --to-source
>123.123.123.53
>-A POSTROUTING -s 192.168.1.54 -o eth0 -j SNAT --to-source
>123.123.123.54
>-A POSTROUTING -s 192.168.1.55 -o eth0 -j SNAT --to-source
>123.123.123.55
>-A POSTROUTING -s 192.168.1.56 -o eth0 -j SNAT --to-source
>123.123.123.56
>-A POSTROUTING -s 192.168.1.57 -o eth0 -j SNAT --to-source
>123.123.123.57
>-A POSTROUTING -s 192.168.1.58 -o eth0 -j SNAT --to-source
>123.123.123.58
>-A POSTROUTING -s 192.168.1.59 -o eth0 -j SNAT --to-source
>123.123.123.59
>-A POSTROUTING -s 192.168.1.60 -o eth0 -j SNAT --to-source
>123.123.123.60
>COMMIT
>
>*filter
>:INPUT DROP [61:8249]
>:FORWARD DROP [72:4535]
>:OUTPUT DROP [0:0]
>-A INPUT -i lo -j ACCEPT
>-A INPUT -d 123.123.123.254 -j ACCEPT
>-A INPUT -d 192.168.0.1 -j ACCEPT
>-A INPUT -d 192.168.1.1 -j ACCEPT
>-A FORWARD -i eth2 -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
>-A FORWARD -o eth2 -m state --state RELATED,ESTABLISHED -j ACCEPT
>  
>

These should be on the external interface. Your ip addr shows this as a 
lan interface. I think you've assigned either the rules or the IPs to 
the wrong interfaces.

>-A FORWARD -d 192.168.0.6 -i eth0 -p tcp -m tcp --dport 25 -j DROP
>-A FORWARD -d 192.168.0.8 -i eth0 -p tcp -m tcp --dport 25 -j DROP
>-A FORWARD -i eth0 -o eth1 -j ACCEPT
>-A FORWARD -i eth1 -o eth0 -j ACCEPT
>  
>

Your treating these as local interfaces, but eth0 is your external 
interface.

>-A OUTPUT -o lo -j ACCEPT
>-A OUTPUT -s 123.123.123.254 -j ACCEPT
>-A OUTPUT -s 192.168.0.1 -j ACCEPT
>-A OUTPUT -s 192.168.1.1 -j ACCEPT
>COMMIT
>
>The way the network is setup is we have a Cisco router (owned by our
>ISP) that goes to the internet with IP 123.123.123.1 and the netfilter
>box has IP 123.123.123.254 on the external interface. I'm using
>192.168.0.0/24 and 192.168.1.0/24 on the internal interfaces. My
>workstation is in the 192.168.1.0/24 subnet and when I was trying to
>ping the Cisco router, it wouldn't work but I could ping another
>computer on the 123.123.123.0/24 subnet and after that I could ping the
>router and everything worked. Also there's a few people who couldn't
>connect to the net even after I tried pinging a computer in the
>123.123.123.0/24 subnet, when I turned on logging in the FORWARD table
>for their IPs it started working and I could remove that rules
>afterwards and it would continue to work. I setup the rules pretty basic
>for now to make sure everything works before I start locking stuff out.
>
>Here's the output of ip addr show on the netfilter box:
>
>1: lo: <LOOPBACK,UP> mtu 16436 qdisc noqueue
>    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>    inet 127.0.0.1/8 scope host lo
>2: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
>    link/ether 00:04:23:5f:8f:f8 brd ff:ff:ff:ff:ff:ff
>    inet 123.123.123.254/24 brd 123.123.123.255 scope global eth0
>    inet 123.123.123.2/32 scope global eth0
>    inet 123.123.123.3/32 scope global eth0
>    inet 123.123.123.7/32 scope global eth0
>    inet 123.123.123.10/32 scope global eth0
>    inet 123.123.123.12/32 scope global eth0
>    inet 123.123.123.13/32 scope global eth0
>    inet 123.123.123.51/32 scope global eth0
>    inet 123.123.123.52/32 scope global eth0
>    inet 123.123.123.53/32 scope global eth0
>    inet 123.123.123.54/32 scope global eth0
>    inet 123.123.123.55/32 scope global eth0
>    inet 123.123.123.56/32 scope global eth0
>    inet 123.123.123.57/32 scope global eth0
>    inet 123.123.123.58/32 scope global eth0
>    inet 123.123.123.59/32 scope global eth0
>    inet 123.123.123.60/32 scope global eth0
>3: eth1: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
>    link/ether 00:04:23:5f:8f:f9 brd ff:ff:ff:ff:ff:ff
>    inet 192.168.0.1/24 brd 192.168.0.255 scope global eth1
>4: eth2: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
>    link/ether 00:04:23:5f:77:d2 brd ff:ff:ff:ff:ff:ff
>    inet 192.168.1.1/24 brd 192.168.1.255 scope global eth2
>
>
>And here's the output of ip route show:
>
>192.168.1.0/24 dev eth2  proto kernel  scope link  src 192.168.1.1
>192.168.0.0/24 dev eth1  proto kernel  scope link  src 192.168.0.1
>123.123.123.0/24 dev eth0  proto kernel  scope link  src 123.123.123.254
>default via 123.123.123.1 dev eth0
>
>
>  
>
>>If your not experienced with iptables this is an excellent tutorial 
>>which explains in detail how iptables works: 
>>http://iptables-tutorial.frozentux.net/
>>
>>If you are experienced, you need to insert some logging rules to find 
>>out where the packets are going to. Snort can also help with this.
>>    
>>
>
>I have some experience with iptables but I don't consider myself an
>expert.
>
>Jean-Rene Cormier
>
>
>
>  
>



