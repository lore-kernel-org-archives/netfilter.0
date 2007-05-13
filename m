From: Sumit Malik <sumit_malik1@yahoo.com>
Subject: 12 interface FTP server - Possible routing problem - Please help
Date: Sun, 13 May 2007 13:30:41 -0700 (PDT)
Message-ID: <535519.69724.qm@web31508.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hello,

I have proFTPd setup on an Ubuntu server with 12
network interfaces, each one connected to a separate
DSL line. The server binds to the 12 interfaces fine
but has trouble taking connections on the 11 other
than the first interface.

- Each DSL line has a dynamic IP and is mapped to a
DynDNS name.
- Each interface is behind a NAT in the DSL router.
(An incoming connection is able to get to the server
so the incoming NAT is working fine)
- All relevant ports are opened for FTP on each router
and forwarded to the appropriate internal IP
- Each interface in proFTPd is setup to use a DNS
service to lookup the interface IP for PASV transfers.
Each interface has a different DNS name
- All interfaces are visible and enabled in the
interface list
- Each of the interfaces has an internal IP of
192.168.n.11 and the router has an IP of 192.168.n.1.
- The server is running Ubuntu Server 6.10 with no
firewall software

With these routes below I am able to ftp to each
interface independently and get directory listings. I
am also able to upload data from the client to each of
the 12 interfaces.

ip route add 192.168.2.0/24 dev eth2 src 192.168.2.11
table r2
ip route add 192.168.3.0/24 dev eth3 src 192.168.3.11
table r3
...
ip route add 192.168.12.0/24 dev eth12 src
192.168.12.11 table r12

ip rule add from 192.168.2.11 table r2
ip rule add from 192.168.3.11 table r3
...
ip rule add from 192.168.12.11 table r12

ip route add default via 192.168.2.1 table r2
ip route add default via 192.168.3.1 table r3
...
ip route add default via 192.168.12.1 table r12

The strange part is that I am actually able to
download in ascii mode but not in binary mode from any
of the interfaces other than the default interface
(eth1)

I also tried loading ip_conntrack and ip_conntrack_ftp
but that did not work. I also added the following
iptable entries but they didn't help either.

iptables -A INPUT -i eth2 -p tcp --sport 1024: --dport
1024: -d 192.168.2.11 -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth2 -p tcp --sport 1024:
--dport 1024: -s 192.168.2.11 -m state --state
ESTABLISHED -j ACCEPT

So now I am able to do the following using PASSIVE
mode
- Upload from Client -> Server in ASCII and BINARY
mode
- Download from Server -> Client in ASCII mode only.

I have also tried several ftp clients.

Any ideas why BINARY mode is not working for
downloads?

Thanks for your help in advance.

Regards,

-Sumit

