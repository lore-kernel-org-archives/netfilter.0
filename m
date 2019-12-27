From: Stephen Satchell <list@satchell.net>
Subject: RFC -- IPTABLES vs NFTABLES vs BPFILTER
Date: Thu, 26 Dec 2019 18:32:46 -0800
Message-ID: <4c563d84-2098-9c5e-86ef-b78c704540a6@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I need to build a new firewall for my fiber service.  My current 
firewall is running CentOS 4 and IPTABLES.  When considering what 
service to use, I thought I could use CentOS 8 and NFTABLES to handle 
IPv4 and IPv6 in an easy-to-maintain manner.

After checking the status of CentOS 8, specifically the list of packages 
that are not ready for prime time even though the distribution is in 
release, I needed to reconsider.  I found that the current CentOS 7 
appears to have NFTABLES available.

In the course of investigating this modified course of action, I ran 
into a discussion of BPFILTER.  People with respectable names are using 
this, according to my research, but not necessarily from an existing 
distribution.  I suspect that because there is significant kernel 
involvement, that I would have to wait for another major release of 
CentOS to take advantage of it.

I'm using commodity fanless computers with wall-wart supplies, so 
hardware acceleration is not an option at this time.  So I have questions:

1.  Is anyone using NFTABLES on CentOS 7 "out of the box"?  (I'm not 
talking about firewalld or the GUI tools -- I would expect to use BASH 
or Python to hook to the userspace tools.  The dbus facility appears to 
have some shortcomings.)

2.  Is anyone using BPFILTER in any distribution "out of the box"?

3.  I'm implementing BCP38 by hooking a script to Network Manager, to 
null-route the non-routable networks in such a way that VPN or other 
dynamic connection managers can install routes that would override the 
null route.

4.  Setting the rp_filter setting on the uplink interface to "1" to have 
the IP stack verify that the source address is routable, and would exit 
through the same interface.  I decided against using loose mode reverse 
filtering (setting to "2").

5.  I decided against populating the routing table with null routes from 
the bogon project.  I do populate the routing table with null routes 
from those netblocks that send me malicious traffic.  This mimics the 
ACL blocking I currently do in IPTABLES, with much lower overhead.

Constructive criticism welcome.
