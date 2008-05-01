From: noa levy <levynoa@yahoo.com>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Thu, 1 May 2008 13:22:47 -0700 (PDT)
Message-ID: <460876.13814.qm@web57307.mail.re1.yahoo.com>
References: <4817B11E.9010803@plouf.fr.eu.org>
Reply-To: levynoa@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4817B11E.9010803@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

Thank you again for your response. Suppose I do want drop existing connections, but I don't want to add the "drop" rule above the "allow established" rule, for performance reasons. Does netfilter provide any API for flushing the conntrack table (all of it or specific entries)? Will stopping the firewall completely flush these entries?


--- On Tue, 4/29/08, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:

> You are asking the wrong question. Iptables is a packet
> filter, it does 
> not filter "sessions" (or connections). As
> already said, the conntrack 
> table is not affected by rule deletion/insertion. So
> whether packets 
> belonging to existing connections are allowed or not
> depends on the new 
> ruleset. If the new ruleset says to ACCEPT packets in the
> ESTABLISHED 
> state, then established connections are still allowed.




      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ

