From: Max Laverse <max@laverse.net>
Subject: How to reduce insert_failed error on conntrack ?
Date: Fri, 1 Dec 2017 00:12:17 +0100
Message-ID: <EA2E2DBF-6834-4634-8547-87B58C262191@laverse.net>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi!
I’m looking for help understanding in which context the “insert_failed” counter of conntrack gets incremented as I suspect it might explain some issues I’m having.
I read it's the "Number of entries for which list insertion was attempted but failed (happens if the same entry is already present).”

I had a look in the code but I must admit I’m not so familiar with netfilter and masquerading.
If I understood it correctly, the locations where packets are dropped and this counter is incremented, are around verifications if a tuple already exists in the table before inserting it.
 
I could see two reasons why a tuple would already be in the table:
* because no free tuple could be allocated and the code gave an already allocated one
* there was a race condition between the tuple allocation and its final insertion in the table

I don’t believe the first suggestion is right, as the conntrack table is quit empty in my case (around 10k entries).
And I can't think of race conditions happening so often so I’m wondering what I may have done wrong.

My setup is a server running Linux 4.4 with 8 cores, one network interface eth0, a bridge and multiple containers with their own IPs and interfaces, attached to this bridge.
When a container tries to reach an external system with tcp, the outgoing packets are masqueraded. My test is doing requests against another server
Doing around 100connections per seconds from one container to this external server is fine, but as soon as I start another container, I see the “insert_failed” counter increasing and timeout start to appear.
tcpdump show me all the packet leaving the container interface, and reaching the bridge, but some of them are missing on the eth0 capture.

I think in almost all the cases in SYN packets, which sounds sense with the connection tracking insertion failure.

Am I missing something obvious and running in some resource exhaustion ?
If my issue is due to race condition, what could be the reason for it to appear so often ? On 200connections seconds, 15% of them loose at least one packet.

Thanks for your time,
Regards,
Maxime




