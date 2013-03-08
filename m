From: Jim Mellander <jmellander@lbl.gov>
Subject: Netfilter applied to specific interfaces only
Date: Fri, 8 Mar 2013 11:14:07 -0800
Message-ID: <CADju=b7RdboFOXvPRSn=Ax-+pihecm_Txf-JCHLYum_gjSC9dw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Greetings.

In the HPC world, and in network intrusion detection, network
performance is paramount.  We've found that just having the iptables
kernel module loaded without any ruleset substantially reduces
performance at high traffic rates.  Some preliminary performance
measurements:

The total traffic (reported by the iperfs) was:

~18 Gbps with IPTables enabled - no ruleset
~24 Gbps with IPTables disabled

Disabling IPTables (and unloading the associated kernel modules)
seemed to significantly improve performance, but running with IPTables
disabled in production is undesirable.

Typically, we have interfaces that are external facing that we would
like to run IPtables on, but the internal interfaces which are just
for internal cluster communications must run as fast as possible.  A
similar issue occurs during high-speed network intrusion detection -
we want the management interface to be subject to iptables, but we
don't want the performance hit of netfilter impeding traffic at the
interfaces monitoring the network.

So, what would be desirable to see is a sysctl setting that would tell
netfilter to *completely* stay out of the way on a per-interface
basis.  Many supercomputers run linux, and it would be nice to also
run iptables, but the performance hit is unacceptable.

Thanks in advance,

Jim Mellander
NERSC Cybersecurty
