From: Monty Ree <montyree2@yahoo.com>
Subject: How to disable ip_conntrack function?
Date: Sun, 15 Oct 2006 19:04:47 -0700 (PDT)
Message-ID: <20061016020447.532.qmail@web56109.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello.. 

As I know, connection tracking(conntrack) requires
some memory at busy server. 
So I would like to disable conntrack function to
improve performance. 

And I disabled "state" match
support(CONFIG_NETFILTER_XT_MATCH_STATE)" at kernel
menu. 
But  I can see like below related conntrack. 
I just selected only this menu. 

Netfilter Xtables support (required for ip_tables) 
Connection tracking (required for masq/NAT) 
FTP protocol support IP tables support (required for
filtering/masq/NAT) 
Packet filtering 
REJECT target support Full NAT 
Packet mangling 
TOS target support 

and linux kernel is 2.6.17. 


How can I disable conntrack function? 

and what's the difference between
net.ipv4.ip_conntrack_max and
net.ipv4.netfilter.ip_conntrack_max? 


# sysctl -a|grep conntrack 
net.ipv4.ip_conntrack_max = 365536 
net.ipv4.netfilter.ip_conntrack_tcp_max_retrans = 3 
net.ipv4.netfilter.ip_conntrack_tcp_be_liberal = 0 
net.ipv4.netfilter.ip_conntrack_tcp_loose = 3 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_max_retrans
= 300 
net.ipv4.netfilter.ip_conntrack_log_invalid = 0 
net.ipv4.netfilter.ip_conntrack_generic_timeout = 600 
net.ipv4.netfilter.ip_conntrack_icmp_timeout = 30 
net.ipv4.netfilter.ip_conntrack_udp_timeout_stream =
180 
net.ipv4.netfilter.ip_conntrack_udp_timeout = 30 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close = 10

net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait
= 120 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_last_ack =
30 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait
= 60 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait =
120 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_established
= 432000 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_syn_recv =
60 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_syn_sent =
120 
net.ipv4.netfilter.ip_conntrack_checksum = 1 
net.ipv4.netfilter.ip_conntrack_buckets = 8192 
net.ipv4.netfilter.ip_conntrack_count = 1790 
net.ipv4.netfilter.ip_conntrack_max = 365536 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

