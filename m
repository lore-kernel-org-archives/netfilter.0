From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: track bandwith used
Date: Thu, 1 Jul 2004 12:01:01 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504070100011e5decdf@mail.gmail.com>
References: <00e501c45ea3$28e2d110$49caa8c0@caris.priv> <200406301807.57782.Antony@Soft-Solutions.co.uk> <13c101c45ed2$8db2b9a0$49caa8c0@caris.priv> <200406302303.05668.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406302303.05668.Antony@Soft-Solutions.co.uk>
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

MRTG is very good for monitoring bandwidth utiliization, web interface
is very cool it shows your inbound and outbound traffic graphically.

http://people.ee.ethz.ch/~oetiker/webtools/mrtg/ 
is a good place learning about MRTG and 
http://people.ee.ethz.ch/~oetiker/webtools/mrtg/mrtg-unix-guide.html

is a very nice walk through to install and configure mrtg on unix, linux

regards



On Wed, 30 Jun 2004 23:03:05 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> 
> On Wednesday 30 June 2004 7:46 pm, Peter Marshall wrote:
> 
> > yes it does.  Thank you very much.  I have been looking for an explanation
> > like that on the net. :)
> >
> > Do you have a link to where this netfilter documentation is ?
> 
> These might help fill in a few more details:
> 
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#USERLANDSTATES
> http://www.sns.ias.edu/~jns/security/iptables/iptables_conntrack.html
> 
> Antony.
> 
> > ----- Original Message -----
> > From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> > To: "netfilter" <netfilter@lists.netfilter.org>
> > Sent: Wednesday, June 30, 2004 2:07 PM
> > Subject: Re: track bandwith used
> >
> > On Wednesday 30 June 2004 5:51 pm, Peter Marshall wrote:
> > > You could make a connection out to a remote server.  That remote server
> > > might try to make a connection back to us that has nothing to do with the
> > > reason we connected to them.
> >
> > Such a connection would not be regarded as RELATED by the netfilter code.
> >
> > >  But the server may see it as related and allow it.
> >
> > I think you should read about netfilter's definition of RELATED.   It
> > doesn't
> > just mean "any packet which comes back from an IP address we're already
> > talking to".
> >
> > For example, I said that FTP data connections were RELATED to the FTP
> > control
> > connection - but that is only if you have loaded the FTP Conntrack Helper
> > module, or compiled FTP Conntrack support into your kernel.   That helper
> > is what RELATEs the two parts of FTP together in netfilter.
> >
> > Basically, if you don't have a helper module which understands why a
> > connection should be RELATED to another one, then it won't be.
> >
> > Arbitrary packets from IP addresses which happen to be part of an
> > ESTABLISHED
> > connection don't count - they will be seen as NEW incoming connections, and
> > make their own way through your ruleset (until they are persumably
> > DROPped), having no assiciation whatever to anything else which may be in
> > your connection tracking table.
> >
> > Hope this clarifies things?
> >
> > Regards,
> >
> > Antony.
> 
> -- 
> The truth is rarely pure, and never simple.
> 
>  - Oscar Wilde
> 
> 
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
>

