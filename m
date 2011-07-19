From: gapsf@yandex.ru
Subject: Invalidating certain connections in conntrack due route switching
Date: Tue, 19 Jul 2011 11:57:44 +0700
Message-ID: <1125455134.20110719115744@yandex.ru>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1311051470; bh=beOcfRLlFP9fIM5Ot423GUKNMF4cPu3UFgI4CNX+u9A=;
	h=Date:From:Reply-To:Message-ID:To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	b=pp4llz3+uNjNN5NmRNbhpb67CoBsPQqj1R8TZar3+KzJAystaj82P8uUR/bpx2J1c
	 8mXWjWdANFmWC0pPWuarqog+2U8FC/0gsL3pRTcaf8LYc9EeJRIXOSIHLG5bWDRKe5
	 /ZzfXVQehbzZmibMP06Z9fFfZ86KFlGFvr3/VnJE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.
I have a private network (eth0) behind NATed Linux router box
connected to two different ISPs (eth1 and eth3).
Eth1 and eth3 have a different public IPv4 addresses.

In normal mode, most of the traffic from the private network is routed through the first ISP (eth1),
and a specific traffic is routed through a second ISP (eth3) by using policy routing, fwmark and second
routing table with another default route.
When the connection to the first provider dies, all traffic is routed through the second provider
simply by removing appropriate rule from routing policy database.
Everything works fine, but the hosts in the private network
experience slow reestablishment of connections via a new route with a new public address.
I clear the routing cache with 'ip route flush cache'on router, but maybe is not enough.

My guess is that the slow reestablishment of connections may be associated with router's
connection tracking too.
Will the explicit invalidation of connections on router box helps hosts from private network to
reestablish connections faster during ISPs switching?
And if so, how invalidation of certain connections in conntrack subsystem can be done from shell?
Thanks.


