From: Tomek L <tl-netfilter@gazeta.pl>
Subject: FTP connection tracking doesn't work with nftables
Date: Wed, 13 May 2015 23:03:28 +0200
Message-ID: <CANfWn6Wp0bJ5=Q=dw3L+ychgO0f4d5VCdu_gL_9tz3B3stvBvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello

Could you have a look at my simple nft firewall script below, I've used
"ct related, established", but it doesnt work with passive mode FTP -
the data session on high ports is dropped by firewall. Does NFTables
have  connection tracking helper for FTP? If not - is it planned in
foreseable future to add it? I have following modules loaded:

nf_nat_ftp              1612  0
nf_conntrack_tftp       3825  0
nf_log_common           2778  0
nf_conntrack_ftp        6687  1 nf_nat_ftp
nf_tables_ipv4          1662  4
nf_tables              44307  323
nf_tables_ipv4,nft_log,nft_ct,nft_hash,nft_meta,nft_rbtree,nft_limit,nft_counter
nf_nat_masquerade_ipv4     1813  1 ipt_MASQUERADE
nf_conntrack_ipv4       7834  32
nf_defrag_ipv4          1251  1 nf_conntrack_ipv4
nf_nat_ipv4             4386  1 iptable_nat
nf_nat                 10869  4
nf_nat_ftp,nf_nat_ipv4,xt_nat,nf_nat_masquerade_ipv4
nf_conntrack           55251  8
nf_nat_ftp,nf_nat,nft_ct,nf_nat_ipv4,nf_nat_masquerade_ipv4,nf_conntrack_ftp,nf_conntrack_ipv4,nf_conntrack_tftp
nfnetlink               5157  5 nf_tables,nfnetlink_log,ip_set,nfnetlink_queue

And this is my nft configuration...

table ip filter {
  chain input {
  type filter hook input priority 0;
  dport 21 ct state new accept
  ct state established, related counter accept
  counter limit rate 100/second log group 2 prefix "RULE=Default drop"
  counter drop
  }

  chain output {
  type filter hook output priority 0;
  ct state established, related counter accept
  }

}

The packet for high TCP port is dropped when trying to get FTP folder list...

2015-05-13 23:00:57 XXXX ulogd RULE='Default drop' IN=eno1 OUT=
MAC=00:1e:67:ab:1f:49:b0:c2:9a:e3:27:c2:01:00 SRC=1.1.1.1 DST=2.2.2.2
LEN=64 TOS=00 PREC=0x00 TTL=58 ID=1603 DF PROTO=TCP SPT=57186
DPT=24362 SEQ=3242263100 ACK=0 WINDOW=65535 SYN URGP=0 MARK=0
