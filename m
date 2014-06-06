From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: How to make IPTables work with cgroup?
Date: Fri, 6 Jun 2014 08:44:09 -0700
Message-ID: <CALPbv18K_z4UUUvUtsURyVrSSZU0_TqUnEOyrUNHhn4cQBN16w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=iQb9n6QC4Y67m0n0G3JCfUmFZfcuKRQEjhSI4iUS4lQ=;
        b=tHW55aVra4xlwKrxWg+07V2p0eGtzxYp3JDnW0QD/Hycj771WaJ5f7HCxp33eCDSDO
         BHInkw3RuO57jI+Gne7zXIT7U74s+giXMJZnoPsJkc7aAfPIsZsZn4CPDDjl/4XqSI8b
         72tg7SF5wdTX7EDg3zw5pJ+dqcNAE+cY2S6XEjHh0YD5qU4vv2C4ZbV6ZJy9cxHLY/pB
         f5jlmNHnxUUFeonikf3IUlm90HydSvtGXDBAM4hgUhIToTqZxCzXSNoSUqhF4P7/hZCh
         XQpBAYbLSdXfxImx17fesxyYy+3yjBb9MJH8Ty8Ox2mMNOW6YMhDN4DOHKL+VF4zKHJH
         m3ow==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

I want to apply iptable rules to a particular cgroup classid and Iam
running into problems.

After creating a classid I couldnt proceed further with iptables.

# echo 0x100001 > /sys/fs/cgroup/net_cls/0/net_cls.classid
# cat /sys/fs/cgroup/net_cls/0/net_cls.classid
1048577

# iptables -t filter  -A OUTPUT -m cgroup ! --cgroup 0x100001 -j DROP
iptables: No chain/target/match by that name.

# iptables -A OUTPUT -m cgroup ! --cgroup 0x100001 -j DROP
iptables: No chain/target/match by that name.

what I have :

# cat /proc/net/ip_tables_targets
ULOG
REJECT
REDIRECT
NETMAP
MASQUERADE
LOG
DNAT
SNAT
ERROR
TCPMSS
TTL
# cat /proc/net/ip_tables_matches
u32
time
string
state
pkttype
physdev
owner
helper
conntrack
conntrack
conntrack
icmp
tcpmss
multiport
length
iprange
hashlimit
udplite
udp
tcp

What am I missing ?
Please comment.

Thanks.
