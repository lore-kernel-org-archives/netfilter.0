From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Discriminate client requests from transparent proxy requests?
Date: Mon, 17 Dec 2012 23:45:23 -0800
Message-ID: <50D01F13.7030707@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1355816746;
	bh=FQGOb0qeFjlmhYtjI8DmsMj+7aqOvqn3+DRSiN2v02g=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=Yoob8GeKm9cEtNkvDMzuFC5dmb0/AZQEEMFpUk+TeepUnrF35MGiNgliVdPn+nBCG
	 d4BgKTEqo9T0WTpWF1r+sxvmNhF4fUMOuMrHmHxiL96x9nFUo3FDRlJ9QV3LAE7/ia
	 9ct6fL6UNHXVsTTHaO0fUzkuqzehtGWIFto8O3sw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Do you have any advice how to discriminate traffic from clients from 
traffic from our transparent proxy?

Our proxy sends requests to origin servers with the same source address 
as the request from the client, so we can do per-host traffic shaping on 
our router. But consequently I wonder how to discriminate client 
requests from proxy requests, and route the former to the proxy, but not 
route the latter. What options are there?
