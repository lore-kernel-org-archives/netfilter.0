From: Ben Lentz <BLentz@channing-bete.com>
Subject: conntrack accounting
Date: Sat, 29 Dec 2007 21:39:07 -0500
Message-ID: <477704CB.8030809@channing-bete.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=channing-bete.com;
	s=smtp; t=1198982341; bh=hdwDv8bZ0IgmXxuFrY1krC9yLONPHyHHuTbeZm2ZFe
	s=; h=DomainKey-Signature:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding:
	 X-OriginalArrivalTime:X-Antivirus; b=CBIoDf+VzAD2sV9orM2a46YExNAF7
	Iw8WV2h6lheZ6/ZrKt6QUYHVk/z1Er+P5ad3euZ87I/UT0vt+dF299CeQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Greetings list!
I am considering using the conntrack-tools userspace package to perform 
byte level accounting for iptables by reading events from the connection 
tracking table for completed connections and logging the statistics for 
the stateful connection to syslog. It appears that conntrack was really 
designed to keep redundant firewalls' state tables in sync, but I'm 
intrigued by it's ability to use the new connection tracking and state 
notification features in netfilter without having to parse or poll 
/proc/net/ip_conntrack.

The goal I'm trying to accomplish is similar to that of:
conntrack -E conntrack -e DESTROY | logger -t conntrack &

which gives me the ability to log completed (e.g. entered the DESTROY 
state) connections to syslog from kernel-triggered events. It's plenty 
hackish though... it'd be nicer to have an actual daemon that fork()s 
and detaches and closes file descriptors and communicates with syslog 
directly. I understand that a patch has been contributed to allow 
conntrackd to use syslog, but it appears that the logging facility in 
conntrackd is limited to recording startup, shutdown, and error 
information. In any event, the current incarnation of conntrackd does 
not support the long-term recording of event messages.

What would you folks recommend to accomplish this goal? Am I simply 
using the wrong tool here, or is it worthwhile to get a-patchin'?

If more appropriate, I'll repost this in netfilter failover, but since 
I'm not actually looking to do failover (at the moment) I'd figure I'd 
start here.

Thanks in advance for any information or opinions you can provide.
