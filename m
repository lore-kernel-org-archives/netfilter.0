From: Dario Alcocer <dalcocer@helixd.com>
Subject: Rule error using ct helper for TFTP
Date: Wed, 19 Apr 2023 01:14:23 -0700
Message-ID: <20988da8-f5d0-063d-0507-5472772b0b18@helixd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tulum.helixd.com;
        s=mail; t=1681892064;
        bh=6iQlAx8j4UVhRkwZrySXF/JFUkvNNlTojPvVoz1yO20=;
        h=Date:To:From:Subject:From;
        b=WhfXTvvPtwaEQ5WR23ppe7hz7hJ1OInbS6vO66ckEHmROwlIobTCt9gqUNU+WBBuw
         /uzrxBTutT7LwQXzP3GNO6RLQ8nYAlIK9lSm01RSv+4AW/8WreeMm/ZmP+wMD6B8Uz
         Xuqng000cYN56asv4aXcfr19c6oYiVzWmmTtVM8c=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

The nftables utility fails when using a "ct helper" rule for TFTP:

# /usr/sbin/nft -f /usr/share/netfw/netfw.conf
/usr/share/netfw/netfw.conf:32:30-33: Error: Could not process rule: No 
such file or directory
                  udp dport 69 ct helper set tftp
^^^^

How should nftables be configured so TFTP is allowed with a default-deny 
firewall?

For the record, I'm using nftables 1.0.2 built for an i.MX8 embedded 
platform running Linux 5.15.71.

The complete ruleset is:

flush ruleset
table inet filter {
         ct helper tftp {
                 type "tftp" protocol udp;
                 l3proto inet
         }
         chain input {
                 type filter hook input priority filter; policy drop;
                 ct state invalid drop comment "early drop of invalid 
packets"
                 ct state established,related accept
                 iif lo accept
                 iif != lo ip daddr 127.0.0.1/8 drop
                 iif != lo ip6 daddr ::1/128 drop
                 ip protocol icmp accept
                 ip6 nexthdr icmpv6 accept
                 udp dport 69 ct helper set tftp
         }
         chain forward {
                 type filter hook forward priority 0; policy drop;
         }
}

Output from lsmod:

Module                  Size  Used by
nf_conntrack_tftp      20480  0
nft_ct                 24576  0
nf_conntrack          110592  2 nf_conntrack_tftp,nft_ct
nf_defrag_ipv6         24576  1 nf_conntrack
nf_defrag_ipv4         16384  1 nf_conntrack
nf_tables             192512  1 nft_ct
libcrc32c              16384  2 nf_conntrack,nf_tables
nfnetlink              20480  1 nf_tables
wlan                 4472832  0
crct10dif_ce           20480  1
cfg80211              700416  1 wlan

Output from sysctl -a:

