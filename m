From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: how to upgrade an installed iptables?
Date: Mon, 18 Jul 2005 12:14:51 +0200
Message-ID: <42DB811B.7060404@mnemon.de>
References: <3115d56e0507172241b07d0bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0507172241b07d0bf@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

afshin lamei schrieb:

> how can i upgrade from iptables 1.2.8 to 1.2.9, 1.3, ... etc? there is
> a patch named patch-iptables-1.2.8-1.2.9, can i apply it on an
> installed 1.2.8 one?

I did it with 1.3.1->1.3.2 and it worked well. If you decide to compile
your own iptables, you should take care of the paths. E.g. debian has
/sbin/iptables and the sources from netfilter.org install in
/usr/local/sbin. If you don't want this, edit the Makefile and chnge
vars PREFIX, LIBDIR,..., to fit your needs.

Have a nice time,

Joerg


