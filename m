From: "David Vogt" <beunlovable@gmail.com>
Subject: Re: libnetfilter_queue conditions required to rewrite packets...
Date: Fri, 7 Apr 2006 15:55:41 +0200
Message-ID: <859616420604070655n35ced2eau5c6968f5d2e3f029@mail.gmail.com>
References: <44348A27.60602@gmail.com>
	<859616420604052330gc251080q95738ef1d112b465@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420604052330gc251080q95738ef1d112b465@mail.gmail.com>
Content-Disposition: inline
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
To: Mike Auty <mike.auty@gmail.com>
Cc: netfilter@lists.netfilter.org

For testing purposes I simply rewrote the nfq_test.c application in
libnetfilter_queue/utils, such that the reinjected packet should have
the ttl field modified.
1) receive original payload and length with nfq_get_payload
2) modify payload
3) call nfq_set_verdict(qh, id, NF_ACCEPT, len, modified_payload)


I tried to find a place where things go wrong, but as far as I can
see, everything looks fine all the way down to the actual sendmsg call
on the netlink socket (i.e. nfnl_sendiov() in libnfnetlink.c).
On the "receiver" side I checked nfqnl_recv_verdict(), which is part
of nfnetlink_queue module
(linux-2.6.16/net/netfilter/nfnetlink_queue.c). The check
if (nfqa[NFQA_PAYLOAD-1]) {
  // call nfqnl_mangle
}
fails. However, a raw dump of the skb that nfqnl_recv_verdict()
operates, reveals that the payload IS there, WITH the modifications
that have been applied.

I haven't gain enought insight into the *nfqa[] stuff, yet, so any
help would be appreciated. Maybe I'm looking for a solution in all the
wrong places. What do I do wrong?


David

