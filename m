From: "Stephan Viljoen" <steph@gabswave.net>
Subject: Weird routing problem. (I think)
Date: Thu, 6 Nov 2003 16:21:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003e01c3a471$3e8af660$0200010a@Tinkerbell>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi There,

I'm sorry if I've mailed this to the wrong mailing list , but I reckon
you guys would know best :)

Some off my clients started complaining that they're having problems
connecting to my mail server. Now all this worked fine up until
yesterday. I'm not blocking any ports nor am I blocking ICMP on the
network.

If I try and ping the mail server from the clients computer I get the
following message.

[root@ceda root]# ping 217.10.176.138
PING 217.10.176.138 (217.10.176.138) 56(84) bytes of data.
From 10.0.5.1: icmp_seq=2 Redirect Host(New nexthop: 217.10.176.138) 
From 10.0.5.1: icmp_seq=3 Redirect Host(New nexthop: 217.10.176.138)

And here comes the weird part, the moment I restart the client's network
all problems disappear for at least an hour or two. I have about 50
customers on my network and only about half off them is experiencing
this problem and it's on both Windows / linux boxes.

I only have this problem accessing the mail server, the rest of the
servers hosted on the 217.10.176.136/29 network works fine. I can also
ping the same clients pc from the mail server without any problems.

[root@mail routers]# ping 10.0.5.2
PING 10.0.5.2 (10.0.5.2) 56(84) bytes of data.
64 bytes from 10.0.5.2: icmp_seq=1 ttl=64 time=0.260 ms
64 bytes from 10.0.5.2: icmp_seq=2 ttl=64 time=0.235 ms

Here's my network layout.

Cisco Router 	 : (217.10.176.149/255.255.255.252)

		-----------------------------

FIREWALL	 : eth0 (217.10.176.150/255.255.255.252)
		 : eth1:client1 (10.0.5.1/255.255.255.252)
		 : eth1:client2 (10.0.4.1/255.255.255.252)
		 : eth1:mail (217.10.176.137/255.255.255.248)

Routing table for the firewall.
10.0.5.0	    0.0.0.0		 255.255.255.252  U  0	 0
0 eth1
10.0.4.0	    0.0.0.0		 255.255.255.252  U  0 0 0 eth1
217.10.176.136  0.0.0.0        255.255.255.248  U  0 0 0 eth1
127.0.0.0       0.0.0.0        255.0.0.0        U  0 0 0 lo
0.0.0.0         217.10.176.149 0.0.0.0          UG 0 0 0 eth0

		-----------------------------

MAIL SERVER	 : eth0 (217.10.176.138/255.255.255.248)
Routing table on the Mail Server
217.10.176.136  0.0.0.0         255.255.255.248 U  0 0 0 eth0
127.0.0.0       0.0.0.0         255.0.0.0       U  0 0 0 lo
0.0.0.0         217.10.176.137  0.0.0.0         UG 0 0 0 eth0

		-----------------------------

Client PC 1 	 : eth0 (10.0.5.2/255.255.255.252)

		-----------------------------

Client PC 2 	 : eth0 (10.0.4.2/255.255.255.252)

		-----------------------------

Some input would be greatly appreciated.

Kind Regards
Stephan


