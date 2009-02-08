From: Jimbo <l_pool_2003@hotmail.com>
Subject: RTP  stream before DNAT rule
Date: Sun, 8 Feb 2009 11:24:53 +0000 (UTC)
Message-ID: <loom.20090208T105052-760@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a probably common SIP NAT/NAPT problem and I want to see how others have
solved this issue:

I want to dynamically create DNAT rules for RTP streams (port-mapping for a SIP
proxy).
This works fine when I add a rule before the first packet of the RTP stream hits
the port. But, if the RTP stream begins before the rule is in place, it never
matches.
I can insert the DNAT rule only after I have the SDP part of the 200 OK (or any
other 1xx with a SDP body).

Rgds
Jimmy


