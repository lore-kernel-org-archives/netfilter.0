From: J Doe <general@nativemethods.com>
Subject: Question regarding nft and tables
Date: Fri, 4 Aug 2017 13:51:01 -0400
Message-ID: <88DDA058-C2B7-4D1E-92F2-2F9198FD4EC5@nativemethods.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am new to nftables and have been experimenting with the syntax.  I am working on Ubuntu 16.04.3 LTS server with a kernel of 4.4.0.  I have installed the nftables package and nft is version 0.5.

My goal is to create two tables - one of protocol family ip and one of protocol family inet.  To do so, I issued the following commands:

$ sudo nft add table ip filter_ip
$ sudo nft add table inet filter_inet

I then create chains for inbound and outbound traffic:

$ sudo nft add chain ip filter_ip input { type filter hook input priority 0 \; }
$ sudo nft add chain ip filter_ip output { type filter hook output priority 0 \;}
$ sudo nft add chain inet filter_inet input { type filter hook input priority 0 \; }
$ sudo nft add chain inet filter_inet output { type filter hook output priority 0 \; }

I then attempt to allow inbound and outbound traffic on the loop back interface:

$ sudo nft add rule inet filter_inet input iif lo accept
$ sudo nft add rule inet filter_inet output iif lo accept

I then list the tables:

$ sudo nft list tables
table ip filter_ip
table inet filter_inet

But when I attempt to view the loop back rules in filter_inet, I get the following:

$ sudo nft list table filter_inet
<cmdline>:1:1-22: Error: Could not process rule: Table 'filter_inet' does not exist

What am I doing wrong ?

Thanks,

- J


