From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] tcp: Fix a connect() race with timewait sockets
Date: Wed, 02 Dec 2009 22:38:37 -0800 (PST)
Message-ID: <20091202.223837.203062830.davem@davemloft.net>
References: <4B152F97.1090409@gmail.com>
	<20091202.005937.177088443.davem@davemloft.net>
	<fd1a5ee40912020805r7a490ea2mdf7dc8597b9973b8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <fd1a5ee40912020805r7a490ea2mdf7dc8597b9973b8@mail.gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: ashwas@gmail.com
Cc: eric.dumazet@gmail.com, kdakhane@gmail.com, netdev@vger.kernel.org, netfilter@vger.kernel.org, zbr@ioremap.net

From: Ashwani Wason <ashwas@gmail.com>
Date: Wed, 2 Dec 2009 08:05:51 -0800

> Both reuse and recycle were enabled for this test. (I know because we,
> Kapil and I are working together on different aspects of this.)

Thanks, so the timewait recycling code paths really are relevant.
