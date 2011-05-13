From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: NFQUEUE the plot is growing...
Date: Fri, 13 May 2011 22:25:34 +0400
Message-ID: <1305311134.11480.10.camel@hakkenden>
References: <1304489658.32272.19.camel@compot-mob>
	 <4DC19739.2040008@tana.it> <1304533951.25221.8.camel@hakkenden>
	 <4DC26A0A.8050402@tana.it> <1304587479.6402.3.camel@compot-mob>
	 <4DCAC715.3090206@tana.it> <1305193207.9902.8.camel@compot-mob>
	 <4DCC20ED.4080203@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4DCC20ED.4080203@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=A7=D1=82=D0=B2, 12/05/2011 =D0=B2 20:03 +0200, Alessandro Ve=
sely =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 12/May/11 11:40, nowhere wrote:
> >> It seems enough to avoid delaying the call to nfq_set_verdict for =
the
> >> first packet of a burst.  For a shot in the dark, packets seem to =
get
> >> lost if they arrive between the first one and the corresponding ca=
ll
> >> to nfq_set_verdict.  Indeed, setting a fixed real_delay of 0.2, wi=
th
> >> ping -i 0.2 it looses no packets, with ping -i 0.19 it looses just=
 the
> >> second one, with ping -i 0.09 icmp_reqs #2 and #3.
> >>=20
> >> No error is returned, whether NETLINK_NO_ENOBUFS is set or not.
> >=20
> > Well, seems like this is the case. If nfqueue becomes empty, first
> > enqueued packet must not be delayed.
>=20
> I retract, possibly I've been too hasty blaming nfnetlink queue.  I
> made a simple variation of nfqnl_test.c --which I attach.  It just
> accepts the previous packet id.  The "last" packet is obviously alway=
s
> lost.  Because of this bug(?), I also loose the second packet of a
> sequence of pings, no matter the speed.
>=20
> However, if I "ping -c 1" using two terminal windows, I correctly
> receive all odd ids in one window and even ones in the other (except
> last pkt).  In this case, I delay every packet.  Also, if I run a
> sequence from a window, and, immediately after it starts, run a singl=
e
> ping using the other window, then both the single ping and the
> sequence (except last pkt) go correctly through.
>=20
> I don't understand how come the kernel+filter system can distinguish
> between a second packet coming as part of a sequence and a second
> packet coming asynchronously, given that packets are not inspected.
> Nice puzzle, isn't it?
>=20
>=20
> NB, I used iptables -t mangle -A POSTROUTING -p icmp -d 172.25.197.15=
8
> -j NFQUEUE --queue-num 13, as in
> http://www.spinics.net/lists/netfilter/msg50829.html


Hi there,

There is a case that look similar to ours:
http://marc.info/?l=3Dnetfilter-devel&m=3D129016166319433&w=3D2

So I tried putting iptables rule in raw table (afaik it is passed befor=
e
conntrack, so delayed packets are not being tracked before entering
queue) - and the problem is solved, there are no drops anymore.

