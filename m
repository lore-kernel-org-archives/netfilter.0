From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: IP Tables and DNS
Date: Fri, 12 Sep 2008 10:13:54 -0400
Message-ID: <6nskc4dhshenokacdlk6di8ljhbi6h0e5p@4ax.com>
References: <s8c926a0.083@newborder.reinhardt.edu> <u1qic49dl8q0020pbblh2o4pdm3gi5nrfd@4ax.com> <200809120942.11190.vladislav.kurz@webstep.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> > Nope.  "Established" covers direct replies to UDP packets (i.e. DNS
> > requests) that you've already sent out, so that's probably all you need in
> > this case. "Related" covers new connections related to the first one, such
> > as FTP data connections triggered by FTP control traffic.  I don't think
> > there are any "related" criteria that apply to DNS.
> 
> What about some ICMP (port|host) unreachable packet when you try to query a 
> broken DNS server? Isn't that a RELATED packet?

Good point, and that could apply for any type of connection.  I'm not sure if
those are matched by ESTABLISHED or RELATED.  I guess there's no harm in
matching against both.

I just looked at my firewall.  The incoming DNS rule matches only ESTABLISHED,
not RELATED.  It's matched 12,000 times since boot.  Later on there is a generic
RELATED match, but it's only matched 19 times.  So FWIW, it seems to me that
ESTABLISHED covers essentially all you need for DNS replies.

Andrew.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
