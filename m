From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: lost UDP packets with matching NAT rules
Date: Wed, 15 Feb 2006 16:15:42 +0100
Message-ID: <200602151615.42633@nienna>
References: <freemail.20060115141829.61431@fm15.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <freemail.20060115141829.61431@fm15.freemail.hu>
Content-disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: =?iso-8859-2?q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>


  Hi,

On Wednesday 15 February 2006 14.18, Keser=FB Korn=E9l wrote:
> I also have to modify the source of the packets not only the destin=
ation
> (I want to realize NAT). Maybe my sentence (about redirection) was
> misleading.

  _That_ is the problem. This way you produce clashing connection tra=
cking=20
entries, of which obviously only the first one is confirmed, the rest=
 of=20
the packets is dropped. Think again: you send 100 packets, each of th=
em=20
=66rom a different source. Each and every packet has a new connection=
=20
tracking entry assigned to them when they arrive at the NAT box. Then=
 on=20
PREROUTING you redirect these to the same destination. After this has=
 been=20
done it's only the _source_ which differentiates between them, the=
=20
destination is the same. Then, on POSTROUTING you change the source a=
ddress=20
of the packet (and the appropriate field in the conntrack entry) to t=
he=20
same, predefined value. Oops, you've just destroyed your last piece o=
f=20
information based on which you could differentiate the reply packets=
=20
arriving from the node you've forwarded these packets to.

  For the first packet, the conntrack entry gets confirmed, and the p=
acket=20
is forwarded. However, for the rest conntrack is unable to insert the=
ir=20
entries in the hash table (since there's already an entry there with =
the=20
same reply tuple). Thus the best it can do is dropping those packets.

> Thanks for the hint! I checked it. Strange, that not the "insert_fa=
iled"
> but the number in the "dropped" column is incremented with 99. 1

  It's hard to believe. Are you sure that you did not make a mistake =
pairing=20
that number to the appropriate column at the top? Can you maybe paste=
 it=20
here?

  First of all, I assume you meant 'drop', as theer's no 'dropped' co=
lumn in=20
that file. However, 'drop' is incremented if a packet is dropped beca=
use=20
connection tracking failed to allocated the memory for the new connec=
tion=20
tracking structure. It's very unlikely you can trigger this with 100 =
UDP=20
packets.

--=20
KOVACS Krisztian


