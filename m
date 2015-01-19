From: Jan Niggemann <jn@hz6.de>
Subject: conntrack GRE behaves differently in 3.17 / 3.18
Date: Mon, 19 Jan 2015 14:04:07 +0100
Message-ID: <f37def15eb82a2685c1041db1b37454e@d119.x-mailer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,

espite using the same pptp-client config and the same firewall rules, 
3.18 behaves differently than 3.17 in that I can't connect to a certain 
VPN using 3.18. Logging with tcpdump shows that in 3.18, GRE packets 
sent by the server are dropped while in 3.17 they are not. Testing 
further, I found rule #2 from INPUT to be the issue, leading me to think 
that a change in connection tracking may be the cause.

May this be an intended change in behaviour or a bug?
How may I assist in tracking that down (and eventually fixing it)?

Machine
Lenovo T400, Debian 7.8

Iptables (no NAT involved)
Chain INPUT (policy DROP 2 packets, 120 bytes)
  pkts bytes target     prot opt in     out     source               
destination
     0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            
0.0.0.0/0
     8   984 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0            ctstate RELATED,ESTABLISHED
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0            tcp dpt:22

Chain FORWARD (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 8 packets, 2292 bytes)
  pkts bytes target     prot opt in     out     source               
destination


Kernel configs:
3.17: https://gist.github.com/2974aa489986d6fc26e3
3.18: https://gist.github.com/2dc04e2ea55bde3360fe

Cheers
jan
