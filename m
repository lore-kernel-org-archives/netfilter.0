From: abdullah <aoner01@yahoo.com>
Subject: ndpi-netfilter for filtering FTP
Date: Sun, 26 May 2013 12:21:42 +0000 (UTC)
Message-ID: <loom.20130526T141905-462@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I installed ndpi-netfilter and ndpi to redhat 6 ( kernel 2.6.32.220 ) test
machine, say X. Among installation, I encountered no big problem or warning.

When I add the following rule to X:

"iptables -A INPUT -m ndpi --icmp -j REJECT"

then I can't ping X.

But when I add REJECT rule for ftp with following rule:

"iptables -A INPUT -m ndpi --ftp -j REJECT"

then I can still open FTP connections and make transaction via FTP to X from
another machine.

Same situation occurs when I used "-j NFQUEUE" option: I can capture ICMP
packets in userspace by using libnetfilter_queue library, but I can't get
FTP packets with second rule.

Why doesn't "ftp" filter work ?

lsmod command produces following result:

Module                  Size  Used by
nf_conntrack_ftp       12913  0
iptable_raw             2264  0
iptable_mangle          3349  0
ipt_REJECT              2383  1
nf_conntrack_ipv4       9506  1
nf_defrag_ipv4          1483  1 nf_conntrack_ipv4
iptable_filter          2793  1
ip_tables              17831  3 iptable_raw,iptable_mangle,iptable_filter
xt_ndpi               186018  1
nf_conntrack           79453  3 nf_conntrack_ftp,nf_conntrack_ipv4,xt_ndpi
..... 

