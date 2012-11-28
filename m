From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Mark traffic on one machine, match on another machine?
Date: Tue, 27 Nov 2012 21:09:10 -0800
Message-ID: <50B59C76.5050706@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1354079364;
	bh=iS3Zbgm5kEJk1max7f9NQ9dPvByp4jbguk6Bd8gf8do=;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=0rDwxqcavmpHEnSNaG0p2MFda3D3FohZ7rJFawukC2YDUXHB1vxm4oHyHwfIIUWKY
	 rb+Hp41nIC6Ddo9wvPY+SFiF405JSCgU21npfAeey6aF7n4Sso/e4PeYZUHkvThdK1
	 5mrXKciPG+4EDnGjdbgMr1aXkkAIXXm+RRNQPu0k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is there a way to mark traffic on one machine (proxy server) and match 
the mark on another machine (router)?

I want to shape web traffic differently depending, for example, on the 
requested domain. Our proxy server already knows about criteria like the 
requested domain, and our router already does traffic shaping, but the 
proxy and the router are on two separate machines. Is there a way to 
mark traffic on one machine and match the mark on another machine? so I 
can classify traffic on the proxy server and shape it on the router?
