From: "David Doster" <DGD@reinhardt.edu>
Subject: IP Tables and DNS
Date: Thu, 11 Sep 2008 14:09:10 -0400
Message-ID: <s8c926a0.083@newborder.reinhardt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi folks,

I'm putting together a recursive DNS resolver for my internal clients.  The resolver has both an internal and an external interface, so it doesn't have to send the outgoing DNS queries through the firewall.  I'm working on the IPTables rules for the external interface, and had a question come up that I wasn't sure about.

Does netfilter/iptables keep up with "connections" in UDP, even though UDP is connectionless?  ie - How does it assure that it only accepts responses from the IP that it sent the query to?  I saw a posting from Jan back about 3 years ago that said that as long as the response came back within ~30 seconds then netfilter would allow the response in.  Is that still the case?  If so, do I need any rules on the external interface other than the rules to allow the outgoing query (tcp and udp) and an "established,related" rule?

Thanks for any help,
Dave Doster


