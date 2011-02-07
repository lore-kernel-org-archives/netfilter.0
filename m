From: li.tao@nexgo.de
Subject: sporadic problem with masquerading ppp0 interface
Date: Mon, 7 Feb 2011 19:12:03 +0100 (CET)
Message-ID: <1409763209.53871.1297102323202.JavaMail.ngmail@webmail09.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nexgo.de; s=mail-in;
	t=1297102323; bh=mO7uh5qnbpWtjhkKCRXkq29f7NT7/FlDdJL6oW5qgsA=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=ZPsVkMmpKnjVtRQcBwAFSjhH9/C+M4KVQzxNuI3r2YE2XxKHjdkgl/dqG7Y9922UB
	 1hnglyTG1dPJMhF7FIeDe68+ADUPq/MeNjK6wjgxUom85Eix9+sP3CnhToNWF0SVk0
	 uoC1hn6hPwzVlE/eu/7ZUmSPgL7M938NU50DWGFs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

In one customer project I got sporadic problem with masquerading at ppp0 interface. The simplified setup is as shown below:
Client PC <---------->Linux router<----------->modem<----------->ISP
The Linux router uses the kernel Version 2.6.22.19 and iptables v1.2.11.  

The routing steps are dynamic as described below:
1) Client PC tries to send tcp sync to an internet server
2) The router recognizes these packets and creates a ppp0 interface for this session
3)after the ppp0 gets up, the router masks the tcp packets in the mangle table by iptables, defines a new route in e.g. table 44 (default dev ppp0  scope link) and add a new routing rule (32765:	from all fwmark 0x3 lookup 44). The default GW remains eth1, not changed to ppp0.
4)at the same time the iptables filter table is extended to accept the marked packets and the masquerading rule for ppp0 interface is also added to the nat table (see below)
    pkts bytes target             prot opt   in     out       source               destination         
    0     0       MASQUERADE  all    --    *      ppp0    0.0.0.0/0            0.0.0.0/0    

This schema works well typically with one exception: if the modem connection gets broken and is established again after several minutes, it happens sometimes that all new coming tcp packets from the Client PC afterwards will not be masqueraded although a new masquerading rule for the new creared ppp0 interface (with the old inet address) is added to the nat table again for the new session. In this case the client PC cannot get any tcp response from the internet server. This problem can only be solved by rebooting the router.

Does someone have an idea, what could be the reason for this problem? Can someone explain me the mechanism behind the masquerading for ppp+ interface? I mean where is the dynamic inet address of a ppp interface stored for masquerading purpose and how can the netfilter know that one packet is assigned to the ppp0 interface.   

I would appreciate any help and information very much!

Best regards

Li
