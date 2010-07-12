From: Adam Gundy <arg@cyberscience.com>
Subject: conntrackd not replicating NATted FTP connection properly?
Date: Mon, 12 Jul 2010 08:40:24 -0600
Message-ID: <4C3B2958.20708@cyberscience.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've set up a pair of redundant routers using keepalived and conntrackd.
Part of their job is to handle routing to an FTP server in a NATted DMZ.

both servers are running Ubuntu Lucid, but for other reasons I've switched
to a stock 2.6.33.5 kernel. I've also tried building the 0.9.14 version of
conntrack to see if it fixed the problem (lucid ships with 0.9.13).

this works great, except that an existing FTP connection gets 'broken' when
the master flips to the other machine. the data connection is fine, but the
control connection seems to have broken sequence numbers - the leading four
(or eight) bytes in the next packet sent is ignored. (example packet trace
available off list).

looking at the conntrack source code, it seems to suggest that the NAT
'sequence offset' should be replicated... but it clearly isn't being?

am I supposed to match a particular version of conntrackd to the kernel?

is NATted FTP not supported by conntrackd?
