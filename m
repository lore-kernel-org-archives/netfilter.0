From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: TCP delay, solved
Date: Fri, 14 Jun 2002 16:29:45 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJOEHCDOAA.jpatterson@asgardgroup.com>
References: <200206140919.KAA11259@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206140919.KAA11259@slate.rockstone.co.uk>
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

How about this as a possible solution:

in your OUTPUT chain and in FORWARD -o $EXTERNAL_INT, have a rule something
like (with the recent patch compiled in):

$IPT -A OUTPUT -m state --state NEW -m recent --name validconn --set
$IPT -A FORWARD -m state --state NEW -o $EXTERNAL_INT -m recent --name
validconn --set

and then:

$IPT -A INPUT -m recent --name validconn -rcheck --seconds 20 -p tcp --dport
113 -j REJECT --reject-with tcp-reset

and let everything else fall through to a default DROP rule.  This way you
will only send tcp resets for ident lookups if you have made a connection to
the source of the ident lookup in the last 20 seconds.  Otherwise (for
general nmappers out there), everything gets dropped.  Add this to some -m
psd magic and some other judicious use of the recent patch, and you should
be able to have a firewall that denies all evidence that you exist.

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
> Sent: Friday, June 14, 2002 5:19 AM
> To: netfilter@lists.samba.org
> Subject: Re: TCP delay, solved
>
>
> On Friday 14 June 2002 9:25 am, David Luyer wrote:
>
> > > Easy solution:
> > >
> > >   deny (connection reset) rather than drop the connections
> >
> > I meant reject.  From the man page:
> >
> > Why connection reset?  For idiots at the other end who firewall all
> > ICMP.
>
> Same problem.   Leaves me with a port on my Firewall which
> responds to nmap
> etc.   All other ports on my Firewall return nothing, so the machine is
> invisible - I don't want port 113 standing out by doing something
> different.
>
>
>
> Antony.
>
>
>


