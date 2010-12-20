From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PREROUTING DNAT *inconsistent* behavior
Date: Mon, 20 Dec 2010 22:05:06 +0100
Message-ID: <4D0FC502.8000806@plouf.fr.eu.org>
References: <032601cb9c12$7d1a4890$774ed9b0$@com> <4D0BE21C.7030905@plouf.fr.eu.org> <06c201cb9e46$b4d13560$1e73a020$@com> <4D0BFD0D.2070406@plouf.fr.eu.org> <06f901cb9e56$9cb7fa30$d627ee90$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <06f901cb9e56$9cb7fa30$d627ee90$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alec Matusis <matusis@matusis.com>
Cc: netfilter@vger.kernel.org

Alec Matusis a =E9crit :
>> Do you mean that REDIRECT did not alter the destination address when=
 it
>> was different from the primary address on eth0 ?
>=20
> I cannot confirm or deny this, since currently all our production ser=
vers
> run with:
> -A PREROUTING -d server.ip -p tcp --dport 443 -j DNAT --to-destinatio=
n
> server.ip:5228
> The REDIRECT rule is something we tried in the past, to see if these =
strange
> packets from port 5228 would go away.

Ok. Note that you can skip the server address and use a single rule for
all the server addresses :

-A PREROUTING -p tcp --dport 443 -j DNAT --to-destination :5228

> It turns out, that every strange packet that we see in tcpdump, that =
goes
> out from port 5228, e.g.
> 17:34:05.147063 IP server.ip.5228 > client.ip.35263: F 65950323:65950=
323(0)
> ack 4249584466 win 5840
> is in the INVALID state as you suggested, since that client IP is fou=
nd in
> the INVALID state output log, and has the same timestamp
[...]
> What is strange however, is that even though I am also logging all in=
coming
> packets in the INVALID state, there are no such packets with this cli=
ent.ip.
> This suggests that the server responds to a *normal* packet from this
> client.ip with a packet in the INVALID state?

Maybe these packets belong to closed or lost TCP connections. You can
see that most of them have the FIN flag set. So the reason could be tha=
t
conntrack has forgotten about these connections.
