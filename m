From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Thu, 04 Sep 2008 14:29:14 +0200
Message-ID: <48BFD49A.8070304@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org> <48BD5931.7050703@bock.nu> <48BD6846.9030006@netfilter.org> <48BD6FEC.5090100@bock.nu> <48BE5547.8030505@netfilter.org> <48BE747D.3010106@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BE747D.3010106@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Hi Bernhard,

Bernhard Bock wrote:
> Pablo Neira Ayuso wrote:
>>>> Is the firewall sending RST packets to the peer/server to close
>>>> connections? If so, I remember a similar report with a RHEL kernel:
> 
> I do not see any RST packets, neither on server nor on client side.

Fine.

> I have done more tests this morning. Unfortunately, things are complicated:
> 
> I repeated a basic failover test lots of times while making 1.000.000
> connections. This test with 1000 parallel connections breaks every time.
> 500 is OK every time.

In my testbed [1], with a vanilla linux kernel 2.6.26.3 with no patching
at all, using conntrack-tools current git-snapshot, on debian using `ab'
- apache benchmark tool - to generate 1.000.000 connections with 1000
parallel connections - with log_invalid set off - I don't see any packet
hitting the log-invalid rule.

I noticed that ab reports ~3000 connection failures when triggering a
couple of fail-overs - to do so, my script sets one of the link down and
5 seconds later it set it up. However, the number of failures is similar
without triggering the fail-over, it is ~1500. I guess that the
connections are timing out after several resends but I notice nothing
abnormal since the packets don't hit the log-invalid rule.

Two comments that I have to do about my tests:

* I had to rise the default value of SocketBufferSize and
SocketBufferSizeMaxGrowth in conntrackd.conf to avoid netlink overflows
with such amount of traffic. There are log messages in conntrackd.log
that warn about this issue. Also, you can notice this if you observe
that conntrackd hits 100% CPU consumption at some point - this happens
when netlink overflows.
* Also, I had to rise the default value of McastSndSocketBuffer and
McastRcvSocketBuffer since I was noticing packets lost via conntrackd -s
- see multicast sequence tracking. This happens when the link gets
pretty congested because of

With these tweaks the results were good, conntrackd was consuming about
the same percetange of CPU than ksoftirqd (~25% each via top, which is
not very reliable but it's OK for an estimation). It would be possible
to reduce this CPU consumption even more by means of the Filter clause -
eg. only replicate TCP ESTABLISHED states.

These tweaks affect the behaviour of conntrackd so that they are worth
to give a try.

> The kernel only has problems with 1000 connections, and then only from
> time to time. In most of the cases (I guess ca. 80% of all tests), I do
> not need to unload/load the kernel modules, but only clear the conntrack
> table to get it back up running. The other times I have to reload the
> kernel modules in order to make the system work again. I cannot see any
> pattern there.

Nor me, and I cannot reproduce the problems that you're reporting.  More
questions to try to diagnose your problem:

1) does /var/log/conntrackd.log - or syslog - tells anything relevant?
Are the entries being comitted to kernel-space successfully?
2) Can you see the committed entries in the kernel via `conntrack -L'
after the fail-over?
3) Are you noticing any abnormal CPU consumption?

[1] http://conntrack-tools.netfilter.org/testcase.html

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
