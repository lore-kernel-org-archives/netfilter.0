From: Ben Russo <ben@umialumni.com>
Subject: Re: NAT only - No connection tracking
Date: 11 Nov 2002 15:16:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037045760.3428.47.camel@ben.mis.tnsi.com>
References: <20021111192103.14755.qmail@web40910.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021111192103.14755.qmail@web40910.mail.yahoo.com>
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
To: Brad Chapman <kakadu_croc@yahoo.com>
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Mon, 2002-11-11 at 14:21, Brad Chapman wrote:
> Mr. Antony,
> 
> --- Antony Stone <Antony@Soft-Solutions.co.uk> wrote:
> > On Monday 11 November 2002 11:34 am, Brad Chapman wrote:
> > 
> > > > How can I make my iptable to do just NAT, no connection tracking?
> > > >
> > > > Basically, I want to make my iptable to become a NAT device without
> > > > stateful inspection.
> > > > It this possible?
> > >
If you don't want connection tracking but want NAT just use the old
ipchains instead of iptables.

-Ben.


