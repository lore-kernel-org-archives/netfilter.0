From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: traceroute
Date: Wed, 30 Jun 2004 13:25:31 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <132001c45ebe$dca7fb10$49caa8c0@caris.priv>
References: <2E314DE03538984BA5634F12115B3A4E62E80E@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>, netfilter <netfilter@lists.netfilter.org>

It is fixed now .. I needed the established / related to be icmp and on both
subchains (in and out) of the forwared chain pertaining to the ip address of
the machine that I was running the traceroute from.

Thank you all for the help.

The strange thing is that I also had to allow icmp type 11 on the output
chain (comming into my dmz) ... I do not understand why I need this here ..
but it does not work without it ...

Peter

----- Original Message ----- 
From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 1:10 PM
Subject: RE: traceroute


Yes, that is why I recommended to him to set the INPUT to
ESTABLISHED,RELATED, which may help to solve his problem, as well as
setting the policy (FORWARD) to ACCEPT until he can find out what
exactly is causing his problem(s).



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, June 30, 2004 11:33 AM
To: netfilter
Subject: Re: traceroute

On Wednesday 30 June 2004 4:10 pm, Piszcz, Justin Michael wrote:

> ICMP is "allowed" when you -I INPUT ESTABLISHED,RELATED.
>
> You do not have to allow it explicitly (ie: allow icmp so other
machines
> can ping your machine).

Please look at the rules which are being used:

$IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

They are explicitly accepting TCP and UDP only.   ICMP will not be
matched by
the above rules.

Regards,

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
> Sent: Wednesday, June 30, 2004 10:58 AM
> To: netfilter
> Subject: Re: traceroute
>
> On Wednesday 30 June 2004 3:34 pm, Piszcz, Justin Michael wrote:
> > -----Original Message-----
> > From: Peter Marshall [mailto:peter.marshall@caris.com]
> > Sent: Wednesday, June 30, 2004 10:25 AM
> > To: Piszcz, Justin Michael; netfilter
> > Subject: Re: traceroute
> >
> > I don't get anything (except the name lookup) from traceroute.
> >
> > Below are the relavant rules .... tracert is the ip of the box I am
> > trying to traceroute form.
> > The Ip of that box is an internet routable ip addess.
> >
> > $IPT -A FORWARD -p TCP -m state --state ESTABLISHED,RELATED -j
ACCEPT
> > $IPT -A FORWARD -p UDP -m state --state ESTABLISHED,RELATED -j
ACCEPT
> >
> > $IPT -A FORWARD -s <tracert box> -o eth1 -j rh-net
> > $IPT -A FORWARD -d <tracert box -i eth1 -j net-rh
> >
> > $IPT -A rh-net -s <tracert box> -j ACCEPT
> > $IPT -A net-rh -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> You should allow ICMP packets through your system.
>
> You should certainly allow ICMP through if you want traceroute to
work,
> and
> you should generally allow ICMP if you want many other things to work.
> If
> you want to block certain types of ICMP, that's fine (many people do),
> but
> don't block all ICMP.
>
> Traceroute works by sending either ICMP "ping" (echo request) packets,
> or UDP
> packets to high port numbers (which are assumed not to be listening),
> depending on the Operating System of the client doing the traceroute.
> In
> both cases the important response is an ICMP TTL exceeded packet,
which
> contains the IP address of the router where TTL became == 0.
>
> Remember that firewalling can be a dangerous topic - if you block
things
> you
> don't understand, and therefore don't know that you should allow, some
> things
> will break.
>
> Regards,
>
> Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the
list;
                                                           please don't
CC me.





