From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: traceroute:
Date: Sun, 25 May 2003 22:45:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ED12B67.3030104@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm having problems doing traceroute through my firewall.

It seems that the rule:
iptables -A OUTPUT -m state --state INVALID -j DROP
catches the ICMP error messages that is returned when TTL=0, and hence 
traceoute comes out showing "* * *" instead of the name of my firewall.

When logging the INVALID packets, this is entered in the system log:

May 25 22:38:42 debian kernel: INVALID:IN= OUT=eth1 SRC=10.0.0.254 
DST=10.0.0.2 LEN=66 TOS=0x00 PREC=0xC0 TTL=64 ID=52226 PROTO=ICMP 
TYPE=11 CODE=0 [SRC=10.0.0.2 DST=130.225.76.31 LEN=38 TOS=0x00 PREC=0x00 
TTL=1 ID=46519 PROTO=UDP SPT=46518 DPT=33435 LEN=18 ]

Is this a known problem, or is blocking outgoing invalid packets not 
recommended?

Regards
Anders Fugmann












