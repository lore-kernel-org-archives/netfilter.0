From: tony@enfusion-group.com
Subject: Re: lifecycle of a packet (OT)
Date: Fri, 10 Jan 2003 14:24:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042226675.3e1f1df3c6dd9@webmail.enfusion-group.com>
References: <Pine.LNX.4.44.0301101706340.16650-100000@laptop1.agatha> <3E1EFA34.3050700@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E1EFA34.3050700@fugmann.dhs.org>
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
To: Anders Fugmann <afu@fugmann.dhs.org>
Cc: Oskar Andreasson <blueflux@koffein.net>, netfilter@lists.netfilter.org

Quoting Anders Fugmann <afu@fugmann.dhs.org>:
> Btw. Thanks for a great tutorial. Keep up the good work.

Yes, that tutorial really helps, thanks Oskar.  I think it should be
given some sort of "Official" status on the netfilter web site, and they
should definately link to yours instead of hosting an old version.

Just a few suggestions for the tutorial (take 'em or leave 'em ;):

General:
- it would be useful if the guide referred to the versions of
iptables/kernel for which it it is known to be valid

Traversing of tables and chains section:
- the version on netfilter.org is old, doesn't link to the original, and
has broken links (the rc.test-iptables.txt script, for example)
- might benefit from mentioning that EST/REL packets don't traverse the
NAT chain, and why
- as a newbie to iptables and the kernel network stack, I find it
easiest to think in context of an actual connection that I can test.  As
such, it might benefit from using example connections to illustrate,
such as in my original post, ie:
   masq client -> firewall
   masq client -> external
   firewall -> external
   firewall -> firewall  (thanks Joel Newkirk!)


Thanks Oskar, Joel, and Anders!


