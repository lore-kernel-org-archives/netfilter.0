From: - = k o l i s k o = - <kolisko@penguin.cz>
Subject: iptables question - NAT/Masq
Date: 20 Jan 2003 17:15:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043079320.14910.73.camel@kolisko>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all,

i have the following situation:


nntp clients -- [internet] --+-- server1:119
                             |
                             +-> server2:119

we manage the server1. It is a server with more services (web, ftp,
pop3, ...). The new service will be nntp(119) but we dont want to
install there a news SW. We only need forward all nntp/news traffic to
another server - server2.

server2 is not our server, but this server accept all the traffic from
source IP address of server1. There is not possible to accept directly
the traffic from all clients becouse they dont have the same address
like server1 of course.

What we need is to configure a server1 to accept all connections from
clients to port 119(news) and forward it to destination server2 but with
source address of server1.

Note that server1 have only one NIC interface.

I have this on the server1 and it dont work:

/sbin/iptables -t nat -A PREROUTING -i eth0+ --protocol tcp
--destination-port 119 -j DNAT --to-destination server2:119

iptables -L -n -v -t nat

Chain PREROUTING (policy ACCEPT 118K packets, 6236K bytes)
 pkts bytes target     prot opt in     out     source             =20
destination
   10   600 DNAT       tcp  --  eth0+  *       0.0.0.0/0          =20
0.0.0.0/0          tcp dpt:119 to:server2:119

Chain POSTROUTING (policy ACCEPT 46411 packets, 3197K bytes)
 pkts bytes target     prot opt in     out     source             =20
destination

Chain OUTPUT (policy ACCEPT 46411 packets, 3197K bytes)
 pkts bytes target     prot opt in     out     source             =20
destination


thank you for help
kolisko




--=20

---
Michal Koles=E1r
kolisko@penguin.cz
http://kolisko.penguin.cz
+420.777.225.297


Don't send me any attachment in Micro$oft (.DOC, .PPT) format please
Read http://www.fsf.org/philosophy/no-word-attachments.html
Preferable attachments: .PDF, .HTML, .TXT
Thanx for adding this text to Your signature


