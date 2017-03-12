From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted: TIPC Overlapping Ring Neighbor
 Monitoring Algorithm
Date: Sun, 12 Mar 2017 12:03:18 -0400
Message-ID: <33e99656-80e2-9ba7-0984-01965f5243c0@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=jaxIQe31lb8nvTwm2w6paxluHY41k/+qKp+pxBYGE8M=;
        b=LGDRzxIk6II8WvIavUsWvNyLX3a8cy+VC21/BmVaJTci9rVeOTJCmsimgNQAVmSbeL
         IgjkC+AHritgWr4y7fLgdVPsErjqFE6nvySu/7ZhOtc4hFNPmpDJU+JhjvHAiyrLknOZ
         SfKh+q2vcshdRzS7MdD4P9C59WL/df84jGiM38KAn1WKCFna8WhjChR+uTc0MRbB+OPi
         XJar8TWCK1OuSqMrUnssFWAKEFEHb+HUuW04KoXaX1k6dPBLey+bhLTpS9cRtyHmBQqw
         qpcHOn0h5N/5Ke0gxhEzoowcEjX/aGHX+noeIezbryaP2+LGYSEh7Y1oZAowzs+5XpFm
         iSCg==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org, Heri Muhero <hmuhero@gmail.com>

The tech committee would like to announce a new accepted talk.

Jon Maloy will give a talk on the new TIPC ring neighbor monitoring.

Details are
---------
Title: Overlapping Ring Neighbor Monitoring Algorithm in 1000-node Clusters

In Linux 4.7 we introduced a fundamentally new neighbor monitoring
algorithm to TIPC. This algorithm has several advantages:

- It scales better than full mesh monitoring. CPU load increases by
   sqrt(N) instead of by N, network load by sqrt(N)*N instead of N^2.

- Swift neighbor failure discovery is guaranteed even in the presence
   of a partitioned network, contrary to what regular ring supervision
   algorithms can do.

- It has short and deterministic failure discovery times, contrary
   to the Gossip algorithm.

The algorithm is completely distributed, self-adaptive and employs no
centralized or coordinated state. It scales up to at least 1000 nodes
with a failure discovery time in the order of 1 second. We believe this
algorithm should be useful in large container or VM clusters, as well
as in native systems.

A brief summary of the algorithm:

- Each node sorts all its N known neighbors into a circular list. The
   algorithm for this is the same on all nodes.

- The node identifies the next sqrt(N) nodes downstream from itself in
   the list, -its "monitoring domain", and supervises those actively.

- It distributes a record describing its monitoring domain to all the
   neighbors. A new record is distributed when there is a change, e.g.,
   a lost node, in the local domain.

- When a node outside a node's local domain is lost, it relies on updates
   from the sqrt(N) nodes actively monitoring that node for discovering
   the loss.

- In order to handle failures causing a partitioned network, each node
   also selects a set of nodes outside its own domain to monitor actively.
   Those nodes are selected so that no node is more than two active
   supervision hops away. There will be sqrt(n) such nodes. This
   guarantees that a node will discover loss of indirectly monitored
   nodes in a remote partition within a period marginally longer than
   the detection time for actively monitored nodes.

- Each node will immediately re-calculate a new optimal monitoring
   configuration upon any change in the cluster.
-----


cheers,
jamal
