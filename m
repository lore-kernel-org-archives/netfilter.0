From: Jay Levitt <lists-netfilter@shopwatch.org>
Subject: Re: Wayward RST packets - what's the right answer?
Date: Mon, 29 Mar 2004 14:11:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <058701c415c1$b20fae20$9701a8c0@office>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0584_01C41597.C9290450"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0584_01C41597.C9290450
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Chris Brenton wrote:


> On Thu, 2004-03-25 at 23:29, Jay Levitt wrote:
> >
> > Fairly often - as in a few times an hour on a very, very underused
> > server - I get repeated RST packets from hosts I've recently been
> > talking to, but that conntrack thinks aren't part of a connection.  =
My
> > rule:
> >
> > iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
> > --state NEW -j LOG --log-prefix "Stealth scan attempt"
> > iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m state
> > --state NEW -j DROP
>
> Maybe I'm reading this wrong, but I would expect you would only get a
> match with this rule if SYN was set. I'm surprised your grabbing RST
> packets. Perhaps another rule that uses the same prefix?

Nope, it's the other way around - this rule matches any packet that is =
in a
NEW state but has flags other than SYN-and-only-SYN.

> Also, not so sure you can consider RST's a "stealth scan" as a =
receiving
> host is just going to ignore bogus RST's and not reply, regardless of
> whether the port is open or not. Best an attacker could hope to =
receive
> is a host unreachable.

OK, so it'd be perfectly safe to add this?

iptables -A INPUT -p -tcp --tcp-flags FIN,SYN,RST,ACK RST -m state =
--state
NEW -j ACCEPT

One problem is that although I can read about the TCP protocol and valid
states, I don't know what failure/DOS/etc modes I'm protecting against, =
and
therefore I'm not sure what invalid-yet-possible states I should be =
letting
through.

> > Mar 25 23:19:05 linux kernel: Stealth scan attemptIN=3Deth0 OUT=3D
> > MAC=3D00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00 SRC=3D208.185.179.12
> > DST=3D192.168.1.150 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D47 =
ID=3D6376 PROTO=3DTCP
> > SPT=3D2046 DPT=3D25 WINDOW=3D0 RES=3D0x00 RST URGP=3D0
>
> What's the time stamp on the accepted packet? If you are
> logging/dropping RST packets prior to processing ESTABLISHED that =
would
> explain this entry. I very rarely see legit RST packets get dropped so
> if you are seeing them fairly often I would guess a config problem as
> RSTs are a last resort.

Not sure what you're asking about the timestamp... the rule does =
log/drop
RST packets in a NEW state (or, more likely, after a connection has been
"closed" in conntrack).  I see them a few times an hour; any idea what =
sort
of config problem I'd be looking for?

> The other time I've seen it is when there is an IDS on the wire =
kicking
> out RST packets when a suspect packet is seen, but the IDS does not =
get
> the sequence numbers right in the RST.

What's an IDS?

Jay Levitt

------=_NextPart_000_0584_01C41597.C9290450
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Chris Brenton wrote:<BR><BR><BR>&gt; On Thu, 2004-03-25 at 23:29, =
Jay=20
Levitt wrote:<BR>&gt; &gt;<BR>&gt; &gt; Fairly often - as in a few times =
an hour=20
on a very, very underused<BR>&gt; &gt; server - I get repeated RST =
packets from=20
hosts I've recently been<BR>&gt; &gt; talking to, but that conntrack =
thinks=20
aren't part of a connection.&nbsp; My<BR>&gt; &gt; rule:<BR>&gt; =
&gt;<BR>&gt;=20
&gt; iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m =
state<BR>&gt;=20
&gt; --state NEW -j LOG --log-prefix "Stealth scan attempt"<BR>&gt; &gt; =

iptables -A INPUT -p tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m =
state<BR>&gt; &gt;=20
--state NEW -j DROP<BR>&gt;<BR>&gt; Maybe I'm reading this wrong, but I =
would=20
expect you would only get a<BR>&gt; match with this rule if SYN was set. =
I'm=20
surprised your grabbing RST<BR>&gt; packets. Perhaps another rule that =
uses the=20
same prefix?<BR><BR>Nope, it's the other way around - this rule matches =
any=20
packet that is in a<BR>NEW state but has flags other than=20
SYN-and-only-SYN.<BR><BR>&gt; Also, not so sure you can consider RST's a =

"stealth scan" as a receiving<BR>&gt; host is just going to ignore bogus =
RST's=20
and not reply, regardless of<BR>&gt; whether the port is open or not. =
Best an=20
attacker could hope to receive<BR>&gt; is a host unreachable.<BR><BR>OK, =
so it'd=20
be perfectly safe to add this?<BR><BR>iptables -A INPUT -p -tcp =
--tcp-flags=20
FIN,SYN,RST,ACK RST -m state --state<BR>NEW -j ACCEPT<BR><BR>One problem =
is that=20
although I can read about the TCP protocol and valid<BR>states, I don't =
know=20
what failure/DOS/etc modes I'm protecting against, and<BR>therefore I'm =
not sure=20
what invalid-yet-possible states I should be =
letting<BR>through.<BR><BR>&gt;=20
&gt; Mar 25 23:19:05 linux kernel: Stealth scan attemptIN=3Deth0 =
OUT=3D<BR>&gt; &gt;=20
MAC=3D00:50:2c:01:62:8e:00:20:78:d0:44:8f:08:00 =
SRC=3D208.185.179.12<BR>&gt; &gt;=20
DST=3D192.168.1.150 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D47 ID=3D6376 =
PROTO=3DTCP<BR>&gt;=20
&gt; SPT=3D2046 DPT=3D25 WINDOW=3D0 RES=3D0x00 RST =
URGP=3D0<BR>&gt;<BR>&gt; What's the=20
time stamp on the accepted packet? If you are<BR>&gt; logging/dropping =
RST=20
packets prior to processing ESTABLISHED that would<BR>&gt; explain this =
entry. I=20
very rarely see legit RST packets get dropped so<BR>&gt; if you are =
seeing them=20
fairly often I would guess a config problem as<BR>&gt; RSTs are a last=20
resort.<BR><BR>Not sure what you're asking about the timestamp... the =
rule does=20
log/drop<BR>RST packets in a NEW state (or, more likely, after a =
connection has=20
been<BR>"closed" in conntrack).&nbsp; I see them a few times an hour; =
any idea=20
what sort<BR>of config problem I'd be looking for?<BR><BR>&gt; The other =
time=20
I've seen it is when there is an IDS on the wire kicking<BR>&gt; out RST =
packets=20
when a suspect packet is seen, but the IDS does not get<BR>&gt; the =
sequence=20
numbers right in the RST.<BR><BR>What's an IDS?<BR><BR>Jay=20
Levitt<BR></DIV></BODY></HTML>

------=_NextPart_000_0584_01C41597.C9290450--


