From: aksingh@hss.hns.com
Subject: RE: injecting new packets into the netfilter
Date: Tue, 29 Jun 2004 11:20:52 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFBEB2E69E.A4B53B89-ON65256EC2.001FE33D@hss.hns.com>
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

 You want to insert packets within the kernel module thta has netfilter
hooks ?, I dont thinkthat is a very good idea, as the packets u send using
a libnet application wld be caught at the netfilter hooks, if the
application resides on the same pc on which yr kernel module that has hook
funcstions resides, then those packets will traverse, local_out, post
routing, pre_routing, local_in etc based on their dest ip addresses, any
packet coming from ethernet wld traverse pre_routing, then local_in or
ip_forward and post_routing .....

Amit




"Mayank Kumar"
<mayank_kumar@intersolutions.stpn.soft.net>@lists.netfilter.org on
06/29/2004 11:15:52 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    Amit Kumar Singh/HSS@HSS
cc:    <netfilter@lists.netfilter.org>

Subject:    RE: injecting new packets into the netfilter


Hi Akash
i know of this library.
But i want to inject packets at precise hooks
in the netfilter. for e.g. i want to inject packets whenever
the need arises ,at the fwding hook or the post routing hook. Will the
raw packets i send using the libnet get caught at hooks inserted using
netfilter at various points.

regds
Mayank

-----Original Message-----
From: aksingh@hss.hns.com [mailto:aksingh@hss.hns.com]
Sent: Tuesday, June 29, 2004 10:49 AM
To: Mayank Kumar
Cc: netfilter@lists.netfilter.org
Subject: Re: injecting new packets into the netfilter






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








