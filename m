From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ethernet headers and iptables counters
Date: Mon, 10 Nov 2003 23:45:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311102345.hAANjij17240@agate.rockstone.co.uk>
References: <1068455679.10203.4.camel@hohum.marcsnet.com> <200311102321.hAANLsj17218@agate.rockstone.co.uk> <1068507251.7980.15.camel@pcjohns.ecnnz.ecnetwork.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068507251.7980.15.camel@pcjohns.ecnnz.ecnetwork.co.nz>
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

On Monday 10 November 2003 11:34 pm, Simon Kitching wrote:

> On Tue, 2003-11-11 at 12:21, Antony Stone wrote:
> > On Monday 10 November 2003 10:25 pm, Marc Lucke wrote:
> > > Antony - my thanks to you.  I rather suspected your answer would be
> > > true.  My problem is that I am getting very large differences in the
> > > usage I track using iptables and the usage that my ISP reports.
> > > iptables reports much more traffic - up to 12% in fact.  I have checked
> > > with the ISP who say they too only count layer 3 IP.
> >
> > 12% is a lot, and the fact that you think you have 12% more traffic than
> > your ISP does is more strange than if it were the other way around.
>
> What about traffic from your host back to itself?

That should go via interface lo, not via eth0.

> For example, GNOME heavily uses the ORBIT corba server, which uses
> TCP/IP to communicate between interacting applications.
>
> Maybe you could add a separate rule for traffic from 127.0.0.1 and to
> your local host address back to the local machine, to measure that?

The routing table entry for 127.0.0.0/8 should send all this traffic via the 
loopback interface - this should not be counted by anything looking at the 
ethernet devices.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac
                                                     Please reply to the list;
                                                           please don't CC me.

