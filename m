From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: iptables, voip, mac match
Date: Fri, 11 Oct 2002 06:27:45 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210110626520.29360-100000@localhost.localdomain>
References: <06fd01c2710d$ed9ae4a0$583a29c4@ghome>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <06fd01c2710d$ed9ae4a0$583a29c4@ghome>
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
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Fri, 11 Oct 2002, Gavin wrote:

> > On Fri, 11 Oct 2002, Gavin wrote:
> >
> > > hello,
> > >
> > > just reporting a funny one:
> > >
> > > One of our clients was trying to use a VOIP application through a linux
> > > gateway (iptables-1.2.3). The client had a MAC address of a:b:c:d:e:f
> and an
> > > IP address of 1.2.3.4
> > >
> > > When I used this rule on the gateway (FORWARD policy DROP):
> > > iptables -A INPUT -i eth1 -m mac --mac a:b:c:d:e:f -j ACCEPT
> >
> >                                    --mac-source ???
> 
>                                             = same command, works as an
> abbreviation.

ah, something else that's not mentioned in the man page anywhere.
i *must* start making a list of these things. :-)

rday


