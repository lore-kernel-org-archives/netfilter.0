From: longraider <longraider@gazeta.pl>
Subject: Where the de-SNAT actually takes place?
Date: Sat, 19 Aug 2006 19:38:40 +0200
Message-ID: <44E74CA0.9080808@gazeta.pl>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi
I've sent this post on the c.o.l.networking also, and after that I've
found this mailing list, so please forgive this crossposting, as I don't
expect answer from c.o.l.n to this question.

I've been reading a bit about packet traversal in the linux kernel but
apparently my linux box doesn't like theory very much ;-)
My config:
linux-2.6.14.2 with imq patch
eth0 - iface where two inet connections are attached
eth1 - server
eth2 - LAN
There is SNAT involved on one net connection. The other conn is for
servers, and there is proxy-arp active (at eth0 and eth1).

I type:
iptables -t nat -A PREROUTING -i eth0 -j LOG
And after that, dmesg shows something like that:
17:08:53 IN=eth0 OUT= SRC=some_remote_IP DST=IP_of_the_linux_box

Shouldn't be there DST=10.0.0.5 for example (ie. de-SNATed)?

I've found that on google:
http://lists.netfilter.org/pipermail/netfilter/2003-July/045355.html
And that is weird. I think that in my kernelversion this is implemented
in different way, but actually I don't know what is going on.

And all that I want to do is ingress queuing using IMQ. I want to fwmark
packets according to their de-SNATed destination adress (and some other
things also), and then put them into the IMQ ingress queue.
I could use the packet matching available in the ingress queue itself
(by ip tool), but I don't know if the packets that go into IMQ are
de-SNATed or not.

So, where the de-SNAT actually takes place?

BTW is this diagram correct?
http://www.docum.org/docum.org/kptd/
I think not, since traversing the magle PREROUTING can't occur
simulatenously with de-MASQ. And is this de-MASQUERADE a de-SNAT also?

-- 
mati



