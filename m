From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: REJECT sends more than just RST?
Date: Fri, 7 Nov 2003 17:26:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071726.hA7HQej14899@agate.rockstone.co.uk>
References: <20031106171110.28576.36268.Mailman@netfilter-sponsored-by.noris.net> <3FABD1F5.400F@sat.dundee.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FABD1F5.400F@sat.dundee.ac.uk>
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

On Friday 07 November 2003 5:10 pm, Andrew Brooks wrote:

> Antony Stone wrote:
> > Andrew Brooks wrote:
> > > I'm trying to reject SMTP connections by sending a RST but it
> > > seems to be sending SYN ACK before sending RST which isn't what
> > > I want.  I'm using shorewall 1.2.8 and kernel 2.4.18.  Is this
> > > a known problem, and, if so, which release fixes it?
> >
> > What rule/s are you attempting to use to do this?
> >
> > I would have thought something like:
> >
> > iptables -A INPUT (or FORWARD, depending on your setup) -p tcp --dport 25
> > -j REJECT --reject-with=tcp-reset
> >
> > should do the trick?
>
> Thanks very much for your reply.
>
> Unfortunately I'm using Shorewall to generate the rules so I don't
> know exactly what it's using.  However I suspect it's not specifying
> any --reject-with argument, maybe because there wasn't any such
> option in the 2.4.18 kernel.

Er, yes there was.   --reject-with has been around for a long time.

> Anyway I was wondering whether the effect I am seeing is due to a
> known, and fixed, problem?  The shorewall author has said that there
> have been other REJECT-related bugs too, so I'm understandly reluctant
> to simply try a new kernel for the sake of it, unless I know it will
> fix the problem and not break anything else!

If you're talking to the shorewall author (is that Tom Eastep?), you should 
be able to find out exactly what rule is being used (assuming it's not 
possible for you to find out from a running system?), so you can tell whether 
the behaviour is as expected or not.

Antony.

-- 

There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly
                                                     Please reply to the list;
                                                           please don't CC me.

