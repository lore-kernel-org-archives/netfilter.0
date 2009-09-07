From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 09:33:21 +0200
Message-ID: <4AA4B741.7010209@plouf.fr.eu.org>
References: <4AA4A0D4.3080109@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4A0D4.3080109@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

J. Bakshi a =E9crit :
>=20
> iptables -A INPUT -m recent --name blacklist --rcheck --seconds
> $BLACKLIST_INTERVAL -j DROP
>=20
> and it is working really well. But is there any way to manage the
> blacklisted ip ? Manage means

man iptables

> 1> view the ips which are blacklisted

Read /proc/net/ipt_recent/<name>.

> 2> manually remove an IP from blacklist

Write "-a.b.c.d" into /proc/net/ipt_recent/<name> where a.b.c.d is the
address to remove. You can also write "clear" to flush the list.

> 3> manually insert an IP as blacklist

Write "+a.b.c.d" or "a.b.c.d" into /proc/net/ipt_recent/<name> where
a.b.c.d is the address to add or update.

Warning : ipt_recent may have been renamed xt_recent in recent kernels.
