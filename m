From: "Caracal - G. Hostettler" <100112_2660@bluewin.ch>
Subject: Re: Multihomed firewall and port forwarding nightmare ))):-(
Date: Wed, 14 Jan 2004 23:43:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c3daef$e5a2b370$017ca8c0@lucens.caracal.ch>
References: <004301c3dae3$17238120$017ca8c0@lucens.caracal.ch> <200401142124.33954.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

I did, just to be sure, removed two NICs and assigned the three IPs to the
remaining one.
Changed rules accordingly (just changing the ifaces names).

Got exactly the same behavior. So the problem do not seem to be a routing
problem.
My idea to have three separate interfaces is:
a) if one crashes, not all services are down
b) if I need an express and physical break, I can stop smtp (for example)
traffic by simply disconnecting or downing one interface

Any suggestion on the rules previously posted ?

Thank you !

GH

> On Wednesday 14 January 2004 9:12 pm, Caracal - G. Hostettler wrote:
>
> > Hi!
> >
> > Using ipchains for a while and relatively new to iptables.
>
> Welcome to the 21st Century :)
>
> > I have to setup a somewhat special multihomed firewall:
> > It has three external interfaces with public addresses, one for http,
one
> > for both smtp and pop3 and the third for ftp. These are real hardware
NICS,
> > not virtual.
>
> Why?   What is the purpose of having three external IP addresses (in the
same
> subnet range) on three separate interface cards?   I think it makes your
> routing setup unecessarily complicated.
>
> I would recommend one external interface and one internal interface, with
> however many IP addresses you need on each.
>
> Regards,
>
> Antony.
>
> -- 
> This is not a rehearsal.
> This is Real Life.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>


