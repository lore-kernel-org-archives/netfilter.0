From: "Dodson, Matthew" <mdodson@coremetrics.com>
Subject: Strange ICMP packets
Date: Thu, 20 Feb 2003 16:48:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <85063BBE668FD411944400D0B744267A0232671D@ausmail.core.coremetrics.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
Cc: "Dodson, Matthew" <mdodson@coremetrics.com>

Sorry if this question has been asked before but I am having a hard time
following this iptables log. I would appreciate any help. I am getting about
2000 of these in my logs a day. The only thing that changes in the request
are the external IP's


Here is my setup.

RedHat 7.1
iptables-1.2.5-3
kernel-2.4.10 (I also run 2.4.20)
DROP all ICMP 
server Internal IP 10.4.1.30

Is used as an  apache webserver that gets load balanced through a css. This
server is also behind a PIX firewall. 


IPTABLES-ICMP-IN:IN=eth1 OUT= MAC=00:20:94:12:14:0f:00:d0:b7:82:24:9c:08:00
SRC=200.35.93.2
DST=10.4.1.30 LEN=56 TOS=0x00 PREC=0x00 TTL=238 ID=56298 PROTO=ICMP TYPE=3
CODE=13 [SRC=10.4.1.30 DST=200.75.116.55 LEN=48 TOS=0x00 PREC=0x00 TTL=45
ID=0 DF PROTO=TCP INCOMPLETE [8 bytes] ]

IPTABLES-ICMP-IN:IN=eth1 OUT= MAC=00:20:94:12:14:0f:00:d0:b7:82:24:9c:08:00
SRC=199.70.10.33 DST=10.4.1.30 LEN=56 TOS=0x00 PREC=0x00 TTL=244 ID=41725
PROTO=ICMP TYPE=11 CODE=0 [SRC=10.4.1.30 DST=12.88.181.78 LEN=40 TOS=0x00
PREC=0x00 TTL=1 ID=34208 DF PROTO=TCP INCOMPLETE [8 bytes] ]



