From: "prem nath" <premnath21@hotmail.com>
Subject: help
Date: Wed, 09 Apr 2003 09:40:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F78hTGBe932VXI2PGBP00006e03@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org



Hi ,
I have problem in configuring firewall using Iptables .I h...
8.0. I am using webmin to configure the firewall.
The existing IP is


2 static Ips are there from ISp eg:61.11.56.42,61.11.56.115
Webserver and DNS server is hosted on 61.11.56.42
I have an Internal network 192.168.1.x
The linux box has 2 Interfaces ETH0 61.11.56.115
eth1 is 192.168.1.19
ETH0 is connected to external and internal to switch is connected to
192.168.1.19.
They have a mail server where smtp and pop3 has to be forwarded .
Please let me know how to NAT 192.168.1.19 with 61.11.56.115.
At the same time squid proxy should work .
I need to allow ports 80,8080,22,21,23,25,110,1494,1328.
All the queries should reach the DNS server & Webserver(61.11.56.42)
eg:80,80801494,1328
Please do give me a plan so that I can forward all these to both servers
.(mail server * Webserver )
I have an idea of putting DNS server in linux firewall box but cant  forward
the queries to webserver.


Please do help me out with natting and forwarding .Getting really confused.
Awaiting reply .
Advance thanks
Regards
Prem




_________________________________________________________________
Vrroooom=85=85 Fasten your seatbelts.=20
http://server1.msn.co.in/msnSpecials/formula2003/index.asp Get set for F1=20
2003


