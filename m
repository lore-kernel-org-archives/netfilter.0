From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: ever block *outgoing* packets on your firewall?
Date: Tue, 8 Feb 2005 01:08:00 +0000
Message-ID: <20050208010800.GE14572@metastasis.org.uk>
References: <20050114200228.GA21562@spawar.navy.mil>
	<20050114201404.GA27341@bender.817west.com>
	<20050207174427.GZ14572@metastasis.org.uk>
	<20050207182846.GL31268@spawar.navy.mil>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050207182846.GL31268@spawar.navy.mil>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Mon, Feb 07, 2005 at 10:28:46AM -0800, seberino@spawar.navy.mil wrote:

> > > i run a default DROP policy on the OUTPUT chain of my firewalls
> > > and only allow out necessary traffic (DNS, HTTP/FTP to update
> > > servers, NTP, etc).  but i'm pretty odd when it comes to these
> > > things--i don't know how necessary it is.  the one nice
> > > side-effect is that is keeps me from doing something stupid when
> > > i'm ssh-ed into a firewall.
> >
> > Out of interest why "DROP" rather than "REJECT"?  With reject users,
> > hosts or programs on the inside tend to fail straight away rather
> > than taking a while to time out annoyingly.
>
> please remind me of difference between REJECT and DROP.
> 
> Perhaps I should use REJECT then!

From the "man iptables" pages ;)

DROP means to drop the packet on the floor.

REJECT
This is used to send back an error packet in response to the matched
packet.

Really that's it, a DROP rule with just eat the packet and not do
anything else or tell anyone or anything, hence the remote end of the
connection will presume the packet or its reply got lost along the way
and try again.  A REJECT rule will send something back saying "I don't
talk that protocol".

-- 
Where are we going and what's with the hand basket?

