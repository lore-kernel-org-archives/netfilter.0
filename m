From: "Nikolay S. Rybalov" <nowhere@hakkenden.ath.cx>
Subject: Troubles with MARK target in 2.6.28
Date: Fri, 9 Jan 2009 18:51:13 +0300
Message-ID: <86617ABF8F494F2A940C18251E3DC8D0@Hakkenden>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi all,

I have troubles with "-j MARK --set-xmark" combination in mangle table. 
Particulary, I want set one bit in nf mark by means, say, --set-xmark 
0x10/0x10, and it worked in kernels from at least 2.6.24 up to the last in 
2.6.27.

I use: iptables -t mangle -A POSTROUTING -o eth1 -d 192.168.37.0/24 -j 
MARK --set-xmark 0x10/0x10

and get:

iptables v1.4.2: Unknown arg `(null)'
Try `iptables -h' or 'iptables --help' for more information.

When I try --or-mark, iptables says that my "kernel too old for --or-mark"

Same thing happens with -j CONNMARK.

Can someone advise what to do, I really need to set only one bit without 
altering the rest of the mark. 

