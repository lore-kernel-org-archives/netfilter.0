From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Mon, 21 Jul 2008 02:37:33 +0200
Message-ID: <4883DA4D.4080906@netfilter.org>
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

As you're using the Alarm mode, the time required to resynchronize the
backup and the master is RefreshTime (which is 15 seconds in your config
files). Are you probably triggering the fail-over before that amount of
time?

BTW, you can use "conntrackd -i" and "conntrackd -e" to diagnose
problems, these commands dump the internal and external caches. The
internal cache contains the set of flows that this firewall replica is
filtering. The external cache contains the set of flows that the other
firewall replicas are filtering. Basically, you must to find the same
set of flows in the master's internal-cache and the backup's
external-cache if everything goes fine.

The lost packets reported by the sequence tracking can be reduced with a
clause introduced in 0.9.7 to increase the sender and the receiver
multicast socket buffers.

> One more detail worth mentioning is that we in any case see many
> "connections destroyed failed" in conntrackd statistics, but it does not
> have any visible impact.

This means that the kernel has told conntrackd to destroy a flow that it
is supposed to be in its internal cache. However, conntrackd did not
find such flow in there.

> We use conntrackd version 0.9.6 included with Fedora 9 in Alarm mode.
> Below I have attached the relevant config files snippets.
> 
> Can you (again) give any helpful pointers where I can search?

Until we reach conntrack-tools-1.0, which I expect to reach soon since
most of the pending work is already done, I suggest you to upgrade to
lastest (as for now, it is 0.9.7). This release includes important
improvements, fixes and features. The alarm mode is a bit spamming, I
also suggest you to give a try to the ft-fw and the notrack approaches.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
