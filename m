From: Kevin Van Workum <vanw@usna.edu>
Subject: bad tcp packets?
Date: Mon, 31 Jan 2005 08:29:56 -0500
Message-ID: <41FE32D4.4000103@usna.edu>
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

I'm learning about iptables and am working through the example scripts 
in Oskar Andreasson's Iptables Tutorial 1.1.19. So I have the following 
rules:

iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "New not syn:"
iptables -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

My understanding of this rule is that all NEW tcp packets should by SYN 
also. So if they are not NEW and SYN, then we should log them and drop 
them. I guess Andreasson wants to log them because they may indicate a 
problem of some sort. So in my log file, I get this:

Jan 30 20:09:27 server kernel: New not syn:IN= OUT=lo SRC=10.0.0.100 
DST=10.0.0.100 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=7678 DF PROTO=TCP 
SPT=34928 DPT=143 WINDOW=32767 RES=0x00 ACK PSH FIN URGP=0

So what's the problem with these packets? It looks like some client is 
contacting the imapd (which is running on my firewall) with some bad tcp 
packets?

-- 
Kevin

