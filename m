From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: ever block *outgoing* packets on your firewall?
Date: Mon, 7 Feb 2005 17:44:27 +0000
Message-ID: <20050207174427.GZ14572@metastasis.org.uk>
References: <20050114200228.GA21562@spawar.navy.mil>
	<20050114201404.GA27341@bender.817west.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050114201404.GA27341@bender.817west.com>
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

On Fri, Jan 14, 2005 at 03:14:04PM -0500, Jason Opperisano wrote:
> On Fri, Jan 14, 2005 at 12:02:28PM -0800, seberino@spawar.navy.mil wrote:

> > I'm wondering if it is ever necessary to block
> > *outgoing* packets at your firewall.

Yes, but others have answered this in a far more timely fashion than
myself.

> i run a default DROP policy on the OUTPUT chain of my firewalls and
> only allow out necessary traffic (DNS, HTTP/FTP to update servers,
> NTP, etc).  but i'm pretty odd when it comes to these things--i don't
> know how necessary it is.  the one nice side-effect is that is keeps
> me from doing something stupid when i'm ssh-ed into a firewall.

Out of interest why "DROP" rather than "REJECT"?  With reject users,
hosts or programs on the inside tend to fail straight away rather than
taking a while to time out annoyingly.

-- 
Where are we going and what's with the hand basket?

