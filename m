From: Arthur Kerpician <arthur@bluechip.ro>
Subject: VPN Masq
Date: Fri, 18 Feb 2005 17:13:22 +0200
Message-ID: <42160612.806@bluechip.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,
Please consider the following config:

VPN CLIENT
----------------------
External IP: 123.123.123.123
Internal VPN IP: 10.0.0.2
Default gw: 10.0.0.1

VPN SERVER
-----------------------
External IP: 231.231.231.231
Internal VPN IP: 10.0.0.1

All traffic on the VPN client is routed through the VPN server using:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
ipatbles -A FORWARD -s 10.0.0.0/24 -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -j REJECT //block the rest

eth0: external NIC on the server

Ok, the gw works on the client so I have internet connection on it. The 
problem occurs when an external host tries to access for example the 
http server on the client (http://123.123.123.123) or pinging the 
client. Since the default gw on the client is the vpn server, I did a 
tcpdump -i tap0 (vpn interface) on the server to display some echo 
replies on the pings. And I received (on tap0 interface) these echo 
replies which weren't routed back to the pinging host. The output was:
21:11:14.983343 123.123.123.123 > 111.111.111.111: icmp: echo reply (DF)
where 111.111.111.111 is the host from where I started to ping.
Somewere on the vpn server the packets are filtered and not sent to the 
pinging host. Same for all the connections which have as destination 
client's external IP. How can I use client's services for external 
hosts? Some tweaks on client's routing table or the server's packet 
mangling is faulty?
Thanks,
Arthur

