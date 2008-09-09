From: Brian Ghidinelli <brian@vfive.com>
Subject: What's required for a stateful firewall + ipvs in 2.6 kernel?
Date: Tue, 09 Sep 2008 16:47:28 -0700
Message-ID: <48C70B10.3040405@vfive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


I'm trying to get a handle on whether or not it's possible to set up the 
following on a redundant pair of boxes:

1. Stateful iptables firewall
2. LVS director (keepalived)
3. DNAT, SNAT and fwmarks
4. Connection synchronization for failover

I currently have CentOS/RHEL 5 running 1, 2 and 3 above but the RHEL 
2.6.18-* kernels don't export LVS connections to netfilter resulting in 
lots of INVALID packets on return traffic from real servers.  It also 
prevents connection synchronization to the backup fw/director for 
failover.  Google has been giving me conflicting results on the 
following questions:

* Do the antefacto patches allow netfilter to access connections managed 
by ipvs and support DNAT, SNAT and fwmarks used in the LVS configuration?

* Has anyone gotten this to work on RHEL/CentOS via a kernel recompile 
with the antefacto patches?

If so, is there anything needed beyond the following?:

1. Recompile CentOS kernel (2.6.18 ok?) with Antefacto patches 
(http://www.ssi.bg/~ja/nfct/)

2. Setup conntrackd - will mirror the connection information 
synchronized by keepalived at the netfilter level.  Will conntrackd work 
on RHEL/CentOS 5.2?

Are libntnetlink or libnetfilter_conntrack required?  I have been 
reading all day but don't yet follow how all of the pieces go together. 
  Many thanks for any advice here...


Brian

