From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: IP spoofing
Date: Fri, 11 Apr 2003 00:12:52 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <21621186098.20030411001252@lf.lv>
References: <20030410202645.93C433DF6@xmxpita.excite.com>
 <144621018116.20030411001004@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <144621018116.20030411001004@lf.lv>
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
To: netfilter@lists.netfilter.org

Friday, April 11, 2003, 12:10:04 AM, you wrote:

PK> Thursday, April 10, 2003, 11:26:45 PM, you wrote:

F>> Just a naive question:
F>> using netfilter, is it possible to grab a packet and change
F>> its IP source address and then reinject it as if it has been
F>> sent from another source?

PK> Yes it is possible.
PK> You can use ip_queue - queue the packets to userspace, change whatever
PK> you want, recalculate checksum yourself and reinject it back.

PK> Tho, my tests indicate that if the link is too loaded and your code is
PK> not fast enough (sometimes even with nop) the netlink socket overflows
PK> causing packet drops.

PK> I tried tuning the netlink socket increasing the buffer size, but
PK> after some time it overflowed anyway.

oops, i read your question wrong. I though you wanted to change the
contents of the packet while it is traversing.


P.Krumins


