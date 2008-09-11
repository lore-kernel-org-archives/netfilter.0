From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: IP Tables and DNS
Date: Thu, 11 Sep 2008 14:53:40 -0400
Message-ID: <u1qic49dl8q0020pbblh2o4pdm3gi5nrfd@4ax.com>
References: <s8c926a0.083@newborder.reinhardt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> Does netfilter/iptables keep up with "connections" in UDP, even though UDP is connectionless?

Yes.  ICMP, too.

>  ie - How does it assure that it only accepts responses from the IP that it sent the query to?  I saw a posting from Jan back about 3 years ago that said that as long as the response came back within ~30 seconds then netfilter would allow the response in.  Is that still the case?

Can't remember now exactly how this works... but it's something like that.

>  If so, do I need any rules on the external interface other than the rules to allow the outgoing query (tcp and udp) and an "established,related" rule?

Nope.  "Established" covers direct replies to UDP packets (i.e. DNS requests)
that you've already sent out, so that's probably all you need in this case.
"Related" covers new connections related to the first one, such as FTP data
connections triggered by FTP control traffic.  I don't think there are any
"related" criteria that apply to DNS.

A.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
