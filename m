From: Alexis <alexis@attla.net.ar>
Subject: Re: Firewall workaround
Date: Fri, 16 Jan 2004 14:03:18 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074272597.9660.15.camel@noc2tuh.dcn>
References: <357895CFC8CB7C44900D6A4F46D08AA90459C9@exchangeserver.IAT.local>
	 <200401161615.23266.Antony@Soft-Solutions.co.uk>
	 <1074271086.9660.12.camel@noc2tuh.dcn>
	 <200401161654.16639.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401161654.16639.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

most of the IM's today will try first it traditional ports, then 80,
then 443, then 23 , then 25.
Not using some tunneling of forwarding mechanism like ssh, just a single
connection trough this port.

I know ssh could forward ports, but in this case, you need the other end
where to forward the port :)



On Fri, 2004-01-16 at 13:54, Antony Stone wrote:
> On Friday 16 January 2004 4:38 pm, Alexis wrote:
> 
> > using port 80 may work too.
> 
> But SSH is designed to support port forwarding - it's part of the standard 
> operation.   On port 80 you'd have to come up with some mechanism of your own 
> and make it work.
> 
> Antony.
> 
> > On Fri, 2004-01-16 at 13:15, Antony Stone wrote:
> > > On Friday 16 January 2004 4:01 pm, Benjamin Dickgiesser wrote:
> > > > It would be realy nice if someone could help me with this:
> > > >
> > > > Situation:
> > > > I am useing a Windows XP PC at a student hall. To connect to the
> > > > internet I am useing the university connection. Unfortunatly there are
> > > > only around 5 open ports (80,21,22,23,6667).
> > > > My aim is to make a work around to this firewall.
> > >
> > > I'm not sure that's an appropriate quesion to ask on a security mailing
> > > list, but I guess you're right in assuming that this is a place to find
> > > people who know how to do it :)
> > >
> > > Anyway, my answer to your question is: why not just tunnel the protocols
> > > you want through SSH port forwarding?
> > >
> > > Antony
-- 
Alexis <alexis@attla.net.ar>


