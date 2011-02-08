From: Steffen Beyer <steffen@beyer.io>
Subject: Masquerading fails after first packet
Date: Tue, 8 Feb 2011 18:49:22 +0100
Message-ID: <20110208184922508316.a730ff6b@beyer.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm trying to get masquerading/SNAT to work on a Ubiquity AirOS device 
(kernel 2.6.15). All chains are empty, policy ACCEPT, just one rule:

Chain POSTROUTING (policy ACCEPT 3 packets, 200 bytes)
 pkts bytes target     prot opt in     out     source               
destination         
    4   288 SNAT       all  --  any    eth1    192.168.23.0/24      
anywhere            to:10.213.5.9 

When I ping an internet host from the internal network, one reply arrives, 
then it gets stuck. No more packets appear on eth1.

Same with TCP; after trying to open a connection (ACK reply arrives, 
followed by silence) I find an entry in ip_conntrack:

tcp      6 49 SYN_RECV src=192.168.23.2 dst=88.198.17.205 sport=3955 
dport=22 src=88.198.17.205 dst=10.213.5.9 sport=22 dport=3955 use=2

What's missing? Any insight appreciated!

Kind regards,
-- 
Steffen Beyer <steffen@beyer.io>

GnuPG key fingerprint: CA00 1611 242B 89D4 E643  E235 05F3 7689 DD3E EB26
Public key available upon request or at http://wwwkeys.de.pgp.net
