From: "Ron Gedye" <rgedye@teleformix.com>
Subject: Re: mangle table traversal
Date: Thu, 20 Jun 2002 16:23:36 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <026b01c218a0$bd0c0230$01e91fac@rgedyew2k>
References: <Pine.LNX.4.30.0206201412320.7072-100000@gilgamesh.eos.SilentMedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: netfilter@lists.samba.org

Syntax:
> bash-2.05a# iptables -t mangle -I OUTPUT -j LOG --log-prefix-OutMangle
should be --log-prefix=OutMangle
----- Original Message -----
From: "Ben" <bench@silentmedia.com>
To: "Antony Stone" <Antony@Soft-Solutions.co.uk>
Cc: <netfilter@lists.samba.org>
Sent: Thursday, June 20, 2002 4:14 PM
Subject: Re: mangle table traversal


> Interestingly, iptables 1.2.6a won't let me attach a LOG target to any of
> the output chains. I get this:
>
> bash-2.05a# iptables -t mangle -I OUTPUT -j LOG --log-prefix-OutMangle
> iptables v1.2.6a: Unknown arg `--log-prefix-OutMangle'
>
> Is that expected behavior, and if so, why?
>
> On Thu, 20 Jun 2002, Antony Stone wrote:
>
> > On Thursday 20 June 2002 9:16 pm, Shinju wrote:
> >
> > > Hey folks.
> > >
> > > Do packets always traverse the chain in the 'mangle' table before they
> > > traverse the corresponding chain in other tables?  In other words, is
this
> > > flow correct?...
> > >
> > > ...manglePREROUTING --> natPREROUTING...
> > > ...mangleINPUT --> filterINPUT...
> > > ...mangleOUTPUT --> natOUTPUT --> filterOUTPUT...
> > > ...mangleFORWARD --> filterFORWARD...
> > > ...manglePOSTROUTING --> natPOSTROUTING...
> >
> > You can eaily check this for yourself by putting a LOG target as the
first
> > rule into every chain.  eg:
> >
> > iptables -t mangle -I PREROUTING -j LOG --log-prefix=PreMangle
> > iptables -t mangle -I INPUT -j LOG --log-prefix=InMangle
> > iptables -t mangle -I FORWARD -j LOG --log-prefix=ForMangle
> > iptables -t mangle -I POSTROUTING -j LOG --log-prefix=PostMangle
> > iptables -t mangle -I OUTPUT -j LOG --log-prefix-OutMangle
> > iptables -t filter -I PREROUTING -j LOG --log-prefix=PreFilt
> > iptables -t filter -I INPUT -j LOG --log-prefix=InFilt
> > iptables -t filter -I FORWARD -j LOG --log-prefix=ForFilt
> > iptables -t filter -I POSTROUTING -j LOG --log-prefix=PostFilt
> > iptables -t filter -I OUTPUT -j LOG --log-prefix-OutFilt
> > iptables -t nat -I PREROUTING -j LOG --log-prefix=PreNat
> > iptables -t nat -I POSTROUTING -j LOG --log-prefix=PostNat
> > iptables -t nat -I OUTPUT -j LOG --log-prefix-OutNat
> >
> > Then just send somepackets through the machine and look at the log file
to
> > see what order they went through the chains/tables.
> >
> >
> >
> > Antony.
> >
>
>
>


