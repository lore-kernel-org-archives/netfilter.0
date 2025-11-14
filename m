Received: from telegrapho.inexo.com.br (telegrapho.inexo.com.br [187.17.32.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D98E32A3EC
	for <netfilter@vger.kernel.org>; Fri, 14 Nov 2025 15:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=187.17.32.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132680; cv=none; b=G+x3K9U2nunRPc9RLUraea/tC4Eg5vxyU73/zNiiue7SXPRobzpqp5JHsw4vnAmwSLq1Mxl3DypEINm3JRuyhdvdfXxb/22jWXT2yR5b9EWp9HoDHEZl/bqoZTjoUAZnTlK5C/VeMdIeCxTusDeEXc6vSqWy+q/IQ75zZS5Pj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132680; c=relaxed/simple;
	bh=hxIXoZg94AKh/Vs/E60RWCBnC6l4+e4S2GzMONfrj6k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=O44SgfMoHsRdwmUOB1kUSAVCAVyva+CRH8YU1dRWRQ05U2o6J2SASBTcIzzuMW4RIdFZL0wAQ5tuVioIm4CiEw1Zd0C0wC6r9urt2HOfMWc2M7aOEeSZr16ZmyBH5de1crrNwKuNkD7gTh4/YzmFhXfUByWqBBU2lCIpCcmwprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inexo.com.br; spf=pass smtp.mailfrom=inexo.com.br; dkim=pass (2048-bit key) header.d=inexo.com.br header.i=@inexo.com.br header.b=Nv+2JFYo; arc=none smtp.client-ip=187.17.32.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inexo.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inexo.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inexo.com.br header.i=@inexo.com.br header.b="Nv+2JFYo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inexo.com.br;
	s=mail; t=1763132528;
	bh=+/zUI/G1CUaqIa1tMfRC8DMm2kuu3AuU3cOJ6RPnj1E=;
	h=Date:From:To:Subject:From;
	b=Nv+2JFYo+btxKRvIzDVxTD1OevxvtZL4YKDkjb65p9vYSrwhllycPApGzIIwACjvP
	 HCI+u0US+dNhFwxGcZqfFmxIFabZuRsxjOenhHdiJy0SLgiaS3L2EpJ/o8pmO/caxW
	 +kOBlFINGMnPog1hoxyvT5cqPMybRtetP/VzvHyFcg8Tw63NZT/3wa6pbW3v96CwSo
	 0RCW6LONpJmAOOvKlD0oVQFaavG9MdykFfTlzY58Dz70DwqJEjruain1KX3vo4/2te
	 45FTqxH+dc7Bot9QTho2x0K2QO7EnOSbsMOdGwZeWf40pJEsjPgiI15bQR1CRP+MnV
	 abrI96FMhYUUg==
Received: from pulsar (pulsar.inexo.com.br [187.17.32.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by inexo.com.br (Postfix) with ESMTPSA id C7E533ECCCCA
	for <netfilter@vger.kernel.org>; Fri, 14 Nov 2025 12:02:08 -0300 (-03)
Date: Fri, 14 Nov 2025 12:04:19 -0300
From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Packet misrouted
Message-ID: <20251114120419.484a3145@pulsar>
Organization: InterNexo Ltda.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Dear All

First, my apologies if this is not the correct forum.

I've been struggling with this for a couple of days now.

There is this internal equipment I need to access from one external IP
This equipment only accept connections from local network.
So I use SNAT and DNAT to trick it.

The complicating factor is that the border router has 4 external interfaces,
therefore 4 default routes in 4 different routing tables.
The interfaces are: one pure ethernet that NATs the internal hosts and 
three VLANs to three different ISP with "hot" IPs.
These hot IPs are used to provide global services like SSH, DNS and so, all available
in this border router.

What is the problem?
SNAT and DNAT work as expected and I can ALMOST open the connection.

I see the SYN hitting the equipment coming from outside after being SNAT'ed
and DNAT'ed, I see the equipment replying with SYN+ACK.
I also see the packet being un-NAT'ed at the router.
BUT the packet is directed to the wrong output interface and I can't find why.

Here is the tcpdump packet capture

# tcpdump -npei any port SOMEPORT
11:31:21.916097 eth1  P   ifindex 3 60:b9:c0:11:73:80 ethertype IPv4 (0x0800), length 80: EXTERNAL_IP.52120 > ROUTER_IP_3.SOMEPORT: Flags [S], seq 1107839937, win 64240, options [mss 1460,sackOK,TS val 410409140 ecr 0,nop,wscale 7], length 0

11:31:21.916097 eth1.300 In  ifindex 9 60:b9:c0:11:73:80 ethertype IPv4 (0x0800), length 80: EXTERNAL_IP.52120 > ROUTER_IP_3.SOMEPORT: Flags [S], seq 1107839937, win 64240, options [mss 1460,sackOK,TS val 410409140 ecr 0,nop,wscale 7], length 0

11:31:21.916140 eth1  Out ifindex 3 00:0a:f7:97:18:e4 ethertype IPv4 (0x0800), length 80: 192.168.100.2.52120 > 192.168.100.1.SOMEPORT: Flags [S], seq 1107839937, win 64240, options [mss 1460,sackOK,TS val 410409140 ecr 0,nop,wscale 7], length 0

11:31:21.916309 eth1  In  ifindex 3 48:a9:8a:c0:79:e3 ethertype IPv4 (0x0800), length 80: 192.168.100.1.SOMEPORT > 192.168.100.2.52120: Flags [S.], seq 2585847848, ack 1107839938, win 65160, options [mss 1460,sackOK,TS val 3110495795 ecr 410409140,nop,wscale 7], length 0

11:31:21.916363 eth1  Out ifindex 3 00:0a:f7:97:18:e4 ethertype IPv4 (0x0800), length 80: ROUTER_IP_3.SOMEPORT > EXTERNAL_IP.52120: Flags [S.], seq 2585847848, ack 1107839938, win 65160, options [mss 1460,sackOK,TS val 3110495795 ecr 410409140,nop,wscale 7], length 0

As can be seen at the second and fifth lines the packet SYN enters the router at interface
VLAN eth1.300 (ifindex 9) but is its response SYN+ACK is routed to ethernet eth1
(ifindex 3).

These are the routes I configured:

# ip rule sh
0:      from all lookup local
600:    from ROUTER_IP_1 lookup EBT
610:    from ROUTER_IP_2 lookup NIPBR1
620:    from ROUTER_IP_3 lookup VIVO
32766:  from all lookup main
32767:  from all lookup default

The routing table of interest, in this case, is:

# ip route sh table VIVO
default via DEFAULT_GATEWAY_3 dev eth1.300 src ROUTER_IP_3 
172.16.2.0/24 dev br-vpn-1 scope link src ROUTER_IP_3 
172.16.10.0/24 dev br-vpn-2 scope link src ROUTER_IP_3 
192.168.0.0/24 dev br-vpn-3 scope link src ROUTER_IP_3 

Just for the sake of completeness:
# ip route sh 
default via 192.168.100.1 dev eth1 proto static 

Why doesn't the returning packet hit the VIVO default route if
have a "rule" that states so ??

I know these ip rules apply to the packet since I can SSH into the router to any of
its external IPs. 
Also the VPNs to access users' internal services are Ok.

What am I missing here ?

Please let me know what other info you guys need to help me with this.

Hope to hear from you soon.

Thank you for your time

Regards

Ethy


