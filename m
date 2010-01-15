From: Karel Rericha <karel@maxtel.cz>
Subject: BUG? iptables --datestop inconsistent behaviour
Date: Fri, 15 Jan 2010 15:56:13 +0100
Message-ID: <5b19ed111001150656q11dc2f1fj1c7ec5b1cf54016d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Following script results in inconsistent behaviour of
iptables-save/iptables-restore. Value of --datestop is sometimes moved
back and sometimes not.

System is dual quadcore Nehalem with Gentoo 2.6.31-r6, timezone is set
to Europe/Prague:

router ~ # uname -a
Linux router 2.6.31-gentoo-r6 #1 SMP Wed Jan 6 10:50:58 CET 2010
x86_64 Intel(R) Xeon(R) CPU E5520 @ 2.27GHz GenuineIntel GNU/Linux

router ~ # emerge -s iptables | grep installed
      Latest version installed: 1.4.3.2

Repeatedly running following script:

********************************************************************
#!/bin/bash
iptables -t mangle -F POSTROUTING
iptables -t mangle -A POSTROUTING --destination 1.1.1.1 -m time
--datestop 2038-01-01T01:01:01 -j ACCEPT
iptables -t mangle -L -v | grep date
********************************************************************

gives randomly two different outputs:

    0     0 ACCEPT     all  --  any    any     anywhere
1.1.1.1             TIME until date 2038-01-01 00:01:01
or
    0     0 ACCEPT     all  --  any    any     anywhere
1.1.1.1             TIME until date 2038-01-01 01:01:01

Expected result should be the second one, because --localtz is
default. Even specifying --localtz or --utc explicitly doesnt help and
results are still randomly changing from run to run.
Double checked that /etc/localtime is copy of /usr/share/zoneinfo/Europe/Prague.

Upgrading to masked iptables-1.4.6 doesnt help too, same bahaviour.

Anyone has any idea ?

Karel Rericha
