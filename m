From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: deleting specific rule ...
Date: Mon, 14 Jun 2004 16:25:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406141625.19755.Antony@Soft-Solutions.co.uk>
References: <20040611160047.73593.qmail@web50210.mail.yahoo.com> <200406111815.35432.Alistair@nerdnet.ca> <20040614150414.GA26186@legolas.on.net.mk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040614150414.GA26186@legolas.on.net.mk>
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

On Monday 14 June 2004 4:04 pm, Damjan wrote:

> > > here is the list of rule in my iptables
> > >
> > > now i want to delete this rule ..
> > >
> > > wat will be the command in doing so ?
> >
> > 	Hi -- relist the rules
> >
> > 	iptables -L -n --line-numbers
> >
> > 	will number each line.
> >
> > 	iptables -D INPUT x
>
> Unfourtenatelly there's a chance that between those two commands the
> line-number of the required rule could change.

I don't quite understand why (although I agree that it's remotely possible), 
so how about using -D instead of -A (or -I) with exactly the same parameters 
as you specified when adding the rule?

eg: if you add a rule using

iptables -A FORWARD -p tcp --dport 80 -s 10.20.30.40 -d 172.16.17.18 -j REJECT

you can delete it using

iptables -D FORWARD -p tcp --dport 80 -s 10.20.30.40 -d 172.16.17.18 -j REJECT

Where it happens to be in the ruleset when you delete it is irrelevant.

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


