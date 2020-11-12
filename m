From: Hildegard Meier <daku8938@gmx.de>
Subject: connlimit allows more established conns than the limit set
Date: Thu, 12 Nov 2020 15:06:58 +0100
Message-ID: <trinity-165ef9af-b5d5-42c5-b8de-2d158b86db65-1605190018175@3c-app-gmx-bs44>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605190018;
        bh=m+aJzl9GwC0bn8H+rpgI8iarS1oV4OFk667b8/LUysw=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=SRFRvA8Tlj5Ch3b9ZrMdHCaohL4pVMGm6MNvTuuZZYNFYEGfsAramCW9DC5LUUHpP
         AV9dQAB500tYxAKRxW0NzyrYu1jaGzJhm5xp+KJZDQrsFeO5cr9ikq5L4UtOPR7aFw
         I4+yKqpaJOC8CRxEfcRUu5LfiiC1DpURVzwio5dk=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Environment:

Ubuntu 12.04.5 LTS
Kernel 3.13.0-117-generic #164~precise1-Ubuntu SMP Mon Apr 10 16:16:25 UTC 2017 x86_64
Package conntrack 1:1.0.0-2ubuntu1

lsmod | grep conntr
xt_conntrack           12760  0
nf_conntrack_netlink    36326  0
nfnetlink              14650  1 nf_conntrack_netlink
nf_conntrack_ipv4      15063  2
nf_defrag_ipv4         12758  1 nf_conntrack_ipv4
nf_conntrack           97807  7 xt_conntrack,nf_conntrack_netlink,xt_connlimit,iptable_nat,nf_conntrack_ipv4,nf_nat_ipv4,nf_nat
x_tables               34892  8 xt_conntrack,xt_LOG,xt_connlimit,ipt_REJECT,xt_nat,xt_tcpudp,iptable_filter,ip_tables



Hello,

I have an sftp server listening on port 2222 (IP redacted to 1.2.3.4) for which I want to limit the TCP connections from source IP address 195.225.2.2 (IP slightly changed for privacy reasons) to a maximum of 5.

So I setup the following iptables rules (these are all rules in table "filter"):

*filter
:INPUT ACCEPT
:FORWARD ACCEPT
:OUTPUT ACCEPT
:LOGDROP
-A INPUT -s 195.225.2.2/32 -p tcp -m tcp --dport 2222 --tcp-flags FIN,SYN,RST,ACK SYN -j LOG
-A INPUT -s 195.225.2.2/32 -p tcp -m tcp --dport 2222 --tcp-flags FIN,SYN,RST,ACK SYN -m connlimit --connlimit-above 5 --connlimit-mask 32 --connlimit-saddr -j LOGDROP
-A LOGDROP -j LOG --log-prefix "INPUT:DROP:"
-A LOGDROP -j REJECT --reject-with icmp-port-unreachable

But after having running this for 1h, there are still 41 established tcp connections, instead of the allowed 5:

conntrack -L --orig-src 195.225.2.2

shows roughly 40 (fourty) establsihed TCP connections from 195.225.2.2 to my sftp server:

tcp      6 431994 ESTABLISHED src=195.225.2.2 dst=1.2.3.4 sport=49218 dport=2222 src=1.2.3.4 dst=195.225.2.2 sport=2222 dport=49218 [ASSURED] mark=0 use=1
[...]
tcp      6 431978 ESTABLISHED src=195.225.2.2 dst=1.2.3.4 sport=49668 dport=2222 src=1.2.3.4 dst=195.225.2.2 sport=2222 dport=49668 [ASSURED] mark=0 use=1
conntrack v1.0.0 (conntrack-tools): 41 flow entries have been shown.

I can confirm this with netstat. The tcp sessions are also closed after some minutes and established new, there are no "old" sessions sitting there.

Every SYN packet from 195.225.2.2 I see in the log (so the packets do not go somewhere else but through this rule), but only roughly every fourth SYN packet is being rejected. The non-rejected packets lead to a new SFTP connection, I see the sftp session opening in the sftp server log right afterwards.

So, the connlimit rule does not work as I expect. I would expect that conntrack -L --orig-src 195.225.2.2 does show at maximum 5 flow entries in state established, and until there are 5 established connections, _every_ new SYN packet gets rejected.

I know that Ubuntu 12 is rather old software, but it is use now and will be used for some time more before a new server gets to work.

Did I miss something here?

Thanks very much
