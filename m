From: Jason Opperisano <opie@817west.com>
Subject: Re: [Fwd: Server machines behind Firewall]
Date: Fri, 7 Jan 2005 10:43:41 -0500
Message-ID: <20050107154341.GA181@bender.817west.com>
References: <41DEA59E.F63D5C97@ita.org.mo>
	<20050107152755.GA49@bender.817west.com>
	<41DEAE9C.62B38374@ita.org.mo>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41DEAE9C.62B38374@ita.org.mo>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Jan 07, 2005 at 11:45:32PM +0800, edwardspl@ita.org.mo wrote:
> Jason Opperisano wrote:
> 
> > > Sorry, what useful about the following function ( command line ) ?
> > >
> > > > iptables -A FORWARD -i $EXT_IF -o $INT_IF -p tcp --syn -d $SRV1 \
> > > > ? --dport 80 -j ACCEPT
> >
> > um--it allows the packet through the FORWARD chain of the filter table.
> > remember--you're trying to build a firewall here.
> 
> So, must I enable this kind of function for using the Firewall ?

if you want your machine to be an actual firewall, yes.  if you're
building a NAT router--then no.

-j

--
"I bent my wookie."
        --The Simpsons

