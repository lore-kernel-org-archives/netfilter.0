From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: debug iptables rules
Date: Tue, 23 Aug 2011 01:18:06 -0700
Message-ID: <1314087487.12014.54.camel@phelix>
References: <CA+b04XnYFUcukqbmQXiKbY4VjUaFs3red56Jfnzm4pj+z6ndRw@mail.gmail.com>
	 <CA+b04XnQ-cKfU9KUu9j_Tf0vp0jtadnNu69_Gob1mPAXVkytMw@mail.gmail.com>
	 <1314027026.2486.7.camel@kushiel.sterenborg.info>
	 <CA+b04Xkw3FkDt0rENt-x-HjOfwxx+R3mYRpjE6BTKpm47ZpC4A@mail.gmail.com>
	 <1314029592.2486.18.camel@kushiel.sterenborg.info>
Reply-To: erik-lists@arpa.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1314029592.2486.18.camel@kushiel.sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: "Rob Sterenborg (Lists)" <lists@sterenborg.info>

I'm surprised nobody has mentioned the TRACE option.
It's used in the 'raw' table, applied to the PREROUTING chain, I
believe.  Every packet that matches/is marked by the TRACE option gets
logged as it traverses every subsequent rule that it matches.  I believe
it also shows when enters and exits a chain, regardless of matching
rules within it.

It's perfect for tracing initial connection packets (e.g. SYN-only)
through all your filters and nat chains.  It can generate LOTS of
logging traffic if you're not careful.


