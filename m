From: =?ISO-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Subject: Re: lost UDP packets with matching NAT rules
Date: Wed, 15 Feb 2006 18:16:15 +0100 (CET)
Message-ID: <freemail.20060115181615.95655@fm03.freemail.hu>
References: <200602151615.42633@nienna>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602151615.42633@nienna>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: KOVACS Krisztian <hidden@sch.bme.hu>
Cc: netfilter@lists.netfilter.org

Hello,

>=20
>   Hi,
>=20
> On Wednesday 15 February 2006 14.18, Keser=FB Korn=E9l wrote:
> > I also have to modify the source of the packets not only the=20
destination
> > (I want to realize NAT). Maybe my sentence (about redirection) was
> > misleading.
>=20
>   _That_ is the problem. This way you produce clashing connection=20
tracking=20
> entries, of which obviously only the first one is confirmed, the rest of=
=20
> the packets is dropped. Think again: you send 100 packets, each of=20
them=20
> from a different source. Each and every packet has a new connection=20
> tracking entry assigned to them when they arrive at the NAT box.=20
Then on=20
> PREROUTING you redirect these to the same destination. After this=20
has been=20
> done it's only the _source_ which differentiates between them, the=20
> destination is the same. Then, on POSTROUTING you change the=20
source address=20
> of the packet (and the appropriate field in the conntrack entry) to the=
=20
> same, predefined value. Oops, you've just destroyed your last piece=20
of=20
> information based on which you could differentiate the reply packets=20
> arriving from the node you've forwarded these packets to.
>=20
>   For the first packet, the conntrack entry gets confirmed, and the=20
packet=20
> is forwarded. However, for the rest conntrack is unable to insert their=
=20
> entries in the hash table (since there's already an entry there with=20
the=20
> same reply tuple). Thus the best it can do is dropping those packets.

Thanks for the explanation!
Does this mean that a nat function, realized with a DNAT+SNAT rule=20
pair will not work for many-to-one connections? What I wanted to=20
realize with those rules is that UDP packets received from anywhere=20
(several sources) are forwarded to one concrete destination and the=20
source of the forwarded packets is always changed to the same.
If so, would a NOTRACK rule in the raw table help here (don't track=20
those connections)?

> > Thanks for the hint! I checked it. Strange, that not=20
the "insert_failed"
> > but the number in the "dropped" column is incremented with 99. 1
>=20
>   It's hard to believe. Are you sure that you did not make a mistake=20
pairing=20

You are right, it was my mistake. It was really the insert_failed column.

> that number to the appropriate column at the top? Can you maybe=20
paste it=20
> here?
>=20
>   First of all, I assume you meant 'drop', as theer's no 'dropped'=20
column in=20
> that file. However, 'drop' is incremented if a packet is dropped=20
because=20
> connection tracking failed to allocated the memory for the new=20
connection=20
> tracking structure. It's very unlikely you can trigger this with 100 UDP=
=20
> packets.
>=20

Bye,
Kornel Keseru=0A=0A________________________________________________________=
___________________=0AP=E9nz=FCgyi szolg=E1ltat=E1s =E9s hitelig=E9nyl=E9s =
interneten kereszt=FCl a nap 24 =F3r=E1j=E1ban az [origo]-n.=0Ahttp://www.k=
likkbank.hu=0A=0A

