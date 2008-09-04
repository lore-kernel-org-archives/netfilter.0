From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Thu, 04 Sep 2008 15:27:59 +0200
Message-ID: <48BFE25F.2080002@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org> <48BD5931.7050703@bock.nu> <48BD6846.9030006@netfilter.org> <48BD6FEC.5090100@bock.nu> <48BE5547.8030505@netfilter.org> <48BE747D.3010106@bock.nu> <48BFD49A.8070304@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BFD49A.8070304@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Pablo Neira Ayuso wrote:
> * I had to rise the default value of SocketBufferSize and
> SocketBufferSizeMaxGrowth in conntrackd.conf to avoid netlink overflows
> with such amount of traffic. There are log messages in conntrackd.log
> that warn about this issue. Also, you can notice this if you observe
> that conntrackd hits 100% CPU consumption at some point - this happens
> when netlink overflows.

We already raised these values in the past. There are no hints in the
log about overflows.


> * Also, I had to rise the default value of McastSndSocketBuffer and
> McastRcvSocketBuffer since I was noticing packets lost via conntrackd -s
> - see multicast sequence tracking. This happens when the link gets
> pretty congested because of

Since upgrade to >0.9.6, there's no problem with multicast packets in
'conntrackd -s'. On the other hand, we have a dedicated 1 gigabit link
as cluster interconnect. I do not expect congestion there.


> With these tweaks the results were good, conntrackd was consuming about
> the same percetange of CPU than ksoftirqd (~25% each via top, which is
> not very reliable but it's OK for an estimation).

We have quad core machines, and CPU is idling a lot. 2 of the cores are
idle 100%, two are idle around 50%.


> 1) does /var/log/conntrackd.log - or syslog - tells anything relevant?
> Are the entries being comitted to kernel-space successfully?

according to both conntrackd.log and syslog, entries are being commited.
I see no relevant negative entries in both logs (except of course the
INVALID packets).


> 2) Can you see the committed entries in the kernel via `conntrack -L'
> after the fail-over?

yes.


> 3) Are you noticing any abnormal CPU consumption?

no.


Best regards
Bernhard



