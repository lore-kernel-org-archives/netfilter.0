From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: [LARTC] MSN keeps disconnecting with load balancing
Date: Sun, 13 Nov 2005 15:04:48 -0400
Message-ID: <65aa6af90511131104j146334day44d7bc8f01e4e18f@mail.gmail.com>
References: <4376BF51.7040300@phreaker.net> <4376CCF5.9080107@fatooh.org>
	<118619310511122225t58d04261j30a9bf84c64258c6@mail.gmail.com>
	<43776B8B.7010802@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43776B8B.7010802@phreaker.net>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Try using a separate routing table for the packets that will go to the
MNS servers. In that routing table you use a single network interface.
In my experience, using a separate routing table with an interface
that uses masquerade, fails (at least, it has failed in my
experiments).

But I guess that if you are using SNAT, you should have no problem at
all with that.

On 11/13/05, ro0ot <ro0ot@phreaker.net> wrote:
> Is it possible to increase the cached route timeout?  Yes, I am using
> SNAT, will MASQUERADE help?
>
>
> Ryan Castellucci wrote:
>
> >This problem is caused by the cached route to MSN expiring, and the
> >kernel trying to route the existing connection over the other internet
> >connection. If you're doing SNAT, this will result in the source IP
> >address changing, and MSN will reset the connection.
> >
> >On 11/12/05, Corey Hickey <bugfood-ml@fatooh.org> wrote:
> >
> >
> >>ro0ot wrote:
> >>
> >>
> >>>Hi,
> >>>
> >>>I have the my gateway with load balancing traffic going out over two
> >>>providers.  Web browsing is fine...working great.
> >>>
> >>>But, my clients (office staff) complains that MSN keeps disconnecting
> >>>(in 5 mins).  Why?
> >>>
> >>>
> >>Do you mean MSN instant messenger? I've never used it, but I can give
> >>you a few generic steps to take when you want to figure out what's goin=
g
> >>wrong with a connection. Are you familiar with tcpdump and/or ethereal?
> >>
> >>1. Go to the computer of a client who is complaining about disconnectio=
n.
> >>
> >>2. ssh into your gateway and run:
> >># tcpdump -i eth0 host 123.123.123.123 and port not ssh
> >>Change "eth0" to the inside interface and "123.123.123.123" to the IP
> >>address of your client.
> >>
> >>3. See if tcpdump is catching lots and lots of packets. If it is, eithe=
r
> >>stop programs on your clients machine that access the Internet or use
> >>more filters (like "and port not imaps").
> >>
> >>4. Once you're not catching lots of extraneous packets, kill tcpdump an=
d
> >>run:
> >># tcpdump -s 1500 -w log -i eth0 host 123.123.123.123 and port not ssh
> >>Include any other filters you have to use.
> >>
> >>5. Have your client start up their program, and then sit there and wait=
.
> >>Don't do anything else that would send packets through the gateway; you
> >>don't want to clutter up the log.
> >>
> >>6. See if the problem manifests. Most likely it won't, because that's
> >>just the way things are :) , but if it does you'll have a log. Kill
> >>tcpdump and examine the file with:
> >># tcpdump -r log
> >>If you want more verbosity, use "-v", "-vv", or "-vvv". Or, if you want
> >>to use a gui, copy the log file to some machine with X11 and use:
> >># ethereal -r log
> >>
> >>
> >>-Corey
> >>_______________________________________________
> >>LARTC mailing list
> >>LARTC@mailman.ds9a.nl
> >>http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
> >>
> >>
> >>
> >
> >
> >--
> >Ryan Castellucci http://ryanc.org/
> >_______________________________________________
> >LARTC mailing list
> >LARTC@mailman.ds9a.nl
> >http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
> >
> >
> >
> >
>
>
>
> _______________________________________________
> LARTC mailing list
> LARTC@mailman.ds9a.nl
> http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
>

