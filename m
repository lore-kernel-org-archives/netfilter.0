From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: TCP delay, solved
Date: Fri, 14 Jun 2002 21:21:50 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJMEHDDOAA.jpatterson@asgardgroup.com>
References: <NJEFLNJDIFFNMHDEBKMJOEHCDOAA.jpatterson@asgardgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NJEFLNJDIFFNMHDEBKMJOEHCDOAA.jpatterson@asgardgroup.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

OOPS.  Treat this message as further proof that crack don't smoke itself...
The rules here would *NOT* work.  However, I think there's a gleam of
possibility here...  Not quite as good as I had thought, but still a
reasonable thing to do:

$IPT -A INPUT -p tcp --tcp-flags ALL SYN,ACK -m state --state ESTABLISHED -m
recent --name validconn --set
$IPT -A FORWARD -p tcp --tcp-flags ALL SYN,ACK -m state --state
ESTABLISHED -i $EXTERNAL_INT -m recent --name validconn --set
$IPT -A INPUT -m recent --name validconn -rcheck --seconds 20 -p tcp --dport
113 -j REJECT --reject-with tcp-reset

This is based on assumptions which may or may not be correct.  First, the
timeline of a normal connection from an inside client to an outside server
that does ident lookups:

1:client sends SYN, firewall sees this as state NEW.
2:server inetd (or whatever) replies with SYN-ACK, firewall sees this as
state ESTABLISHED, and adds the server's IP to the validconn group.
3:client replies with an ACK, firewall sees this as ESTABLISHED
4:server's inetd fork's and exec's tcpd, which immediately gets the info on
the socket it's been handed, and creates an ident SYN, which it sends to the
client.
5:Firewall recieves the ident SYN, checks the validconn group, sees that the
server is in it, and replies with a RST.
6:tcpd gives up on ident, and exec's the server that should handle whatever
port is being connected to.
7:traffic flows as normal.

This will fail if tcpd (or a program with libwrap, or anything that does
ident lookups) tries to do an ident lookup before the tcp 3-way handshake is
over... but I don't think it does.  I think it waits until the connection is
established.

This will also fail for ident lookups of udp based stuff, but I'm fairly
sure that identd for udp based services is in violation of the relevant
rfc's (931, I believe)

Now, from the attacker's standpoint:

1: if the attacker sends something to 113, it will be dropped because their
source is not in the validconn group
2: if the attacker sends an unsolicited SYN-ACK, it will be in state NEW, so
will be dropped and not add the attacker to the validconn group.
3: if the attacker sends a SYN to an open port that is allowed by the FW,
and gets a SYN-ACK back, that hasn't triggered any of the above rules, so he
still won't be able to send ident lookups (although at this point he already
knows that you're there, so it doesn't *really* matter)
4: after making a connection to an open allowed port, he could send a
SYN-ACK, which would be an invalid tcp packet at that point but I don't
think it would be "-m state --state INVALID", at which point he would have
free license to send all the ident requests that he desires for the next 20
seconds.
5: the really sneaky one:  If he connects to a port on the firewall that's
doing its own ident lookups, then the ident lookup itself (from the
firewall, or whatever the firewall is passing traffic to) will trigger the
above rules, thus allowing the attacker to have free license to send ident
requests for the next 20 seconds.

So, it's not perfect.  There is some slippage.  But, I do think it's kind of
elegant, and I think it should work fairly well.  Especially on a firewall
that's only allowing outbound connections, it should be fairly solid and
usefull.  I'll have to try it on a real live firewall sometime soon....

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Joe Patterson
> Sent: Friday, June 14, 2002 4:30 PM
> To: Antony Stone; netfilter@lists.samba.org
> Subject: RE: TCP delay, solved
>
>
> How about this as a possible solution:
>
> in your OUTPUT chain and in FORWARD -o $EXTERNAL_INT, have a rule
> something
> like (with the recent patch compiled in):
>
> $IPT -A OUTPUT -m state --state NEW -m recent --name validconn --set
> $IPT -A FORWARD -m state --state NEW -o $EXTERNAL_INT -m recent --name
> validconn --set
>
> and then:
>
> $IPT -A INPUT -m recent --name validconn -rcheck --seconds 20 -p
> tcp --dport
> 113 -j REJECT --reject-with tcp-reset
>
> and let everything else fall through to a default DROP rule.  This way you
> will only send tcp resets for ident lookups if you have made a
> connection to
> the source of the ident lookup in the last 20 seconds.  Otherwise (for
> general nmappers out there), everything gets dropped.  Add this to some -m
> psd magic and some other judicious use of the recent patch, and you should
> be able to have a firewall that denies all evidence that you exist.
>
> -Joe
>
> > -----Original Message-----
> > From: netfilter-admin@lists.samba.org
> > [mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
> > Sent: Friday, June 14, 2002 5:19 AM
> > To: netfilter@lists.samba.org
> > Subject: Re: TCP delay, solved
> >
> >
> > On Friday 14 June 2002 9:25 am, David Luyer wrote:
> >
> > > > Easy solution:
> > > >
> > > >   deny (connection reset) rather than drop the connections
> > >
> > > I meant reject.  From the man page:
> > >
> > > Why connection reset?  For idiots at the other end who firewall all
> > > ICMP.
> >
> > Same problem.   Leaves me with a port on my Firewall which
> > responds to nmap
> > etc.   All other ports on my Firewall return nothing, so the machine is
> > invisible - I don't want port 113 standing out by doing something
> > different.
> >
> >
> >
> > Antony.
> >
> >
> >
>
>
>
>


