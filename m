From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH 1/2] tcp: Fix a connect() race with timewait sockets
Date: Sun, 6 Dec 2009 00:21:48 +0300
Message-ID: <20091205212148.GA26270@ioremap.net>
References: <99d458640911301802i4bde20f4wa314668d543e3170@mail.gmail.com> <4B152F97.1090409@gmail.com> <4B1912CE.5040304@gmail.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4B1912CE.5040304@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: kapil dakhane <kdakhane@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi Eric.

On Fri, Dec 04, 2009 at 02:46:54PM +0100, Eric Dumazet (eric.dumazet@gmail.com) wrote:
> First patch changes __inet_hash_nolisten() and __inet6_hash()
> to get a timewait parameter to be able to unhash it from ehash
> at same time the new socket is inserted in hash.
> 
> This makes sure timewait socket wont be found by a concurrent
> writer in __inet_check_established()

Both patches look good, although trick with returning reference counter
may look like a hack especially when only viewing into ip code and not
hashtable itself. Can you please cook up a documentation update for hash
function that it is supposed to return refcnt when socket was in hash
table.

-- 
	Evgeniy Polyakov
