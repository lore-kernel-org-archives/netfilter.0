From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: per-connection byte counts
Date: Mon, 19 Jan 2004 00:31:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401190031.50360.Antony@Soft-Solutions.co.uk>
References: <20040118140903.GA3351@glympton.airtime.co.uk> <16394.59800.443846.342711@fisica.ufpr.br> <000e01c3de21$28bf0440$0300a8c0@indoaksesbno>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c3de21$28bf0440$0300a8c0@indoaksesbno>
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

On Monday 19 January 2004 12:14 am, bino-psn wrote:

> For me, I will pu another netfilter-box at the same eth backbone as the
> user.
> Put this interface in promiscuous mode.
> and ...... i thing you can check http://ipaudit.sourceforge.net

If this package provides the information you need, why not just run it on the 
netfilter machine?   What's the need for a separate box?

Antony.

> ----- Original Message -----
> From: "Carlos Carvalho" <carlos@fisica.ufpr.br>
> To: "Adam Rice" <adamrice@ntlworld.com>
> Cc: <netfilter@lists.netfilter.org>
> Sent: Monday, January 19, 2004 3:16 AM
> Subject: Re: per-connection byte counts
>
> > Adam Rice (adamrice@ntlworld.com) wrote on 18 January 2004 14:09:
> >  >I'd like to be able to get per-connection byte-counts from the kernel,
>
> so I
>
> >  >can create a sort of top program showing what processes and users are
> >  >currently using the network and how much. Since I want this to be
>
> something I
>
> >  >can keep running all the time, I don't want to do it by snooping the
> >  >interface. Is there some way to do this with netfilter? Sadly
> >  >/proc/net/ip_conntrack doesn't appear to provide this information.
> >
> > iftop and iptraf give statistics per interface, per machine and per
> > traffic type plus other interesting info. That's all that can be
> > obtained from a firewall since you cannot retrieve user info from
> > another machine. The performance impact is usually negligible.
> >
> > If you want to run the monitor in a multi-user system where users are
> > logged in you can associate the network connections with processes and
> > users but I don't know a program that does it. This is a "me too"...

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


