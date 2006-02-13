From: Aleksander <aleksander@krediidiinfo.ee>
Subject: state new with SYN not set
Date: Mon, 13 Feb 2006 11:26:02 +0200
Message-ID: <43F050AA.3050602@krediidiinfo.ee>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello list,

My firewall drops packets, which state is NEW, but no SYN bit is set. 
Now I started logging these dropped packets and there are loads of them. 
All connecting to the 443 port from random IP's (legitimate clients). 
The service is https. The service works fine, but I'm still worried 
about the dropping.

The rules:
${IPTABLES} -t filter -A bad_tcp_packets -p tcp --tcp-flags ! SYN SYN -m 
state --state NEW -j LOG --log-prefix "BAD PACKET N
EW+!syn: "
${IPTABLES} -t filter -A bad_tcp_packets -p tcp --tcp-flags ! SYN SYN -m 
state --state NEW -j DROP

An example, from the FORWARD chain:
Feb 13 11:18:38 myname kernel: BAD PACKET NEW+!syn: IN=eth1 OUT=eth0 
SRC=1.2.3.4 DST=192.168.111.34 LEN=75 TOS=0x00 PREC=0x00 TTL=56 ID=47503 
DF PROTO=TCP SPT=36086 DPT=443 WINDOW=32942 RES=0x00 ACK PSH FIN URGP=0

What should I think of this?

Thanks,
    Alex

