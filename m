From: Steve Mickeler <steve@warning.ca>
Subject: RE: Using heartbeat for fall over on IPTables Firewall
Date: Mon, 17 Mar 2003 17:08:26 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303171701120.7151@gypsy>
References: <3019863CF306D211BA4500A0CC30812DC67938@exchange.cyberwolf.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3019863CF306D211BA4500A0CC30812DC67938@exchange.cyberwolf.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chip Upsal <cupsal@cyberwolf.com>
Cc: Antonio Paulo Salgado Forster <aforster@br.ibm.com>, netfilter@lists.netfilter.org



Just off the top of my head:

1) heartbeat is limited to 2 nodes

2) keepalived config is much cleaner and easier to manage.



On Mon, 17 Mar 2003, Chip Upsal wrote:

> in what ways is this better then heartbeat?
>
> -----Original Message-----
> From: Steve Mickeler [mailto:steve@warning.ca]
> Sent: Monday, March 17, 2003 1:39 PM
> To: Antonio Paulo Salgado Forster
> Cc: Chip Upsal; netfilter@lists.netfilter.org
> Subject: Re: Using heartbeat for fall over on IPTables Firewall
>
>
>
> I'll second the vote for keepalived.
>
> Its an amazing tool.
>
> http://www.keepalived.org/
>
>
>
>
> On Mon, 17 Mar 2003, Antonio Paulo Salgado Forster wrote:
>
> >
> > Suggestion: Try using keepalived instead.
> >
> > Regards,
> >
> > Forster
> >
> >
> > Chip Upsal <cupsal@cyberwolf.com>@lists.netfilter.org on 03/17/2003
> > 01:16:46 PM
> >
> > Sent by:    netfilter-admin@lists.netfilter.org
> >
> >
> > To:    netfilter@lists.netfilter.org, "'linux-ha@muc.de'"
> <linux-ha@muc.de>
> > cc:
> > Subject:    Using heartbeat for fall over on IPTables Firewall
> >
> >
> >
> > I am looking to use heartbeat to provide fall over for my iptables
> > firewall.
> > I am looking for those with experience using these tools together.
> >
> > I plan to use RH7.2 on the firewalls.
> >
> > I made some attempts at implementing such a solution but i ran into a few
> > problems.
> >
> > I would like suggestions on setup of the heartbeat configuration files.
> > Pointers on the iptables startup script. and advice on what kernel version
> > to use and if any patches need to be applied.
> >
> > Thanks in advance,
> >
> > Chip
> >
> >
> >
> >
> > Chip Upsal
> > SysAdmin
> > CyberWolf Inc
> >
> >
> >
> >
> >
>

