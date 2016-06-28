From: zrm <zrm@trustiosity.com>
Subject: How to persistently extend timeout of conntrack entry?
Date: Mon, 27 Jun 2016 21:15:52 -0400
Message-ID: <5bc67686-a9b8-35dd-fd37-a0cadec01ee2@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
	s=mx; t=1467076493; bh=5UiSG2eep51TTkJCfOooaHO8Nf1Kck53VYg9thZWJGU=;
	h=To:From:Subject:Date:From;
	b=gqpWzpahtQANB+zGowDUO9m+YbjpTDdu6bcE9x4TPP6MjYtr9ubnESo6TaLeMpS3Y
	 FV8tOt3odgil5XWlIQpaIVbVMisqLfJ4fyckkV5zSi5d+dhxJYWSo44mR9961PlsAo
	 N8ThppXdFs+pdHDpeHyOShYrfwhRqq7ShAQ44n3E=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a session I would like to have a long timeout for, so I do the 
equivalent of this using the conntrack API:

conntrack -U -s 128.66.1.1 -d 128.66.2.2 -p udp --sport 1234 --dport 
5678 -t 7200

This works fine to set the timeout to two hours, but as soon as there is 
any traffic the timeout is reset to the default (e.g. three minutes).

This could be a bug; new traffic should only extend the timeout, not 
reduce it.

But is there any workaround? Maybe some way to set the value the timeout 
will be assigned when there is new traffic, for only the one session?
