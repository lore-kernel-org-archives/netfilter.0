From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Fri, 02 May 2008 03:10:28 +0200
Message-ID: <481A6A04.1010000@netfilter.org>
References: <460876.13814.qm@web57307.mail.re1.yahoo.com> <481A47D3.6080201@usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <481A47D3.6080201@usa.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Josh Cepek <josh.cepek@usa.net>
Cc: levynoa@yahoo.com, netfilter@vger.kernel.org

Josh Cepek wrote:
> noa levy wrote:
>> Thank you again for your response. Suppose I do want drop existing
>> connections, but I don't want to add the "drop" rule above the "allow
>> established" rule, for performance reasons. Does netfilter provide any
>> API for flushing the conntrack table (all of it or specific entries)?
> 
> Not easily, and not without disrupting other active connections.  If
> conntrack support is compiled in as modules you can unload and reload
> them, but this requires that no iptables rules reference the conntrack
> module (ie: you must delete such rules first.)  Once unloaded, the
> kernel will forget the maintained state table, but this also has the
> side-effect of breaking any active sessions that were in an ESTABLISHED
> state when you deleted the rules and reset the state table.
> 
> AFAIK there is no way to manually flush the conntrack state table or
> remove specific entries.

This is no longer true as we have the conntrack-tools.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
