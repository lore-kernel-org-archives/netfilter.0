From: Stephen Satchell <list@satchell.net>
Subject: --reject-with icmp-admin-prohibited
Date: Mon, 02 Feb 2004 02:35:56 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075718155.22226.41.camel@ssatchell1.pyramid.net>
References: <04e501c3e95a$e0674aa0$c2bf09ca@huecal>
	 <04fd01c3e963$20fea7e0$c2bf09ca@huecal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04fd01c3e963$20fea7e0$c2bf09ca@huecal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi.

This is a stupid question.  I know it is.  I'm looking for the syntax to
use with -j REJECT in which I can return a ICMP Type 3 Code 13, which is
defined in _TCP/IP Illustrated Vol 1_ as "communications
administratively prohibited by filtering."  The man page is no help. 
The /sbin/iptables -p icmp --help lists only the codes used for matching
packets, not generating them.  I've tried every variation of 3/13 I
could think of.

I finally looked in the source and found "icmp-admin-prohibited" but
when I tried it with 1.2.7 it didn't work.

What's the secret code to get -j REJECT --reject-with
icmp-admin-prohibited to work with 1.2.7?

(signed) puzzled



