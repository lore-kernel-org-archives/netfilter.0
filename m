From: Alex Bligh <alex@alex.org.uk>
Subject: How to programatically atomically write one CHAIN (not table)
Date: Thu, 05 May 2011 13:14:39 +0100
Message-ID: <0960E691FF860DE35219EA38@nimrod.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

What is the best way to programatically atomic add/replace an
entire chain. Assume the table has lots and lots of chains.

Calling "iptables" itself is non-atomic.

I could build an entire replacement chain with a different name
(through repeated calling of iptables -A), then change the
jump statement that calls it. But that seems horribly
inefficient.

Opening a pipe to iptables-restore with "-n" passed
is an option provided I prefix the chains concerned
with "-F <chainname>" (I can't pass the whole thing
and avoid -n as the chain might have (say) 10 rules,
but there might be 100 chains, so this will
be grossly inefficient). However, looking at the
source, it appears merely to call do_command to
parse each line, and I can't see how this can be
atomic. Also, I'd like to avoid the fork().

The FAQ seems to suggest calling any form of library API
is bad.

Any ideas?

-- 
Alex Bligh
