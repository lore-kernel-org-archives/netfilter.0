From: "Peter Marshall" <peter.marshall@caris.com>
Subject: weird message in logs
Date: Tue, 19 Oct 2004 13:52:28 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <116401c4b5fc$0485cc40$49caa8c0@caris.priv>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Below is a message I get in my messages file.  Basically, there is a company
going to lease space from us.  I know it would have been easier to just
stick another card in my firewall and give them a subnet, however, that is
not possible for our setup (long story).  Anyway, I bult another firewall
for them.  This firewall sits within our internal network (physically) and
has 2 network cards.  The firewalls internal network card is for their
netowrk; 192.168.90.0/24,  The external card has a network of its own
10.90.0.2.  My internal firewall has a sub interface eth0:1 with the number
10.90.0.1  (eth0 is 192.168.200.1 and is the gateway to my companys internal
network).

What I am doing at the moment is ssh'ing to the newly created firewall
called rubidium on port 15422.  I get the following in my messages file.
Does anyone know how to correct this problem.  It does not prevent me from
sshing, however, I would prefer to not have errors in my log files.

Oct 19 14:46:05 rubidium kernel: REJECT: INPUT IN=eth1 OUT=
MAC=00:50:04:9b:7a:ee:00:50:04:68:df:06:08:00 SRC=10.90.0.1 DST=10.90.0.2
LEN=484 TOS=0x10 PREC=0xC0 TTL=64 ID=58050 PROTO=ICMP TYPE=5 CODE=1
GATEWAY=192.168.202.73 [SRC=10.90.0.2 DST=192.168.202.73 LEN=456 TOS=0x10
PREC=0x00 TTL=64 ID=7787 DF PROTO=TCP SPT=15422 DPT=2510 WINDOW=8576
RES=0x00 ACK PSH URGP=0 ]

Thanks,
Peter Marshall


