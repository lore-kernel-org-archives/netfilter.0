From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 15:00:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231500.05742.Antony@Soft-Solutions.co.uk>
References: <s0d956ae.099@GroupWise> <200406231433.28295.Antony@Soft-Solutions.co.uk> <1088001203.4009.45.camel@simpsonb.hillsboroughcounty.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088001203.4009.45.camel@simpsonb.hillsboroughcounty.org>
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

On Wednesday 23 June 2004 3:33 pm, Brett Simpson wrote:

> On Wed, 2004-06-23 at 09:33, Antony Stone wrote:
> > On Wednesday 23 June 2004 3:08 pm, Brett Simpson wrote:
> > > I've tried a number of different PREROUTING and POSTROUTING rules and
> > > can't seem to make this work.
> > >
> > > I have a system with a single nic (eth0). While I'm on the system via a
> > > shell I would like to connect to 127.0.0.1:6000 and get seemlessly
> > > translated to 207.156.7.15:80.
> > >
> > > I tried the following without success:
> > >
> > > iptables -t nat -A PREROUTING  -p tcp -d 127.0.0.1   -i lo --dport 6000
> > > -j DNAT--to-destination 207.156.7.15:80
> > >
> > > iptables -t nat -A POSTROUTING -p tcp -d 207.156.7.15 -o eth0 --dport
> > > 80 -j SNAT --to-source 127.0.0.1
> >
> > Try:
> >
> > iptables -A OUTPUT -t nat -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to
> > 207.156.7.15:80
>
> Didn't work. Would the INPUT chain help?

No, I don't think so.   INPUT is only for the reply packets.   I'm assuming 
you're allowing those back in to your machine (!?), so the problem is getting 
the outbound packets to the right destination with the right return address.

> iptables -t nat -A OUTPUT -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to
> 207.156.7.15:80
> iptables -t nat -A POSTROUTING -p tcp -d 207.156.7.15 -o eth0 --dport 80
> -j SNAT --to-source 127.0.0.1

Duh :)   I forgot about the reply address :)

My rule will send packets to 207.156.7.15 with a source address of 127.0.0.1

Not surprisingly, you don't get anything back...

Try:

iptables -A OUTPUT -t nat -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to 
207.156.7.15:80
iptables -A POSTROUTING -t nat -p tcp --dport 80 -d 207.156.7.15 -s 127.0.0.1 
-j SNAT --to a.b.c.d

Where a.b.c.d is the routable address of your machine, to which reply packets 
can successfully return.

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)


