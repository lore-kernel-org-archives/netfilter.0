From: Michael Hecker <jlpnetworx@gmail.com>
Subject: masquerading won't flush conntrack cache
Date: Thu, 14 Oct 2004 15:17:50 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <661ba8be04101406175160a81f@mail.gmail.com>
Reply-To: Michael Hecker <jlpnetworx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everyone,

I'm having a strange problems with masquerading.
I'm masquerading my traffic, which leaves my machine through ppp0 on a
dialup line.
When UDP packets leave my machine on the ppp0 interface, an
appropriate entry is created in the conntrack cache
(/proc/net/ip_conntrack). As the remote machine replies to these UDP
packets, the conntrack module sees them as a stream and therefore
increases the timeout to 180 seconds.
However, when my line gets disconnected and reconnects again, the
entries in the cache are not flushed as expected. Now, the
masquerading of outbound traffic is done improperly. The outgoing
packets use the OLD IP-address, which was valid before the
disconnection of the dialup line and not the new one. When I look into
/proc/net/ip_conntrack I can still see the old and now invalid entries
being refreshed every time the internal machine tries to reach the
external one with these UDP packets. As it is clear, that no response
is possible, the internal machine tries endless and the entry in the
conntrack cache never times out --> an endless loop.
Any idea, why the entries are not flushed when ppp0 goes down and up again?

Thanks.
Michael.

