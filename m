From: "Peter Marshall" <peter.marshall@caris.com>
Subject: vpn problem
Date: Tue, 16 Nov 2004 14:29:51 -0400
Message-ID: <047701c4cc0a$431ab6e0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

Hello everyone.

I am getting the following in my logs (scrolls faster than I can read) when
ever anyone trys to do windows file transfers over my vpn.  The vpn is ipsec
and it is a constant connection between our office and our sister office.
My vpn server is in our dmz between 2 firewalls.  The remote vpnserver is
installed on their internal firewall.  When a client on the remote side goes
to copy a file using windows networking to a server on my side, it works,
however I get the messages below ... Please help.  I am not sure why I am
getting this.  It looks like the reply is getting blocked, however, as my
rules show below, I allow established and related connections.

Nov 16 13:59:16 radium kernel: FORWARD REJECT IN=eth1 OUT=eth0 SRC=x.x.x.33
DST=192.168.200.3 LEN=576 TOS=0x00 PREC=0xC0 TTL=63 ID=12528 PROTO=ICMP
TYPE=3 CODE=4 [SRC=192.168.200.3 DST=192.168.127.15 LEN=1500 TOS=0x00
PREC=0x00 TTL=126 ID=19304 DF PROTO=TCP SPT=445 DPT=1915 WINDOW=64968
RES=0x00 ACK URGP=0 ] MTU=1443

$IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPT -A FORWARD -s 192.168.127.0/24 -i eth1 -j vpn-int
$IPT -A vpn-int -d 192.168.200.3 -p tcp --dport 139 -j ACCEPT
        $IPT -A vpn-int -d 192.168.200.3 -p tcp --dport 445 -j ACCEPT
        $IPT -A vpn-int -d 192.168.200.3 -p udp --dport 138 -j ACCEPT
        $IPT -A vpn-int -j LOG --log-prefix " REJECT: vpn-int "
        $IPT -A vpn-int -j REJECT


192.168.127.0/24 is the remote network
192.168.200.0/21 is my local network.
x.x.x.33 is the internet IP of my vpn server.

Thanks for the help,
Peter



