From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/2] tcp: Fix a connect() race with timewait sockets
Date: Tue, 08 Dec 2009 20:18:50 -0800 (PST)
Message-ID: <20091208.201850.06581533.davem@davemloft.net>
References: <99d458640911301802i4bde20f4wa314668d543e3170@mail.gmail.com>
	<4B152F97.1090409@gmail.com>
	<4B1912CE.5040304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4B1912CE.5040304@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: eric.dumazet@gmail.com
Cc: kdakhane@gmail.com, netdev@vger.kernel.org, netfilter@vger.kernel.org, zbr@ioremap.net

From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Fri, 04 Dec 2009 14:46:54 +0100

> First patch changes __inet_hash_nolisten() and __inet6_hash()
> to get a timewait parameter to be able to unhash it from ehash
> at same time the new socket is inserted in hash.
> 
> This makes sure timewait socket wont be found by a concurrent
> writer in __inet_check_established()
> 
> Reported-by: kapil dakhane <kdakhane@gmail.com>
> Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>

Applied and queued up for -stable.
