From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 17:07:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051707.hA5H7qr13228@agate.rockstone.co.uk>
References: <200311051638.hA5GcAI48932@alf1.lmb.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311051638.hA5GcAI48932@alf1.lmb.internal>
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

On Wednesday 05 November 2003 4:38 pm, tsh@mrc-lmb.cam.ac.uk wrote:

> Not particularly packets of this type, but e.g. to put a rate-limit
> on incoming NEW connections, in order to help prevent a DoS attack
> on, say, a webserver or mailhub.

Indeed - that makes much more sense, yes.

Antony.

> >> I was thinking about just this the other night, and is seems to me that
> >> such a rule should be rejecting stuff which exceeds the rate limit
> >> rather than accepting stuff which doesnt exceed it, since the -j ACCEPT
> >> will mean that any subsequent rules in a FORWARD table wont be tested.
> >>
> >> Something like
> >>
> >> iptables -A FORWARD -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit !
> >> limit 1/s -j DROP
> >
> >Why do people want to ACCEPT any packets of this type at all?   If a
> > packet is part of an ESTABLISHED connection then it is going to pass
> > through your FORWARD chain on the connection tracking rule; if a packet
> > is not part of an ESTABLISHED connection, then it's either a valid new
> > connection (in which case you ACCEPT it), or else it isn't (in which case
> > you don't ACCEPT it).
> >
> >I can't quite see why you would want to accept even a slow rate of such
> >
> >>packets.
> >
> >Regards,
> >
> >Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.
                                                     Please reply to the list;
                                                           please don't CC me.

