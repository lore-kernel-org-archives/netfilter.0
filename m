From: David Miller <davem@davemloft.net>
Subject: Re: route sorting
Date: Mon, 17 Oct 2011 17:41:46 -0400 (EDT)
Message-ID: <20111017.174146.1822773352015956237.davem@davemloft.net>
References: <4E9C2BA6.6030507@mejor.pl>
	<4E9C449D.2060907@tolaris.com>
	<4E9C4BD7.7000403@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E9C4BD7.7000403@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: mr.dash.four@googlemail.com
Cc: tyler@tolaris.com, marcin@mejor.pl, netfilter@vger.kernel.org

From: Mr Dash Four <mr.dash.four@googlemail.com>
Date: Mon, 17 Oct 2011 16:37:59 +0100

> I am still curious though why the sorting order in the old "route" has
> changed from one kernel version to the next?

Because the underlying datastructure used to hold the table
has changed.
