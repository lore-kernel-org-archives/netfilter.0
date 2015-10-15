From: Ben Swartzlander <ben@swartzlander.org>
Subject: Using NPTv6 with stateful firewall
Date: Wed, 14 Oct 2015 22:40:15 -0400
Message-ID: <561F120F.4070601@swartzlander.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=swartzlander.org; h=to
	:from:subject:message-id:date:mime-version:content-type:
	content-transfer-encoding; s=swartzlander.org; bh=/mqIbHsGS6HMTa
	hGpxVN+njlJf0=; b=h1l9P7v0LmzZXOusVVC5KbSySwLentr426eQ8t/BWzltJ3
	uMPTBpZtxdGHqxqpJjeac4HfFThRmIEj3wJ6k5bP/pWlHwS5rOEviJDAR57jJY/Z
	sJIB32aOs07JvH0hwl1rn5dETDW/Xi9NvSgt3fTK3JTwqlmhN4vxCV1avVkLA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Like many people I'm struggling to figure out how to best manage an IPv6 
network with multiple WAN connections. I discovered the NPTv6 concept 
and read up on the implementation in ip6tables. According to the 
documentation (I haven't tried it yet) I must disable connection 
tracking if I use the DNPT and SNPT targets in ipt6tables [1]. This 
seems to be a fairly serious limitation, because in my case the router 
and the firewall are the same machine, and the whole point of a stateful 
firewall is to track connections and only allow incoming packets related 
to existing connections. Those who dislike NAT like to remind us that 
the security an IPv4 NAT router gives us comes from the stateful 
firewalling, not from the NAT feature, so it seems strange to implement 
an address translation scheme that prevents connection tracking.

I'm wondering if I'm missing something in the docs and if there actually 
is a way to do both IPv6 prefix translation and connection tracking at 
the same time, or if it's the case that what I want simply isn't 
implemented yet (or maybe never will be, perhaps with a good reason?) I 
also noted that NPT doesn't modify the payload like normal NAT [2] which 
seems like another serious limitation, making me think that perhaps the 
feature in netfilter is still experimental and not fully implemented.

I'm still hopeful that NPTv6 could be a good solution for multi-WAN with 
IPv6, at least until other solutions materialize, such as the work of 
the IETF homenet working group [3]. In the mean time it's a very big 
hassle to manage multiple prefixes on my network which periodically 
change at the whim of my ISPs, and I have absolutely no solution to help 
hosts choose the "better" prefix by default without manually configuring 
each host.

-Ben Swartzlander

[1] http://ipset.netfilter.org/iptables-extensions.man.html#lbCW
[2] http://www.spinics.net/lists/netfilter/msg53833.html
[3] https://tools.ietf.org/wg/homenet/
