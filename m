From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: ULOG with -m state
Date: Tue, 26 Nov 2002 08:53:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211260853.46333.netfilter@newkirk.us>
References: <20021122155352.GA5665@gnjilux.srk.fer.hr> <200211241945.38762.netfilter@newkirk.us> <20021126105429.GB9457@gnjilux.srk.fer.hr>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021126105429.GB9457@gnjilux.srk.fer.hr>
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
To: ivac@fly.srk.fer.hr, Iva Cabric Cabric <ivac@gnjilux.srk.fer.hr>
Cc: netfilter@lists.netfilter.org

On Tuesday 26 November 2002 05:54 am, Iva "Cabric" Cabric wrote:
> Since mailman is blocking me here is reply again...
>
> On Sun, Nov 24, 2002 at 07:45:38PM -0500, Joel Newkirk wrote:
> > > $ iptables -A ssh -j ULOG -p tcp -m state --state NEW
> > >
> > > reports:
> > >
> > > iptables v1.2.6a: You must specify `--state'
> > > Try `iptables -h' or 'iptables --help' for more information.
> > >
> > > but using DROP works fine:
> > >
> > > $ iptables -A ssh -j DROP -p tcp -m state --state NEW
> >
> > Does the ULOG target work in other uses, IE "iptables -A FORWARD -j U=
LOG"
> > ?
>
> Nope, it gives same error:
>
> $ iptables -A FORWARD -j ULOG -p tcp -m state --state NEW
> iptables v1.2.6a: You must specify `--state'
>
> with INPUT and OUTPUT, also same thing. I'm not doing anything special
> (like NAT, conntrack, ftp, ...), just plain INPUT filtering.

Well, did you try the example I asked about?  I suspect not, because the=20
problem here seems to be that "-j ULOG" should be AFTER the state matchin=
g=20
part of the rule...  If I enter the line you used, I get the same '--stat=
e'=20
error, but if I put the target after the match (or remove the match, as p=
er=20
my debugging suggestion above) it does NOT.

j



