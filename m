From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Tue, 02 Sep 2008 11:56:38 +0200
Message-ID: <48BD0DD6.9000803@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BD09B6.5010905@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Bernhard Bock wrote:
> Pablo Neira Ayuso wrote:
>> I think that I have reproduced your problem in my testbed. Say you have
>> two nodes: A and B. Initially, A is primary and B is backup.
>>
>> 1) you generate tons of http traffic: A succesfully replicates states to B.
>> 2) you trigger the fail-over: B becomes primary and A becomes backup. B
>> successfully recovers the connections. Moreover, if you do `conntrack -L
>> -p tcp' in A, you see lots of entries.
>> 3) Just a bit later - 30 seconds later or so - you trigger the fail-over
>> again from B to A. In this case, A fails to recover the entries showing
>> tons of INVALID messages.
> 
> Well, not exactly. My problem occurs already in step 2.
> 
> Before starting the test, I stop conntrackd on both nodes, clear the
> connections from the table with 'conntrack -F' and start conntrackd
> again. Both nodes have empty connection tracking tables at this point in
> time. Then I start the HTTP traffic and trigger the fail-over.
> 
> I see the INVALID messages on the first fail-over, as soon as I have
> more than about 500 (with NAT) to 750 (without NAT) parallel TCP
> sessions, built up and teared down rapidly.

That's exactly the test that I do in my testbed and it works fine here,
the problem must be elsewhere. The following line should help to see how
the connection tracking is marking the traffic as invalid:

echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

However, please see the comment below before doing this and repeating
the test.

> I'm not sure where the bottleneck is in this case. CPU of the nodes and
> bandwith of the "node interconnect" (dedicated interfaces) are not busy
> at all.

Are you using a sane stateful rule-set similar to the described in the
conntrack-tools website? What kernel version are you using? If your
kernel is < 2.6.22 you have to disabled TCP window tracking on both nodes.

echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal

>> This problem is fixed in the git repository. Now, we purge the entries
>> in A once this node becomes backup after 15 seconds - this parameter is
>> tunable via PurgeTimeout. Thus, the old entries does not clash with the
>> brand new.
> 
> I compiled the current version from git. Unfortunately, it does not
> change the results for me.

There is a new script `primary-backup.sh' that replaces the old
script_master.sh and script_backup.sh. Although this is not directly
related it would be worth to use that instead as it will be the standard
in the upcoming release.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
