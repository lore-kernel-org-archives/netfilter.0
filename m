From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Question to the list/maintainers....
Date: Fri, 3 Oct 2003 09:06:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310030906.30791.Alistair@nerdnet.ca>
References: <200310011918.40436.Alistair@nerdnet.ca> <20031003101955.GU5758@sunbeam.de.gnumonks.org>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031003101955.GU5758@sunbeam.de.gnumonks.org>
Content-Disposition: inline
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
To: Harald Welte <laforge@netfilter.org>
Cc: netfilter@lists.netfilter.org

On October 3, 2003 06:19 am, Harald Welte wrote:
> On Wed, Oct 01, 2003 at 07:18:40PM -0400, Alistair Tonner wrote:
> > 	Are the updates in 2.4.22 likely to fix the occasional DCC send/recieve
> > errors that my natted users have been experiencing ( DCC connection
> > requests come through, but cannot be seen by the client, only by the
> > server and the NATTING host) -- this is an intermittent problem that I
> > was laying at the foot of the client until I noted that the actual
> > 	client to client connection was never built in the conntrack
> > 	table?
>
> please look at the irc related patch in the new patch-o-matic release,
> that fixes a particular 'bug' in case mIRC is configured erroneously on
> the client side.


	Ahhh ... we handled the client using the external IP?
	I was the one pointed that sillyness out.  There are other
	clients that do that too .. .so should handle them as well... 
	(my other half was quite upset when she couldn't transfer back then)

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

