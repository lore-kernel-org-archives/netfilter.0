From: Peng Yu <pengyu.ut@gmail.com>
Subject: How to check why HTTP proxy is not accessible from outside?
Date: Fri, 9 Feb 2018 23:28:21 -0600
Message-ID: <CABrM6wn4tJCx7XVfku=vn4Rm=rSa-gQxyCAYfkse+iFhicJhJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jXaQ/BIz1jr1pJY/z/Oe75qGXp2HNMJACxBqQiUbzq4=;
        b=cy8OVupUi44jsREKrurTHJ45D8To/SRvMGQS4CcqKR2tT+V+fj7bIuB7RcEjjpFfvV
         zxzUcAYL65syZ+NtVeV2BEB0TCQxS5S9Eunft2jyoi36NNNupWb1EzWOPlTnf7MC1kt0
         W+fScvBXlMuqTZx1wnvlKOfBqvN2XqSwgy0t5xBVt552mfc1+VHF+GLp5LH0f1OR10VY
         94V7RbmgmmkNWnWN2fYT8wstLYlVzHmjFLWOG4PbfIpqBRNLZGyEpwVbuSLPQ6mISpND
         S1PWZlN9FohU2R5DRAUm8HopIe2ZuerssvmWdSWwcuKkvN/k8Zsb8+VtKwUGlPaAhJex
         vG0Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have squid HTTP proxy running on both of the following servers
(server 1 and 2). But the proxy service on server1 can not be accessed
from outside.

I am not familiar with the output of iptables. Could the difference
explain why proxy on server1 is not accessible? Thanks.

server1:~$ sudo iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:smtp reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:http reject-with icmp-port-unreachable
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5900
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5901
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5902
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5903
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5904
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5905
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5906
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5907
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5900 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5901 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5902 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5903 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5904 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5905 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5906 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5907 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:imap2 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:imaps reject-with icmp-port-unreachable

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
server2:~$  sudo iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5900
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5901
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5902
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5903
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5904
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5905
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5906
ACCEPT     tcp  --  localhost            anywhere             tcp dpt:5907
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5900 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5901 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5902 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5903 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5904 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5905 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5906 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:5907 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:smtp reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:http reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:imap2 reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere             tcp
dpt:imaps reject-with icmp-port-unreachable

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

-- 
Regards,
Peng
