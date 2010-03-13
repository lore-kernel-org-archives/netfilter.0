From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: udplite and ports
Date: Sat, 13 Mar 2010 10:10:39 +0100
Message-ID: <4B9B568F.7020609@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

what am I missing, why is that command not working:

iptables -A INPUT -i eth2 -p udplite --destination-port 123 -j ACCEPT
iptables v1.4.7: unknown option `--destination-port'
Try `iptables -h' or 'iptables --help' for more information.


uname -a
Linux eris 2.6.33-eris-2010-03-06 #1 Sat Mar 6 01:36:52 CET 2010 i686
GNU/Linux

-p udplite -m multiport --ports 123,124 ... works.


Thanks for your help!


Best regards

Mart
