From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Performance tuning w/kernel SYSCTL options
Date: Wed, 5 Jun 2002 11:41:34 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605154134.GI29214@cannon.eng.us.uu.net>
References: <00cd01c20ca3$dffd57c0$0200a8c0@JEFF>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <00cd01c20ca3$dffd57c0$0200a8c0@JEFF>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Bonner <lunar@comcast.net>
Cc: 'netfilter' <netfilter@lists.samba.org>

I'd suggest you to read:

TCP/IP Illustrated, Volume 1: The Protocols, Addison-Wesley, 1994, ISBN 0-201-63346-9

There's no clear-cut answer to the questions below. It's always
a trade-off and most of the time the default values are the
best but for your situation there are lots of factors that
can be determinant other than the information you provided.

Go for this book. You'll enjoy reading it.

God Bless Ricard.

Ramin

On Wed, Jun 05, 2002 at 11:15:49AM -0400, Jeff Bonner wrote:

> I have the following in my iptables script, but commented out for now
> because I'm not sure if they're necessary or useful:
> 
> # echo 30  > /proc/sys/net/ipv4/tcp_fin_timeout         # Reduce dead
> sockets?
> # echo 180 > /proc/sys/net/ipv4/tcp_keepalive_intvl     # Is this even
> needed?
> 
> I've read some of the documentation on these (and many other SYSCTL
> items), but honestly, some is above my head.  What might be the
> appropriate values, if any, to use for a 1.5Mbps down/128Kbps up
> cablemodem connection, on a 486/66 with Debian Woody, serving 3
> NAT/masq'd machines?
> 
> Thanks in advance,
> 
> Jeff Bonner

