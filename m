From: Janosch Maier <janosch@crashtest-security.com>
Subject: iptables: Log dropped packages due to missing ports when using
 masquerading
Date: Wed, 29 Jul 2020 09:24:37 +0200
Message-ID: <3A004111-BD94-4AFB-A20E-10605B6A8EA4@crashtest-security.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crashtest-security.com; s=google;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=cl6c18XUbHM+zkC5IHZg2gQEXsx65ONwpbg4WVt+9t8=;
        b=CcdJY/LD0pIU2fY1ZJ0HkSyNSz8y4Vxu+1vBHSW0JFs5FXYOMyIi6qZuMLjdxsRsrv
         dIPCKciBOVNlegWcu9MxuobCTj9a+GXkiUarPYrUc+wqfditgQCao0lDSN7lGgWDGdG8
         dvrFvNtiVxh5gstrDWnYJq7mZq/zImsQPYjd+CBerpTUq5g7HXcHMpiIQsnKoVCm/WFe
         uxY3nSaSw5VnJdRLbfWrkUa8pcIbeqWBscPhu11F9nxlfCD0iJaCZs05zmuu50p6Px0/
         mJf4jLxcc67q2uov/5ZPz6FFqQhSjbR1j9fjw+e31XoUM4noIYGO++sulah3ubrDKBPZ
         2Y9Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone,

I am setting up iptables for natting of multiple hosts in a server =
cluster. There will be connection bursts from multiple servers usually =
to a single system. The natting is needed so that the receivers can =
whitelist the origin of the requests. The configuration is very basic:

   echo 1 > /proc/sys/net/ipv4/ip_forward
   iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Due to the burst of messages, I am worried that the number of open =
connections (or connections in a very short time) to a single =
destination will provoke the problem that no more ports on the nat host =
are available to open connections to the single target system.

1. Is there a way to log messages for when such a case happens?

2. If something like this happens, is there any way to recognise this =
when setting up logging for the post routing table like this?

iptables -t nat -I POSTROUTING -j LOG

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source               =
destination
421K   25M LOG        all  --  *      *       0.0.0.0/0            =
0.0.0.0/0            LOG flags 0 level 4
603K   36M MASQUERADE  all  --  *      eth0    0.0.0.0/0            =
0.0.0.0/0

3. Can dropping packages be avoided by adding multiple static IP =
addresses and using SNAT instead of masquerading as follows?

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to =
1.2.3.4,1.2.3.5,9.8.7.6


Any help is highly appreciated.
Janosch=
