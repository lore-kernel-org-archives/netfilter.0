From: Lars =?UTF-8?Q?T=C3=A4uber?= <taeuber@bbaw.de>
Subject: Re: Valid packets blocked as invalid?
Date: Thu, 19 Apr 2007 11:23:38 +0200
Message-ID: <20070419112338.a3f379bb.taeuber@bbaw.de>
References: <20070418151941.c689b07c.taeuber@bbaw.de>
	<web-69045730@bk1.webmaillogin.com>
	<20070419083348.364c873e.taeuber@bbaw.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070419083348.364c873e.taeuber@bbaw.de>
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

Hi!

To enhance the problem:

The ICMP redirects are also blocked as invalid:

kernel: RULE -1 -- DENY IN= OUT=eth2 SRC=194.95.188.7 DST=194.95.188.37 LEN=76 TOS=0x00 PREC=0xC0 TTL=64 ID=18322 PROTO=ICMP TYPE=5 CODE=1 GATEWAY=194.95.188.25 [SRC=194.95.188.37 DST=194.95.188.245 LEN=48 TOS=0x00 PREC=0x00 TTL=63 ID=0 DF PROTO=TCP SPT=80 DPT=1246 WINDOW=5840 RES=0x00 ACK SYN URGP=0 ] 

What is invalid with this?

Here again the rules that match (first rules of firewall script):
 $IPTABLES -N drop_invalid
 $IPTABLES -A OUTPUT   -m state --state INVALID  -j drop_invalid
 $IPTABLES -A INPUT    -m state --state INVALID  -j drop_invalid
 $IPTABLES -A FORWARD  -m state --state INVALID  -j drop_invalid
 $IPTABLES -A drop_invalid  -j LOG  --log-level debug --log-prefix "RULE -1 -- DENY "
 $IPTABLES -A drop_invalid  -j DROP

I think it could have something to do with the ACK and SYN flags. It seems to me the kernel doesn't recognise this packet as part of an established connection.
Anyone with an explaination here or someone that shows me my nescience?

Thanks
Lars

