From: Funieru Bogdan <fbsoft01@yahoo.com>
Subject: Routing problem with 3 interfaces
Date: Tue, 25 Jan 2005 03:03:51 -0800 (PST)
Message-ID: <20050125110351.89351.qmail@web53705.mail.yahoo.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all
I'm having a little problem routing my 2 internet
connections to my LAN, here is the schem of my network

		  ISP1				  ISP2
		   |				   |
	IP:193.230.183.11		IP:193.19.192.108
	GTW:193.230.183.4		GTW 193.19.192.65
		   |				   |
		   |				   |
		SERVER1	<---routable ip---------SERVER2 -> eth0 to
ISP2
to server2 via	eth1<-					-> eth1 to other comp ip add
83.175.128.96
ip 83.175.128.123					-> eth2 to server1 ip
83.175.128.123
to LAN via 	eth2<-
ip 192.168.1.1
to ISP1		eth0<-


i hope that the schematic is a little bit
understandful now the big problem is that i wan't to
give acces to my LAN on both connections, but on
different ip's
Now i want everything that comes from ip 141.85.0.0/16
to go to server2 and everything else to go through
server1

i've done a little bit of researching but all i ended
up was trash, because when i try to link to the ip
141.85.0.0/16 i get through tracert that the packets
go ok until they stop at the gateway of server2 , ip
193.19.192.65,and from here it freazes,it doesn't go
anywhere at all.

i have the following rule add 
route add default gw 193.230.183.4 
#i tryed with
ip route add default via 83.175.128.123 table
net_retea1
ip rule add dev eth1 table net_retea1
ip rule add from 192.168.1.2 to 141.85.0.0/16 table
net_retea1
ip rule add 83.175.128.124 table net_retea1
iptable -t nat -A PREROUTING -i eth1 -s 192.168.1.2 -d
141.85.0.0/16 --to 83.1751.28.124

and i've marked the pachets as well thought it'll work
, but it didn't ... how do i make it work ?
thx in advance 
nothing but the best Bogdan

=====
-------------------
Funieru Bogdan
Admin MosilorNET

Contact Info:
Mob:
0742158956
0726592752
0744301506(very rare)
-------------------


		
__________________________________ 
Do you Yahoo!? 
Read only the mail you want - Yahoo! Mail SpamGuard. 
http://promotions.yahoo.com/new_mail 

