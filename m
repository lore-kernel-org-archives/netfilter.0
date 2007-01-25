From: Sebastian <netfilter@basti79.de>
Subject: Re: owner-Match in 2.6.20-rc5
Date: Thu, 25 Jan 2007 20:16:17 +0100
Message-ID: <1169752577.6235.6.camel@calypso>
References: <1169717001.9575.7.camel@basti79.freenet-ag.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-UzeIImtjt/uAk/xeVi/I"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169717001.9575.7.camel@basti79.freenet-ag.de>
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
To: netfilter@lists.netfilter.org


--=-UzeIImtjt/uAk/xeVi/I
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 25.01.2007, 10:23 +0100 schrieb Sebastian Cla=DFen:
> Hi...
>=20
> Kernel:   2.6.20-rc5
> Iptables: v1.3.7-20070118
>=20
> The owner-Match seems not to match TCP-Packets any more. Can be tested
> by inserting the rule:
> iptables -I OUTPUT -m owner --uid-owner test-user -j LOG
>=20
> Simply su to the specified user and using netcat (nc) to send UDP and
> TCP packets shows only log entried with PROTO=3DUDP but none with TCP.
>=20
> Anyone can reproduce this and pearhaps got a solution??
>=20
> Greets
>   Sebastian.
>=20

Hi again...

I've just found out where the problem is. In 2.6.20-rc1 changelog the
following thing was modified:
[TCP]: Don't set SKB owner in tcp_transmit_skb().

That seems to break the owner-match for TCP packets. I was able to undo
the change with the attached one-line patch which fixed the problem for
me.

Greets
  Sebastian.


--=-UzeIImtjt/uAk/xeVi/I
Content-Disposition: attachment; filename=owner-fix.diff
Content-Type: text/x-patch; name=owner-fix.diff; charset=us-ascii
Content-Transfer-Encoding: 7bit

--- linux-2.6.20-rc5.orig/net/ipv4/tcp_output.c	2007-01-25 20:10:04.000000000 +0100
+++ linux-2.6.20-rc5/net/ipv4/tcp_output.c	2007-01-25 14:43:48.000000000 +0100
@@ -467,6 +467,7 @@ static int tcp_transmit_skb(struct sock 
 
 	th = (struct tcphdr *) skb_push(skb, tcp_header_size);
 	skb->h.th = th;
+	skb_set_owner_w(skb, sk);
 
 	/* Build TCP header and checksum it. */
 	th->source		= inet->sport;

--=-UzeIImtjt/uAk/xeVi/I--


