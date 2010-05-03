From: Simon Tennant <simon@imaginator.com>
Subject: DNAT issue (with added network diagram)
Date: Mon, 03 May 2010 15:23:38 +0200
Message-ID: <4BDECE5A.4010808@imaginator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272893024;
	bh=//ilmBuIYH7IVKn39B3Z/Th19Mgokjz8czI6lddQ9r0=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=D81Bzq3eATnrLShmr1WsYiNSTaHhDMRZe2MaPYw03EienuILAgKc93eOIDHQI2hnE
	 cSxH1dq+FXCRsQae1g76sE00zWO5O2RmdYYOvPenBaKT/5e8cx8SQDXMKc4UKftgP+
	 DxoIGN4gQQraJNrR795jCEuk5t0ODQzi2SobU+tQ=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=imaginator.com;
	s=mail; t=1272893019;
	bh=//ilmBuIYH7IVKn39B3Z/Th19Mgokjz8czI6lddQ9r0=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=S0OLm7sjSpq+p9fj+fnTAPi4AlOnk+1KI0n3JESEFaXivAii3M7sSZhLB9Ff0sAGW
	 F5MNlw9dyTfqtYVnW5Kj4Nx5Kf8hRV8X0cLcN2Z/fJXSdlYuU8fGP/1JqCF05f9+qv
	 4E+HCkQoJ0tWh6s8L1i1QTcl6cMPee3ygfIbfotE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Problem:

Two different applications that need to be accessible on port 443 on one 
host with 1 ip address.  Apache already runs on the destination machine 
and uses port 443.

Partial solution:

1. Change DNS to tell the client to connect to another host, and.
2. use another host that is not running anything on port 443 to receive 
and forward the connctions using a "-j DNAT --to-destination" rule.

But:

What happens when a client on the destination also needs to connect and 
looks up the service in DNS?  It connects out and is DNAT'ed back to itself.

A quick diagram:

http://docs.google.com/drawings/pub?id=1dxCOw8wbAhyuz7z1-ukJfmKOHcymsqN6YTRCjrTh_MY&w=1440&h=1080

My question is what DNAT or SNAT rules do we need to add to cave or to 
maar so that remote *and local (originating from cave)* clients can make 
xmpp connecitons on 443 and end up on cave:5222?

S.

-- 
Simon Tennant

+44 20 7043 6756 (UK - office)
+49 17 8545 0880 (Germany - mobile)
+49 89 4209 55854 (Germany - office)
skype: simontennant
xmpp: simon@buddycloud.com

