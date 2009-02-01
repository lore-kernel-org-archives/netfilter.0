From: bahamin takhtaei <b_takhtaei@yahoo.com>
Subject: nfqnl_test problem
Date: Sun, 1 Feb 2009 03:30:54 -0800 (PST)
Message-ID: <754287.31916.qm@web111304.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I run nfqnl_test (in libnetfilter_queue1-0.0.12/utils ) on a Linux machine (FC9, kernel: 2.6.25-14.fc9.i686).
I add these rules to iptables later:
iptables -A INPUT -p icmp -j NFQUEUE

then send some ping requests to the machine, but I don't get any reply (timeout occurred).
Why please? Do I should tune up something?


      

