From: "Martin Leduc" <marled3@hotmail.com>
Subject: Problem behind my DMZ
Date: Wed, 7 Jan 2004 19:19:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c3d57d$15123950$0296a8c0@martin>
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
Cc: marled3@hotmail.com

Good afternoon,

For resume my situation, I have 3 servers behind my NetFilter BOX
(iptables 1.2.9 Nov 02, 2003) PREROUTING DNATed using each a public IP.
Each of my public IP was old by my firewall eth0: public gateway,
eth0:0: first server,  eth0:1: second server eth0:2: third server and my
second NIC is the DMZ.

One of my server is DNS.  My trouble is if I tried to send Email FROM
one of this third server, my DNS return to sender server the public IP
and my Email as send to my firewall, not my internal Server.

I explain:

This is my netconfig.  I change address IP, you will understand why ;)



192.168.0.2 (WEB) -------->|                   -------
192.168.0.3 (DNS) -------->|-------192.168.0.1 | BOX |  ------> eth0   :
20.0.0.1
192.168.0.4 (MAIL) -------->|                  -------          eth0:0 :
20.0.0.2  (DNAT 192.168.0.2)
	
eth0:1 : 20.0.0.3  (DNAT 192.168.0.3)
	
eth0:2 : 20.0.0.4  (DNAT 192.168.0.4)

DMZ
INTERNET


All request FROM internet work fine, no mather with that.  The trouble
Is from my DMZ.

Example:  When 192.168.0.2 try to send Email, my DNS (192.168.0.3) tell
that the mail server is 20.0.0.4.  I have put LOG target and I SEE my
packets pass the PREROUTING chain and that's it!

I have make a test, I have open a HTTP server on my BOX and if I tried
to reach 20.0.0.2 from my internal DMZ I reach the BOX not 192.168.0.2

I have tried to put this PREROUTING rules

Iptables -t nat -A PREROUTING -s 192.168.0.0/24 -d 20.0.0.2 -j DNAT
--to-destination 192.168.0.2.

When I make iptables -t nat -nvL PREROUTING I see the packets count, but
noting else.

Before put this rule, the nmap report 80 open (BOX).  After this, nmap
report filtred.

Can some one help me, please.

Martin

