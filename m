From: "Giacomo" <delleceste@gmail.com>
Subject: help understanding source comment (ip_conntrack)
Date: Mon, 12 Sep 2005 13:41:00 +0200
Message-ID: <00a101c5b78e$db3b1ad0$0300a8c0@giacomino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter lists <netfilter@lists.netfilter.org>

Good morning, i did not understand what problems are concerned with

"The checked segment is in window, but our windows are *not*
equivalent with the ones of the sender/receiver"

I have a problem programming a nat module for linux kernel and i would like 
to understand
the problem pointed out in this comment to see if it could be the cause of 
malfunction.

When translating addresses and ports, is it necessary to deal with windows 
or other parameters
such as seq/ack numbers? (I don't touch payload, just ips and ports).

Thanks in advance, Giacomo.

The comment is extracted from ip_conntrack_proto_tcp.c



/*
 * The TCP state transition table needs a few words...
 *
 * We are the man in the middle. All the packets go through us
 * but might get lost in transit to the destination.
 * It is assumed that the destinations can't receive segments
 * we haven't seen.
 *
 * The checked segment is in window, but our windows are *not*
 * equivalent with the ones of the sender/receiver. We always
 * try to guess the state of the current sender.
 *
 * The meaning of the states are:
 *
 * NONE: initial state
.... 


