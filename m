From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: IP Tables and DNS
Date: Fri, 12 Sep 2008 09:42:11 +0200
Message-ID: <200809120942.11190.vladislav.kurz@webstep.net>
References: <s8c926a0.083@newborder.reinhardt.edu> <u1qic49dl8q0020pbblh2o4pdm3gi5nrfd@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <u1qic49dl8q0020pbblh2o4pdm3gi5nrfd@4ax.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday 11 of September 2008, Andrew Schulman wrote:
> >  If so, do I need any rules on the external interface other than the
> > rules to allow the outgoing query (tcp and udp) and an
> > "established,related" rule?
>
> Nope.  "Established" covers direct replies to UDP packets (i.e. DNS
> requests) that you've already sent out, so that's probably all you need in
> this case. "Related" covers new connections related to the first one, such
> as FTP data connections triggered by FTP control traffic.  I don't think
> there are any "related" criteria that apply to DNS.

What about some ICMP (port|host) unreachable packet when you try to query a 
broken DNS server? Isn't that a RELATED packet?

-- 
Regards
        Vladislav Kurz
