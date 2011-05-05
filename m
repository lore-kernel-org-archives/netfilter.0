From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to programatically atomically write one CHAIN (not table)
Date: Thu, 5 May 2011 16:08:53 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105051603080.15936@obet.zrqbmnf.qr>
References: <0960E691FF860DE35219EA38@nimrod.local>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0960E691FF860DE35219EA38@nimrod.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter@vger.kernel.org

On Thursday 2011-05-05 14:14, Alex Bligh wrote:

> What is the best way to programatically atomic add/replace an
> entire chain. Assume the table has lots and lots of chains.

Because table-replace is an atomic operation, so are all smaller 
operations based upon it.

> Calling "iptables" itself is non-atomic.

iptables does issue a table-replace, so it is atomic. -- Within the one 
rule you wanted to add.

If you want to change multiple rules in one go, don't use iptables, use 
iptables-restore.

> Opening a pipe to iptables-restore with "-n" passed
> is an option provided I prefix the chains concerned
> with "-F <chainname>" (I can't pass the whole thing
> and avoid -n as the chain might have (say) 10 rules,
> but there might be 100 chains, so this will
> be grossly inefficient). However, looking at the
> source, it appears merely to call do_command to
> parse each line, and I can't see how this can be
> atomic.

do_command alone does not commit the result.
restore is right in what it does.
