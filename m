From: Oliver Jehle <oliver.jehle@monex.li>
Subject: Conntrack dst= IP Address in /proc/net/conntrack wrong
Date: Fri, 17 Dec 2004 07:25:02 +0100
Message-ID: <1103264702.2076.405.camel@vorab.monex.li>
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
To: netfilter@lists.netfilter.org

2 networks connected with IPSEC / both Linux 2.6.9

neta  - gwa - ipsec tunnel - gwb - netb

neta 192.168.1.0
gwa 192.168.1.254

netb 192.168.2.0
gwb 192.168.2.254

when i open an ssh session from neta to netb it works and the conntrack
entry looks correct like this on gwb:

tcp      6 431015 ESTABLISHED src=192.168.2.2 dst=192.168.1.100
sport=33121 dport=22 packets=347 bytes=27765 src=192.168.1.100
dst=192.168.2.2 sport=22 dport=33121 packets=225 bytes=43197 [ASSURED]
use=1

but when i try from netb to neta, then the entry looks like this on gwb:

tcp      6 118 SYN_SENT src=192.168.1.100 dst=192.168.2.2 sport=54803
dport=22 packets=1 bytes=60 [UNREPLIED] src=192.168.2.2 dst=192.168.1.1
sport=22 dport=54803 packets=0 bytes=0 use=1

the dst= ipaddress has the address of the ipsec gateway instead of the
correct host address.

I've no nat rules for the connection.

Is this a known effect ? 


