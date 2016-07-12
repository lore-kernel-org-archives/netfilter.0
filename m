From: Alex Bligh <alex@alex.org.uk>
Subject: Selective proxy ARP
Date: Tue, 12 Jul 2016 17:50:41 +0100
Message-ID: <515FCDC1-BB06-4AD4-BFE6-383AA8561395@alex.org.uk>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=alex.org.uk; s=mail;
	t=1468342242; bh=C8SXinEISw9LKaOuIaEoKXq050eJUMtMkMtMGVxedRQ=;
	h=From:Subject:Date:Cc:To;
	b=AbEVz84pEmM6ryj9a45QaHM0lmeK7L8ptpajq5qalyO/jClg5gZegoLqdDgldtHbO
	 KLszcDyThhShPlbJnZ6HyuOBguS39e61TlZD9qrk0Aok09wuQGBFCPiYDcZKDnLwto
	 YU6oUOyXjuI50c1w6xeOkoFJgJLOvIB/02PA7qrY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>
Cc: Alex Bligh <alex@alex.org.uk>

I am trying to set up what is often called a pseudo-bridge
on a machine in a data centre. The config looks like this:

DC LAN
|
|
|           bond0          br0     veth0
+----------------[ Linux ] ------+-------[ VM 192.0.200.101/24 ]
| 192.0.200.23/24                |
|                                | veth1  
|                                \-------[ VM 192.0.200.101/24 ]


The data centre do not want me to simply make bond0 a member
of the br0 bridge, because they only want to see a single MAC
and are worried about forwarding loops. Fair or not, let's
assume that's a fixed point.

I could get this to work (I think) simply be putting the
appropriate /32 routes in the kernel, and then enabling
proxy_arp on bond0 and br0.

However, I want to be very cautious about what my machine arps
for on bond0. Specifically, I want to ensure it does not arp
for anything except its own address and the other 2 IP addresses
listed.

I'm pretty sure there was some arp masquerade setting that could
be used instead of a straight proxy arp, but now can't find it.
Any ideas?

-- 
Alex Bligh




