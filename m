From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Redirect to ifb0 outgoing traffic that entered from WAN interface?
Date: Mon, 26 Nov 2012 00:19:41 -0800
Message-ID: <50B3261D.1040406@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1353917995;
	bh=L2S1eTuSAMpWAlk8v++rLhujN4CrJvGz9qonZb8dGCc=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=OZskihyZJzSqdwZ36cJzPzwLZ/tpaDUyEXPMsYnxU5mpeAF+ImNNzFha91bMVppTr
	 ofPDJoM6PH3uee1GkRk6j2V1aZIL+hd00MEpByp+u++NZzjw2B/0KrtbmEe2QPxZTy
	 sjFB2gkUo72iWcYGjECcxmGogLrq3SlD2A1PXQRE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is there a way to redirect to dev ifb0, outgoing traffic that originally 
entered our router on our WAN interface, so I can use TBF to "own" the 
queue?

I want to redirect outgoing traffic, vs. redirecting incoming WAN 
interface traffic with ingress, because I also want to configure 
per-host SFQ, e.g. "tc filter ... flow hash keys dst", and our router 
performs NAT. If I shape incoming traffic, I imagine the destination IP 
of all traffic will be our public IP, so all traffic will belong to the 
same SFQ bucket? Whereas the destination IP of the same traffic on 
egress should be our various different RFC 1918 addresses.

The reason I want to use ifb0, vs. just configuring TFB and SFQ on our 
LAN interface, is that I want to limit the *sum* of our upstream plus 
downstream WAN traffic to < 1.5mbit (to "own" the queue)