net.netfilter.nf_conntrack_acct = 0
net.netfilter.nf_conntrack_buckets = 65536
net.netfilter.nf_conntrack_checksum = 1
net.netfilter.nf_conntrack_count = 11
net.netfilter.nf_conntrack_dccp_loose = 1
net.netfilter.nf_conntrack_dccp_timeout_closereq = 64
net.netfilter.nf_conntrack_dccp_timeout_closing = 64
net.netfilter.nf_conntrack_dccp_timeout_open = 43200
net.netfilter.nf_conntrack_dccp_timeout_partopen = 480
net.netfilter.nf_conntrack_dccp_timeout_request = 240
net.netfilter.nf_conntrack_dccp_timeout_respond = 480
net.netfilter.nf_conntrack_dccp_timeout_timewait = 240
net.netfilter.nf_conntrack_events = 1
net.netfilter.nf_conntrack_expect_max = 1024
net.netfilter.nf_conntrack_frag6_high_thresh = 4194304
net.netfilter.nf_conntrack_frag6_low_thresh = 3145728
net.netfilter.nf_conntrack_frag6_timeout = 60
net.netfilter.nf_conntrack_generic_timeout = 600
net.netfilter.nf_conntrack_helper = 0
net.netfilter.nf_conntrack_icmp_timeout = 30
net.netfilter.nf_conntrack_icmpv6_timeout = 30
net.netfilter.nf_conntrack_log_invalid = 0
net.netfilter.nf_conntrack_max = 65536
net.netfilter.nf_conntrack_sctp_timeout_closed = 10
net.netfilter.nf_conntrack_sctp_timeout_cookie_echoed = 3
net.netfilter.nf_conntrack_sctp_timeout_cookie_wait = 3
net.netfilter.nf_conntrack_sctp_timeout_established = 432000
net.netfilter.nf_conntrack_sctp_timeout_heartbeat_acked = 210
net.netfilter.nf_conntrack_sctp_timeout_heartbeat_sent = 30
net.netfilter.nf_conntrack_sctp_timeout_shutdown_ack_sent = 3
net.netfilter.nf_conntrack_sctp_timeout_shutdown_recd = 0
net.netfilter.nf_conntrack_sctp_timeout_shutdown_sent = 0
net.netfilter.nf_conntrack_tcp_be_liberal = 0
net.netfilter.nf_conntrack_tcp_ignore_invalid_rst = 0
net.netfilter.nf_conntrack_tcp_loose = 1
net.netfilter.nf_conntrack_tcp_max_retrans = 3
net.netfilter.nf_conntrack_tcp_timeout_close = 10
net.netfilter.nf_conntrack_tcp_timeout_close_wait = 60
net.netfilter.nf_conntrack_tcp_timeout_established = 432000
net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 120
net.netfilter.nf_conntrack_tcp_timeout_last_ack = 30
net.netfilter.nf_conntrack_tcp_timeout_max_retrans = 300
net.netfilter.nf_conntrack_tcp_timeout_syn_recv = 60
net.netfilter.nf_conntrack_tcp_timeout_syn_sent = 120
net.netfilter.nf_conntrack_tcp_timeout_time_wait = 120
net.netfilter.nf_conntrack_tcp_timeout_unacknowledged = 300
net.netfilter.nf_conntrack_udp_timeout = 30
net.netfilter.nf_conntrack_udp_timeout_stream = 120
net.netfilter.nf_log.0 = NONE
net.netfilter.nf_log.1 = NONE
net.netfilter.nf_log.10 = NONE
net.netfilter.nf_log.11 = NONE
net.netfilter.nf_log.12 = NONE
net.netfilter.nf_log.2 = NONE
net.netfilter.nf_log.3 = NONE
net.netfilter.nf_log.4 = NONE
net.netfilter.nf_log.5 = NONE
net.netfilter.nf_log.6 = NONE
net.netfilter.nf_log.7 = NONE
net.netfilter.nf_log.8 = NONE
net.netfilter.nf_log.9 = NONE
net.netfilter.nf_log_all_netns = 0

Kernel config:

CONFIG_NETFILTER_ADVANCED=y
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_NETLINK=m
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=m
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CT_PROTO_DCCP=y
CONFIG_NF_CT_PROTO_SCTP=y
CONFIG_NF_CT_PROTO_UDPLITE=y
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_NAT=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_TFTP=m
CONFIG_NF_NAT_REDIRECT=y
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NF_TABLES=m
CONFIG_NF_TABLES_INET=y
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NETFILTER_XTABLES=m
CONFIG_NETFILTER_XTABLES_COMPAT=y
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
CONFIG_NETFILTER_XT_TARGET_LOG=m
CONFIG_NETFILTER_XT_NAT=m
CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_IPVS=m
CONFIG_NF_DEFRAG_IPV4=m
CONFIG_NF_TABLES_IPV4=y
CONFIG_NF_REJECT_IPV4=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_TARGET_MASQUERADE=m
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_NF_TABLES_IPV6=y
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_TARGET_REJECT=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_NF_DEFRAG_IPV6=m


