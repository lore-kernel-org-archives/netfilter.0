From: Jason Opperisano <opie@817west.com>
Subject: Re: semi OT: default route
Date: Wed, 20 Oct 2004 12:48:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020164830.GA7438@bender.817west.com>
References: <20041020132551.GA1720@tranquility.scriptkitchen.com>
	<20041020161725.GA7221@bender.817west.com>
	<20041020163734.GR21006@metastasis.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041020163734.GR21006@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 20, 2004 at 05:37:34PM +0100, Nick Drage wrote:
> However if you want to give the routes different metrics....
> 
> ip route add default via 1.2.3.4 metric 1
> ip route add default via 4.5.6.7 metric 2
> 
> "ip" will accept that input.
> 
> That should mean if the host can't send the traffic via 1.2.3.4 it will
> realise this ( I presume solely if it gets no arp-reply for 1.2.3.4) it
> will try and send the traffic via 4.5.6.7 instead.
> 
> That seems to be the way it should work, however on a test box my host
> is happily trying to arp for 1.2.3.4 continuosly.
> 
> Anyone help me finish off this answer ;)

yes--the linux routing code will do dead gateway detection and fall
back to a lower metric route in the event of failure, and also go back
to the higher metric route upon resurrection.  this can be useful for
an active-standby setup.

as for which route added by 'route' actually gets used--i've never spent
the time to figure out how it picks the one it uses, but it certainly
only appears to ever use one--maybe it picks the one with the lowest
numerical value...  or maybe it uses one of those magic 8-ball things...

-j

-- 
Jason Opperisano <opie@817west.com>

