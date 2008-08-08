From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Fri, 08 Aug 2008 10:47:49 +0200
Message-ID: <489C0835.3090900@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4880A6BA.6030007@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Hi Bernhard,

Bernhard Bock wrote:
> My next step is to run two firewalls in a cluster with conntrackd.
> 
> The basic setup works like a charm. I have increased the HashSize
> parameter in conntrackd as well. It replicates the states to the backup
> firewall just fine.
> 
> Unfortunately, failover works only in about 50% of all tests. There is
> no obvious pattern as to when this failures occur.
> 
> We trigger the failover softly by advertising a higher priority on the
> backup firewall, not by switching off the primary one. If it goes well,
> we do not loose a single connection. If it doesn't go well, we basically
> loose all connections and the apachebench dies. There are hundreds of
> INVALID packets in the syslog, and also some NEW (not SYN). In this
> case, we also see lost packets in "multicast sequence tracking" in the
> conntrackd stats.

I think that I have reproduced your problem in my testbed. Say you have
two nodes: A and B. Initially, A is primary and B is backup.

1) you generate tons of http traffic: A succesfully replicates states to B.
2) you trigger the fail-over: B becomes primary and A becomes backup. B
successfully recovers the connections. Moreover, if you do `conntrack -L
-p tcp' in A, you see lots of entries.
3) Just a bit later - 30 seconds later or so - you trigger the fail-over
again from B to A. In this case, A fails to recover the entries showing
tons of INVALID messages.

The problem are the entries that are stuck in A (see step 2). Those
former entries clashes with newly committed entries and the TCP state
tracking code gets confused with old state information.

This problem is fixed in the git repository. Now, we purge the entries
in A once this node becomes backup after 15 seconds - this parameter is
tunable via PurgeTimeout. Thus, the old entries does not clash with the
brand new.

Moreover, I have completely reworked the fail-over script, you can find
it under doc/ in the conntrack-tools git tree [1]. You may give it a
try. I expect to release a new version of the conntrack-tools with these
updates soon. New (more complete) documentation is also on the way.

Please, let me know how it goes.

[1] http://git.netfilter.org

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
