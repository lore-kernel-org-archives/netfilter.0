From: funny guy <asteriskmail@yahoo.com>
Subject: Multiple PPTP clients behind NAT
Date: Tue, 14 Sep 2004 02:17:13 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040914091713.68587.qmail@web52508.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Rob,

Thanks for answering my questions. I tried your
advices, but still cannot make it work.

>(Why would you use a 9 months old POM when a new one
>is available ?)

The reason for using this patch is because
patch-o-matic-ng-20040621 said my kernel 
is too old (I donot know why, my kernel was 2.4.20-8
which is the default kernel from RedHat 9).

The reason for using kernel 2.4.26 is because we
searched on the web and someone said using
this kernel with this patch works. 

>These are the ones you are referring to.
>1. These are for redirecting incoming pptp traffic to
>your pptp server.
>2. They are missing a chain and you want to use the
>FORWARD chain.
>
>iptables -A FORWARD -m state --state
>RELATED,ESTABLISHED -j ACCEPT
>iptables -A FORWARD -i <if_lan> -o <if_inet> -s
><net_lan> -p tcp \
>  --dport 1723 -m state --state NEW -j ACCEPT
>iptables -t nat -A POSTROUTING -o <if_inet> -s
><net_lan> -p tcp \
>  --dport 1723 -j SNAT --to-source <ip_inet>

>Probably you also need rules like these :

>iptables -A FORWARD -i <if_lan> -o <if_inet> -s
><net_lan> -p gre \
>  -j ACCEPT
>iptables -t nat -A POSTROUTING -o <if_inet> -s
><net_lan> -p gre \
>  -j SNAT --to-source <ip_inet>

>You really mean ping ? Are the PPTP servers
firewalled >? (Not in your
>ascii art.)
>We don't really know your config. Not sure why this
>happens.

I am a newbie for iptables, therefore, I have some
problem with the settings.

My configuration is exactly the following

PPTP     |
client1->|  
         |
PPTP     | 
client2->|                                   |->PPTP 
         |                                   |  Server
         |->eth1->NAT->eth0->...Internet...->|
... ...->|                                   |->... 
         |                                   |
PPTP     |    
client n->| 

A. Private LAN: 192.168.10.0/24
B. eth1 IP:     192.168.10.1
C. eth0 IP:     129.94.60.128
D. PPTP server: 129.94.133.1
E. IPs in PPTP Server: 129.94.182.130, 129.94.182.131
(These IPs cannot be accessed without VPN)
F. All clients in private LAN are windows or Mac
machines. After the VPN is setup, they will be
assigned with IP addresses of 129.94.165.3 and
129.94.165.4
G. The PPTP Server is not firewalled

The problem is decribed as following:
1. I setup one connection from client 1 to the PPTP
server, then I tried to test the connection by ping
either 129.94.182.130 or 129.94.182.131. It is
working.
2. I setup the other connection from client 2 to the
same PPTP server. Then two cases will happen:
   a) if the client 1 keep pinging (a MAC), the
connection will fail;
   b) if client 1 stop pinging, the connection can be
established.
3. After the second connection is setup. Client 2 can
ping, client 1 cannot ping any more, but the status
shows that the connection is still there.

I only applied two NAT rules for the above settings:
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth1 -j ACCEPT

I tried to apply the rules that you told me, however,
I am still not able to make it work.

Could you please give me more help? Thanks a lot a
lot.



		
_______________________________
Do you Yahoo!?
Declare Yourself - Register online to vote today!
http://vote.yahoo.com

