From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: irc
Date: Mon, 17 Nov 2003 15:50:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311171550.hAHFo7j22239@agate.rockstone.co.uk>
References: <OF9DF42386.B8AE0536-ON85256DE1.00551398-85256DE1.00552F5A@kal.kalsec.com> <20031117154124.GD10857@hamachi.radom.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031117154124.GD10857@hamachi.radom.org>
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

On Monday 17 November 2003 3:41 pm, dan radom wrote:

> * trainier@kalsec.com (trainier@kalsec.com) wrote:
> > Aye, a familiar face. ;-)
> >
> > The 'firewall' in this case, is a transparent proxy server.  The proxy
> > server will be the gateway to the internet.
> > I need to allow irc connections through this machine, somehow.  I don't
> > know how to do that.
> >
> > Regards,
> >
> > Tim Rainier
>
> You can always just allow established and related packets back in.  This
> should make almost any connection initiated from the LAN or iptables
> machine work.
>
> iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Observations:

1. The above suggestion will allow the machine to act as a stateful packet 
filtering firewall (which netfilter is very good at), but not as a proxy 
firewall (which netfilter doesn't do).

2. The example rule, because it is in the INPUT chain, will only allow 
packets coming back to the firewall machine itself - the rule needs to be in 
the FORWARD chain if you want to allow packets back to a protected network on 
the 'inside' of the firewall.

3. In either case (INPUT or FORWARD) you also need rules to allow the initial 
connection out of the machine - this would be in either the OUTPUT or FORWARD 
chains, again depending on whether we're talking about the firewall itself, 
or a protected network.

Antony.

-- 

What a waste it is to lose one's mind -- or not to have a mind.   How true 
that is.

 - Dan Quayle, vice-president of the United States of America
                                                     Please reply to the list;
                                                           please don't CC me.

