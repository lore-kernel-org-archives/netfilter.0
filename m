From: Yury Polyanskiy <ypolyans@princeton.edu>
Subject: Re: martian destination and RAW iptable
Date: Wed, 28 Jan 2009 02:55:08 +0300
Message-ID: <ea182b20901271555s258f40ect362affc080a2372f@mail.gmail.com>
References: <ea182b20901270724r3c7909dbo7ddec6bc92c8afa6@mail.gmail.com>
	 <ea182b20901270725n3fde42e4i166b346a919a3050@mail.gmail.com>
	 <497F504E.9040807@chello.at>
	 <ea182b20901271134j2515994dk3db95ef073d47554@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=CdGMS1DQwP+UPMnYIFeqCkVg3K0ACKfllhDEODsKVok=;
        b=NuWDnnWNXC1gMeOQQWxNJroG8/R6xXV21WnpRPSP935gbbKGRblnkgkVJ+nJJ54CCr
         BdQpK/jBpO5w7ySRPg4hfpmaB2s3rjrovehmj1xm+cuCwE02xI7g8EvhNphkn0CG6M6R
         kV8KRd/rzxfWSJT0i/q7jxckv63nKetTtlwN0=
In-Reply-To: <ea182b20901271134j2515994dk3db95ef073d47554@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

>>>
>>> I wanted to filter out the annoying logs:
>>>
>>> Jan 24 00:19:54 tetra kernel: martian destination 0.0.0.0 from 1.2.3.4,
>>> dev eth0
>>>
>>> and issued the following:
>>>
>>> #iptables -t raw -I PREROUTING -s 1.2.3.4 -d 0.0.0.0 -j DROP
>>> #iptables -t raw -I PREROUTING -s 1.2.3.4 -j DROP
>>>
>>> Amazingly, I'm still getting those pesky log messages. How is this
>>> possible?

The problem was in arp_process():

 814        if (arp->ar_op == htons(ARPOP_REQUEST) &&
 815            ip_route_input(skb, tip, sip, 0, dev) == 0) {

So the packet "arp who has 0.0.0.0 tell 1.2.3.4" triggered those log messages.

Sorry for spamming.

Best,
Yury
