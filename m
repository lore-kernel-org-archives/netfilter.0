From: "David Doster" <DGD@reinhardt.edu>
Subject: Re: IP Tables and DNS
Date: Thu, 11 Sep 2008 18:02:35 -0400
Message-ID: <s8c95d4e.068@newborder.reinhardt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Cool.  Thanks for the info, Andrew.

Dave


>>> Andrew Schulman <andrex@alumni.utexas.net> 9/11/2008 02:53 PM >>>
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
the body of a message to majordomo@vger.kernel.org 
More majordomo info at  http://vger.kernel.org/majordomo-info.html 

--- Scanned by M+ Guardian Messaging Firewall ---


