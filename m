From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Problem with DNAT
Date: Sun, 10 Nov 2002 22:38:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211101421.20026.netfilter@newkirk.us>
References: <200211091837.00935.ss310636@inf.tu-dresden.de> <200211091518.22273.netfilter@newkirk.us> <200211092136.46643.ss310636@inf.tu-dresden.de>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211092136.46643.ss310636@inf.tu-dresden.de>
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
To: Steffen Schoenwiese <ss310636@inf.tu-dresden.de>, netfilter@lists.netfilter.org

On Saturday 09 November 2002 03:36 pm, Steffen Schoenwiese wrote:
> > > I have some problems with iptables 1.2.7a. Some of my rules which
> > > worked well with iptables 1.2.5 produce an error message "iptables:
> > > Invalid argument". The specific rules look like this:
> > >
> > > iptables -t nat -A OUTPUT -p tcp -d <ip> -j DNAT --to <ip>:<port>
> > >
> > > I also tried to use --to-destination instead of --to, same error
> > > message. All my other rules work perfect, only the DNAT ones get th=
is
> > > error. Does anyone have a possible solution?
> >
> > All nat table rules, or are SNAT and MASQ accepted?  Do you have a in=
smod
> > or modprobe iptable_nat?  I don't know your prior/current setup, but =
it
> > might have been compiled in before, a module now.
>
> SNAT doesn't work either, MASQ works. iptable_nat is loaded. The system=
 I'm
> running is a new SuSE 8.1 if that helps.

The same rule is accepted if it's prerouting? What about without the port=
 redirection?

SUSE8.1 is kernel 2.4.19, right?  This shouldn't apply then but...
=46rom the "Known Bugs" file in the 1.2.7a distribution:

1) NAT in the OUTPUT chain only works since kernel 2.4.18.  However,
   there is a patch for previous kernels in patch-o-matic, called the
   'local-nat.patch'.  This patch adds a CONFIG_NF_IP_NAT_LOCAL kernel co=
nfig
   option.

I'm still running 1.2.5, so I can't even try this locally right now.  Sor=
ry.

j


