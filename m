From: Jason Opperisano <opie@817west.com>
Subject: Re: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 10:25:55 -0500
Message-ID: <20041105152555.GA1158@bender.817west.com>
References: <20041105123843.GB11016@zion.homelinux.com>
	<20041105124107.GE9379@torres.ka0.zugschlus.de>
	<20041105125421.GA12058@zion.homelinux.com>
	<20041105130424.GF9379@torres.ka0.zugschlus.de>
	<20041105142219.GB12563@zion.homelinux.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041105142219.GB12563@zion.homelinux.com>
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

On Fri, Nov 05, 2004 at 03:22:19PM +0100, Sven Schuster wrote:
> 
> Hi Marc,
> 
> On Fri, Nov 05, 2004 at 02:04:24PM +0100, Marc Haber told us:
> > What you intend to do does not make sense.
> >
> > This surely is meant to be a solution to some unmentioned problem. By
> > asking about the problem, I am just trying to give a solution.
> 
> well, I know that it doesn't make much sense. This setup was made to
> "balance" the traffic coming in to the machine. I know that there's
> not much  difference between one NIC running at, say 400 Mbps, or
> two NICs running at 200 Mbps each which will also be 400 Mbps, because
> the machine can't handle more traffic (data (backups) is received via
> network from other machines and written to disks)...but as I've already
> written, this wasn't my decision...

see--telling us what the actual goal is will help people make
suggestions that work that will meet that goal, rather than trying to
pigeon-hole us into trying implement your thought for the "only" way to
solve this.

have you looked into the bonding driver?  two ethernet connections, link
aggregation (802.3ad), high availability, one IP address:

  http://linux-ip.net/html/ether-bonding.html

-j

--
"Son, when you participate in sporting events, it's not whether you
 win or lose: it's how drunk you get."
        --The Simpsons

