From: Oleg <sov.rbsec@gmail.com>
Subject: icmp in ip_conntrack not seen
Date: Tue, 28 Feb 2006 23:33:20 +0300
Message-ID: <200602282333.20515.sov.rbsec@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hello!

I 've got a problem with my linux box, description:

Box setup:
1. Linux kernel 2.6.15 vanilla from www.kernel.org, no additional patches.
2. 
# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_icmp_timeout
30
3. 
zcat /proc/config.gz |grep IP_NF
CONFIG_IP_NF_CONNTRACK=y
CONFIG_IP_NF_CT_ACCT=y
CONFIG_IP_NF_CONNTRACK_MARK=y
CONFIG_IP_NF_CONNTRACK_EVENTS=y
# CONFIG_IP_NF_CT_PROTO_SCTP is not set
CONFIG_IP_NF_FTP=y
... etc

Problem:
When pinging from other server, this box has no icmp records 
in /proc/net/ip_conntrack. When pinging from this box other server those 
entries not exist too. Ping works ok, request/replies goes both sides (seen 
at tcpdump on both systems).

Those entries appear only for small time when pinging in such way: ping 
-f ... :-( And only one way to get them is this script:
while true;do grep icmp /proc/net/ip_conntrack;done

P.S. I think that problem exist because i set CONFIG_IP_NF_CT_ACCT option, am 
i wrong?
P.P.S. I can't subscribe to this list from my mail at mail.ru server, no 
notification about cause of this has been received, no rules at 
www.netfilter.org describe problems with free mail servers :-(
-- 
Best regards, Oleg


