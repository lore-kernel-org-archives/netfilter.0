From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Re: Question; what is this netfilter logfile entry ?
Date: Sun, 14 Nov 2004 22:41:32 +0100
Message-ID: <001001c4ca92$b98566a0$de0aa8c0@comp>
References: <1100392955.4894.25.camel@localhost.localdomain>
	<000c01c4c9f0$4807a0d0$de0aa8c0@comp>
	<1100429463.5934.420.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

> >
> > Nov 14 02:24:48 WF1-HOME kernel: DENY-OUT:.IN=3D OUT=3Deth0 =
SRC=3D192.168.1.2 DST=3D198.41.0.4 LEN=3D560 TOS=3D0x00 PREC=3D0xC0 =
TTL=3D64 ID=3D3123 PROTO=3DICMP TYPE=3D3 CODE=3D3 [SRC=3D198.41.0.4 =
DST=3D192.168.1.2 LEN=3D532 TOS=3D0x00 PREC=3D0x00 TTL=3D49 ID=3D41159 =
PROTO=3DUDP SPT=3D53 DPT=3D51981 LEN=3D512 ]
> >=20
> > It looks like ICMP with an embedded DNS call  ?.
>=20
> It's an ICMP port unreachable. Looks like 198.41.0.4 tried to send a
> reply to one of your DNS queries, took too long to respond, and by the
> time they did the port was closed. What's kind of interesting is that =
it
> was a full size answer so I'm guessing the truncation bit was set. =
This
> means that if this packet had been returned in time your system would
> have had to switch to TCP to get a full answer.
>=20
> The UDP info is embedded in the payload so the remote system knows =
which
> port was unreachable. This is in case multiple session were running at
> the same time. Perfectly normal for an ICMP error packet.
>=20
> > What is it exactly, and how would a rule to allow this look like ?
>=20
> This would be permitted if you are letting "RELATED" traffic through.
> This ensures that only legit ICMP errors are passed. While you could
> define an accept rule for the ICMP type code, this would let all
> matching traffic through opening up the possibilities of a covert
> communication channel.=20
>=20
It has something to do with PSD. When it's "enabled" the problem arises=20
trigered by  prior PSD denials to DNS traffic comming from unknown =
external
ip's. With no iptables PSD statements it never happens.

On our inside we have djbdns acting as an internal forwarding DNS =
server.=20
When PSD closes trafffic of like this, this type of "traffic" is taking =
up all=20
internet bandwith, and filling up the syslog message log. If djbdns is
killed / restarted the traffic stops, and everything works again. If =
just left=20
alone, after a minute or two, everything goes back to normal.
Maybe djbdns starts spewing out DNS requests, and is denied the reply
because a trigered PSD will not allow any DNS response back in.

Strangely enough, we have only seen this problem when=20
accessing the www.space.com

We currently run iptables 1.2.8 on a 2.4.21 kernel. We have not yet =
tested it with=20
a 2.6 kernel.


Bo



