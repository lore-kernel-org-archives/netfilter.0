From: Fisher Alex <Alex.Fisher@uk.thalesgroup.com>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 13:36:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4087BC5F.5010806@uk.thalesgroup.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> However, if someone is adamant that you need to set up network
connectivity 
> between machines with such an unfriendly combination of IP addresses, I 
> suggest you simply set up multiple host-specific routes on the netflter 
> machine, telling it where to find each different 192.168.0.* destination 
> address, and don't have a standard 192.168.0.0/24 route on that system.

Unfortunately, this is exactly what I can't do :(  This is because there 
are two of each 192.168.0.* IP address.  The original destination IP 
address has to taken into account when determining whether packets route 
through eth1 or eth2.

I like the idea of MARKing the packets before they are routed.  DNATing 
them and then routing based on how they were previously MARKed.  As I 
get more comfortable with this (assuming nobody claims I'm trying to do 
the impossible), I'll try and put together some rules I might use to 
accomplish this.

Al
This email and any attachments are confidential to the intended recipient
and may also be privileged. If you are not the intended recipient please
delete it from your system and notify Thales Underwater Systems on +44 1963
370 551. You should not copy it or use it for any purpose nor disclose or
distribute its contents to any other person.

