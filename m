From: Brett Simpson <simpsonb@hillsboroughcounty.org>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 11:12:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088003535.4009.78.camel@simpsonb.hillsboroughcounty.org>
References: <s0d956ae.099@GroupWise>
	 <200406231433.28295.Antony@Soft-Solutions.co.uk>
	 <1088001203.4009.45.camel@simpsonb.hillsboroughcounty.org>
	 <200406231500.05742.Antony@Soft-Solutions.co.uk>
Reply-To: simpsonb@hillsboroughcounty.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231500.05742.Antony@Soft-Solutions.co.uk>
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

On Wed, 2004-06-23 at 10:00, Antony Stone wrote:
> On Wednesday 23 June 2004 3:33 pm, Brett Simpson wrote:
> 
> > On Wed, 2004-06-23 at 09:33, Antony Stone wrote:
> > > On Wednesday 23 June 2004 3:08 pm, Brett Simpson wrote:
> > > > I've tried a number of different PREROUTING and POSTROUTING rules and
> > > > can't seem to make this work.
> > > >
> > > > I have a system with a single nic (eth0). While I'm on the system via a
> > > > shell I would like to connect to 127.0.0.1:6000 and get seemlessly
> > > > translated to 207.156.7.15:80.
> > > >
> My rule will send packets to 207.156.7.15 with a source address of 127.0.0.1
> 
> Not surprisingly, you don't get anything back...
> 
> Try:
> 
> iptables -A OUTPUT -t nat -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to 
> 207.156.7.15:80
> iptables -A POSTROUTING -t nat -p tcp --dport 80 -d 207.156.7.15 -s 127.0.0.1 
> -j SNAT --to a.b.c.d
> 
> Where a.b.c.d is the routable address of your machine, to which reply packets 
> can successfully return.

Still no go. My machine is 172.27.228.145. I'm using lynx for the
browser on my machine.

iptables -A OUTPUT -t nat -p tcp --dport 6000 -d 127.0.0.1 -j DNAT --to
207.156.7.15:80
iptables -A POSTROUTING -t nat -p tcp --dport 80 -d 207.156.7.15 -s
127.0.0.1 -j SNAT --to 172.27.228.145

Thanks,
Brett





