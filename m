From: Zoe Parsons <zoe@zarp.org.uk>
Subject: patch-o-matic problems..?
Date: Sat, 19 Jul 2008 22:45:08 +0100 (BST)
Message-ID: <alpine.DEB.1.10.0807192237270.9838@fairy.dhcp.penguin>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, I'm probably just missing something obvious but still....

I've had the first cause to use something out of POM in a few years (ipp2p 
not that it really matters), and when I run it I just get the message:
/usr/src/iptables-1.4.1.1 doesn't look like a iptables source code 
directory 
to me.

I've tried it with the debian package source, a downloaded tarball from 
the  netfilter site, and finally with the git tree (using both downloaded 
and git retrieved copies of POM as well).

Oh and it's been invoked as: ./runme --download --kernel-path 
/usr/src/linux-source-2.6.25 --iptables-path /usr/src/iptables-1.4.1.1

Any suggestions?

TIA
-- 
ZoeP
