From: "P.Italiaander" <pc-secure@home.nl>
Subject: Re: NOT acceptable "/etc/sysconfig/network-scripts/ifup" script !!!
Date: Thu, 15 May 2003 21:46:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305152146.17228.pc-secure@home.nl>
References: <200305142155.31623.pc-secure@home.nl> <200305151742.26913.pc-secure@home.nl> <20030515194843.6c8876f2.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030515194843.6c8876f2.arnt@c2i.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Op donderdag 15 mei 2003 19:48, schreef u:
> On Thu, 15 May 2003 17:42:26 +0200,
> "P.Italiaander" <pc-secure@home.nl> wrote in message
>
> <200305151742.26913.pc-secure@home.nl>:
> > Op donderdag 15 mei 2003 14:52, schreef Arnt Karlsen:
> > > ..I know, ipup _is_ buggy, my hint was more on Red Hats somewhat
> > > sloppy QA attitude.  I mean, if I should _not_ use RH9 to route
> > > traffic, I would like to know _that_ from the docs.
> > >
> > > ..does Mandrake or Debian turn their rear end onto _whoever_ like
> > > RH-9 does in
> > > https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=89171 ???
> >
> > I've checked , but Mandrake 9.1 is not effected with that bug.
> > Thanks for mention it.
> > On Debian i don't know  ,don't have it , i use OpenBSD en Linux SuSe ,
> > Redhat ,Mandrake.
> >
> > Does anyone have tested yet,  my patched /sbin/ifup file, for
> > iptables-script ??
>
> ..the wifi part of it works fine, but it _introduces_ bug # 89171,
> I tested with a thinkpad 760 ED I use as AP, it runs RH-7.3.
>
> ..it looks like Red Hat cannot use mac addresses to ID nics.


hmm... , I really thought ,that after my update , this shoud be fixed ??
since syntax is changed.
I 've looked but can't find patch anywhere , do you have one ?

Pascal 

