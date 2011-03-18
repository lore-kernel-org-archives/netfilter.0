From: Mauj Lele <mauj.mailers@gmail.com>
Subject: LOG_ACCEPT does not result in matching packet being accepted (ACCEPT works)
Date: Fri, 18 Mar 2011 13:05:10 -0700
Message-ID: <AANLkTin0ZoJ7MfonStpL_Ez=m=tre_w5WvRRXWLrswke@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=vCgjbuMYRUHhNLfe11wGUSfmR7ICqWRBMG+53iLtC+s=;
        b=WMB5E94KNXFyfhm+KfnhE3q6dImQdOYJf353zgfiDTFPj+8/Y1valJHyiwckan8mEM
         Q6uc4MeChhJ5ypwYu87TcAMvRbB5VX4Kd2qczCvdWmW4Uh4Nlq/S2R0q/YG36FRn0nVE
         xLvC0zH2rgamU4IeUK2fqrfVM6VEFvPliTS+I=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am running into a strange issue where packets matching LOG_ACCEPT
rule (SSH packets) are not accepted. This results in failure to SSH to
the box from outside. Trigger is still unknown - same rules work fine
and LOG_ACCEPT works fine in the beginning. If I change the LOG_ACCEPT
to ACCEPT, strangely SSH starts working. I have not tried a "service
firewall restart" etc. and I don't want the failed condition to go
away before I collect required info. Pasting the rules below. If
anyone has any clues, appreciate if you could let me know

[root@localhost log]# uname -a
Linux localhost.localdomain 2.6.18-164.el5xen #1 SMP Thu Sep 3
04:47:32 EDT 2009 i686 i686 i386 GNU/Linux
[root@localhost log]#
[root@localhost log]# iptables --version
iptables v1.4.6
[root@localhost log]#


Thanks
Ajay

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:67
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:67
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED
LOG_ACCEPT  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22
LOG_ACCEPT  udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:44148
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:44149
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:42605
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:3478
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:3478
ACCEPT     all  --  127.0.0.1            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  127.0.0.1            127.0.0.1
icmp_packets  icmp --  0.0.0.0/0            0.0.0.0/0
LOG_DROP   all  --  0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            192.168.122.0/24    state
RELATED,ESTABLISHED
ACCEPT     all  --  192.168.122.0/24     0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
REJECT     all  --  0.0.0.0/0            0.0.0.0/0
reject-with icmp-port-unreachable
REJECT     all  --  0.0.0.0/0            0.0.0.0/0
reject-with icmp-port-unreachable

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:3478
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:3478
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
RELATED,ESTABLISHED
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:22
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:23
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:69
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:80
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:161
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:161
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:514
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:3306
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:3306
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:1099
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:1099
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:1098
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:1098
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:5222
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:5222
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:5223
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:5223
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:44148
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:44149
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:42605
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:53
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:53
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:443
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:443
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:7337
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:7337
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:7335
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:7335
ACCEPT     all  --  0.0.0.0/0            127.0.0.1
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0
icmp_packets  icmp --  0.0.0.0/0            0.0.0.0/0
LOG_DROP   all  --  0.0.0.0/0            0.0.0.0/0

Chain LOG_ACCEPT (2 references)
target     prot opt source               destination

Chain LOG_DROP (2 references)
target     prot opt source               destination

Chain icmp_packets (2 references)
target     prot opt source               destination
