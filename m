From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] tcp: Fix a connect() race with timewait sockets
Date: Wed, 02 Dec 2009 00:59:37 -0800 (PST)
Message-ID: <20091202.005937.177088443.davem@davemloft.net>
References: <99d458640911301802i4bde20f4wa314668d543e3170@mail.gmail.com>
	<4B152F97.1090409@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B152F97.1090409@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: eric.dumazet@gmail.com
Cc: kdakhane@gmail.com, netdev@vger.kernel.org, netfilter@vger.kernel.org, zbr@ioremap.net

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Tue, 01 Dec 2009 16:00:39 +0100

> [PATCH] tcp: Fix a connect() race with timewait sockets

This condition would only trigger if the timewait recycling sysctl is
enabled.

It is off by default, and I can't find any mention in this bug report
that it has been turned on.
