From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re: IP spoofing
Date: Fri, 11 Apr 2003 00:10:04 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <144621018116.20030411001004@lf.lv>
References: <20030410202645.93C433DF6@xmxpita.excite.com>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410202645.93C433DF6@xmxpita.excite.com>
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
To: Farshad <farshadas@excite.com>
Cc: netfilter@lists.netfilter.org

Thursday, April 10, 2003, 11:26:45 PM, you wrote:

F> Just a naive question:
F> using netfilter, is it possible to grab a packet and change
F> its IP source address and then reinject it as if it has been
F> sent from another source?

Yes it is possible.
You can use ip_queue - queue the packets to userspace, change whatever
you want, recalculate checksum yourself and reinject it back.

Tho, my tests indicate that if the link is too loaded and your code is
not fast enough (sometimes even with nop) the netlink socket overflows
causing packet drops.

I tried tuning the netlink socket increasing the buffer size, but
after some time it overflowed anyway.


P.Krumins


