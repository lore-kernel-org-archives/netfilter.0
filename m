From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: routing game packets
Date: Fri, 4 Oct 2002 20:45:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021004194551.FSVD28004.mta07-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0210041532510.8805-100000@janeway.vonbek.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210041532510.8805-100000@janeway.vonbek.dhs.org>
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

On Friday 04 October 2002 8:40 pm, John Bleichert wrote:

> > > I'm trying to setup incoming and outgoing traffic correctly
> > > to play a game. The game's website specifies these ports:
> > >
> > > * Outgoing:
> > >    src port: 5120-5129
> > >    dst port: 5121-5300
> > >
> > > * Incoming:
> > >    src port: 5121-5300
> > >    dst port: 5120-5129
> > >
> > > Now, for incoming packets, I have:
> > >
> > >    iptables -A PREROUTING -t nat -p udp \
> > >       -d ${external} --dport 5120:5129 -j DNAT --to ${gamebox}
> > >
> > > Do I really need to specify the --sport for incoming? Or will the
> > > NAT'd packets retain that src-port data?
> >
> > I would recomend that you do specify both source and destination ports,
> > simply because it provides some small additional restriction on the
> > traffic you are allowing into your system.   The more you can restrict
> > that whilst still allowing what you need, the better.
>
> So that would change it to this, correct?:
>
> iptables -A PREROUTING -t nat -p udp                      \
>        -d ${external} --dport 5120:5129 --sport 5121:5300 \
>        -j DNAT --to ${gamebox}

Yes, that's the idea :-)

> > > And do I really need to do anything for outgoing packets? As long
> > > as they are not blocked, should it work fine?
> >
> > Correct.   If you have a policy which allows all outbound traffic, then
> > it will work with this game (provided, of course, that whatever protocol
> > this game uses does not mind being NATted...)
>
> Currently I'm allowing all outbound traffic, I haven't had the need (so
> far) to restrict it.

Okay.

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

