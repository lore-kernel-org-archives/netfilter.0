From: John Donnelly <john_donnelly@persistentsys.com>
Subject: libnetfilter_queue:   ./nfqnl_test usage ? no activity shown
Date: Mon, 19 Aug 2013 22:39:47 +0000
Message-ID: <2E13285DED113046A773BD29BABDCC2032B94361@US-MBX1.persistent.co.in>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,





Hi,
 I am trying to get   libnetfilter_queue  usermode  example working on 3.10.3 kernel , and I
don't see any activity reported:


info:

[root@rh62-x86 utils]# cat /usr/share/pkgconfig/lib* | egrep "Ver|Name"
Name: libmnl
Version: 1.0.3
Name: libnetfilter_queue
Version: 1.0.2
Name: libnfnetlink
Version: 1.0.1
Name: libnftables
Version: 1.0.0

[root@rh62-x86 utils]# pwd
/root/ntest/libnetfilter_queue/utils

insmod  /lib/modules/`uname -r`/kernel/net/netfilter/nfnetlink_queue.ko

[root@rh62-x86 utils]# lsmod
Module                  Size  Used by
nfnetlink_queue         7851  0

installed

Running  nfqnl_test yields no captures:

[root@rh62-x86 utils]# ./nfqnl_test
opening library handle
unbinding existing nf_queue handler for AF_INET (if any)
binding nfnetlink_queue as nf_queue handler for AF_INET
binding this socket to queue '0'
setting copy_packet mode


< nothing >

Should I  see activity if I  ssh to the machine ?

Suggestions welcome . 
DISCLAIMER
==========
This e-mail may contain privileged and confidential information which is the property of Persistent Systems Ltd. It is intended only for the use of the individual or entity to which it is addressed. If you are not the intended recipient, you are not authorized to read, retain, copy, print, distribute or use this message. If you have received this communication in error, please notify the sender and delete all copies of this message. Persistent Systems Ltd. does not accept any liability for virus infected mails.
