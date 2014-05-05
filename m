From: Martin Kraus <lists_mk@wujiman.net>
Subject: conntrackd, internal cache keeps filling up
Date: Mon, 5 May 2014 12:40:58 +0200
Message-ID: <20140505104058.GA30297@finrod>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi.
I'm running conntrackd 1.2.1 on debian wheezy between two routers with 
conntrackd external cache disabled.

After running for some time the states stop replicating due to conntrackd hitting
HashLimit in the internal cache. When I looked at it it's basically broadcast
and multicast connections that never time out even though they are no longer
in the conntrack tables on both routers. I filtered some of it out using
NOTRACK in iptables. That helped for a while but now it's back with 
tcp LAST_ACK state.

tcp      6 LAST_ACK src=172.20.6.74 dst=172.20.20.23 sport=48818 dport=445 src=172.20.20.23 dst=172.20.6.74 sport=445 dport=48818 [ASSURED] [active since 249398s]
tcp      6 LAST_ACK src=172.20.6.119 dst=172.20.20.21 sport=55843 dport=80 src=172.20.20.21 dst=172.20.6.119 sport=80 dport=55843 [ASSURED] [active since 15458s]
tcp      6 LAST_ACK src=172.20.6.119 dst=172.20.20.21 sport=58573 dport=80 src=172.20.20.21 dst=172.20.6.119 sport=80 dport=58573 [ASSURED] [active since 7426s]
tcp      6 LAST_ACK src=172.20.6.119 dst=172.20.20.21 sport=57923 dport=80 src=172.20.20.21 dst=172.20.6.119 sport=80 dport=57923 [ASSURED] [active since 9946s]
tcp      6 LAST_ACK src=172.20.6.74 dst=172.20.20.23 sport=47560 dport=445 src=172.20.20.23 dst=172.20.6.74 sport=445 dport=47560 [ASSURED] [active since 252927s]

There's thousands of these entries and in a few days they'll fill up the
internal cache and break internal routing.

My understanding was that the internal cache is a copy of the kernel conntrack
table on each router so it should not be larger then the current conntrack
table plus some information about terminated connections that need to be
synced to the other router. 

How are the entries in internal cache purged? Most of them seem to be deleted
when the connection is terminated but some of the just keep hanging around.

thanks for help
Martin
