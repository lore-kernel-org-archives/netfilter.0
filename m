From: Brett Simpson <simpsonb@hillsboroughcounty.org>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 12:34:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088008480.4009.80.camel@simpsonb.hillsboroughcounty.org>
References: <s0d956ae.099@GroupWise>
	 <200406231558.00325.Antony@Soft-Solutions.co.uk>
Reply-To: simpsonb@hillsboroughcounty.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231558.00325.Antony@Soft-Solutions.co.uk>
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

On Wed, 2004-06-23 at 10:58, Antony Stone wrote:
> On Wednesday 23 June 2004 3:08 pm, Brett Simpson wrote:
> 
> > I've tried a number of different PREROUTING and POSTROUTING rules and can't
> > seem to make this work.
> >
> > I have a system with a single nic (eth0). While I'm on the system via a
> > shell I would like to connect to 127.0.0.1:6000 and get seemlessly
> > translated to 207.156.7.15:80.
> 
> I might as well just check something rather obvious:
> 
> Can you access 207.156.7.15:80 from the machine we are talking about?

Yes.

> ie: assuming we get the NAT to work the way you want, do the packets get to 
> the remote server and the replies back again okay?




