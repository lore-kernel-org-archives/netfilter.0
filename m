From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Loopback security...
Date: Tue, 22 Apr 2008 09:08:22 -0500
Message-ID: <480DF156.5060801@riverviewtech.net>
References: <480D47F6.9080808@riverviewtech.net> <480DC570.80303@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480DC570.80303@solutti.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/22/08 06:01, Leonardo Rodrigues Magalh=E3es wrote:
> Are you sure you understand it right ??? What do you mean by 'linux=20
> consider it secure' ?? do you mean it has no access control by=20
> default ???? This happens with ALL linux network (logical and=20
> phisical) ones. If you need access control on network level, then you=
=20
> got iptables !!!

No, you mis-understood me.  What I meant by "Linux considers it secure"=
=20
is that (by default) it will not let any traffic in to our out of the=20
loopback interface from / to a different interface.  I.e. (presuming=20
that a bind an additional subnet (192.0.2/24 ""Test network) to the=20
loopback interface and set up another station to route to it via the=20
static ip on the ethernet interface.

+---+                  +---+
| A +-- - - -  - - - --+ B |
+---+ .1 (10.0.0) .254 +---+

Suppose I bind 192.0.2.1 to A's loop back interface and add a route to=20
192.0.2/24 to B via 10.0.0.1.  If I try to ping 192.0.2.1 from B, the=20
traffic will leave B and go down the wire just like it should.  However=
=20
my experience shows that A will not forward the traffic in to the=20
loopback interface and destination IP.  Note:  This config is with all=20
firewalling completely disabled and forwarding enabled.

Said another way, Linux will not allow foreign traffic (non localhost)=20
on the loopback interface for security reasons.  I believe this to be a=
=20
design decision based on security.

> What was the problem solved/workarounded ???? Tell us what happened=20
> and maybe we'll tell you if using rinetd was a smart solution and, if=
=20
> it's not, maybe give you other better workaround tips.

This is not an actual problem but rather a (theoretical) discussion on=20
whether such is or is not possible to do with Linux.

> No seek and hide games .... tell us what's really your problem=20
> please.

Again, this is not a game or a problem to solve, merely a question /=20
discussion of "Is it possible..." to send traffic in to and / or out of=
=20
the loopback interface.  If it is not possible (by default) is it=20
possible to disable this built in / inherent security?

> Do you mean loopback interface to throw/receive traffic on your=20
> phisical network, ie, ethernet cables ??? If this is your idea, it=20
> goes against the whole loopback idea and i think it certainly cant be=
=20
> done.

Yes, this is what I was asking.  I know and understand fully well why=20
this generally is not done.  However I wanted to know if it is possible=
=20
to throb some setting on the system to allow this to do be done against=
=20
better advice.



Grant. . . .
