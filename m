From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: ip_conntrack: table full, dropping packet. SAY WHA????
Date: Wed, 10 Sep 2003 12:10:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0309101205130.31430@dns.toxicfilms.tv>
References: <20030909225350.6002.qmail@web40209.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030909225350.6002.qmail@web40209.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SBlaze <dagent.geo@yahoo.com>
Cc: nf <netfilter@lists.netfilter.org>

> Sep  8 22:18:11 kingscross kernel: ip_conntrack: table full, dropping packet.
> Sep  8 22:18:16 kingscross kernel: NET: 371 messages suppressed.
> Sep  8 22:18:16 kingscross kernel: ip_conntrack: table full, dropping packet.
> Sep  8 22:18:21 kingscross kernel: NET: 414 messages suppressed.
> Sep  8 22:18:21 kingscross kernel: ip_conntrack: table full, dropping packet.
> Sep  8 22:18:26 kingscross kernel: NET: 467 messages suppressed.
> Sep  8 22:18:26 kingscross kernel: ip_conntrack: table full, dropping packet.
> Sep  8 22:18:31 kingscross kernel: NET: 436 messages suppressed.
> Sep  8 22:18:31 kingscross kernel: ip_conntrack: table full, dropping packet.
Read the FAQ, it is explained there :)

You'd need to increase ip_conntrack_max. It's explained there.

Regards,
Maciej


