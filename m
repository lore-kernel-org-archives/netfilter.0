From: aksingh@hss.hns.com
Subject: Re: injecting new packets into the netfilter
Date: Tue, 29 Jun 2004 10:48:41 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF320C2260.F50A62E7-ON65256EC2.001D032A@hss.hns.com>
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
To: Mayank Kumar <mayank_kumar@intersolutions.stpn.soft.net>
Cc: netfilter@lists.netfilter.org





Hi,

  Try libnet for injecting new packets, you can use raw packets(u inject
from userland), libnet provides you with a better interface, but you wld
need root permission to use raw sockets. you can get libnet library from
packetfactory.net

HTH
Amit




"Mayank Kumar"
<mayank_kumar@intersolutions.stpn.soft.net>@lists.netfilter.org on
06/29/2004 10:17:16 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    <netfilter@lists.netfilter.org>
cc:

Subject:    injecting new packets into the netfilter


Hi all,
I want to know how can we inject absolutely new packets at
various hook points in netfilter. I have already seen
some questions posted on this earlier too but no replies
as such. I am very eager to know about this because using
this we can construct some really cool stuff. Currently we
are undergoing a project on this and it would be of greate
help if somebody can find a solution to this.

Thanks in advance for any help on this.
regds
Mayank






