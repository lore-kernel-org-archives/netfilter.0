From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: port-based filtering of IPsec packets?
Date: Wed, 23 Jul 2003 21:08:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030724010857.GB25253@cannon.eng.us.uu.net>
References: <1058988918.6068.29.camel@insomnia.ecn.purdue.edu> <20030723204240.GE23652@cannon.eng.us.uu.net> <000e01c3515e$f8320830$05001aac@breton1> <1058995435.6068.73.camel@insomnia.ecn.purdue.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1058995435.6068.73.camel@insomnia.ecn.purdue.edu>
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
Content-Transfer-Encoding: 7bit
To: Rick Kennell <kennell@ecn.purdue.edu>
Cc: Garcia Ruiz <gar_ruiz@teleline.es>, Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

On Wed, Jul 23, 2003 at 04:23:55PM -0500, Rick Kennell wrote:

> > Once the IPsec traffic has been terminated (decapsulated) you can
> > filter it based on the services (tcp or udp ports) prior to that
> > you only can filter based on the outer IP header...
> 
> OK.  Is there a way to decapsulate an ESP packet in iptables?

No, if the IPsec tunnel terminates on your firewall then you'll see the
decapsulated packet while it's being forwarded to its internal destination.
If it does not terminate on your firewall then you're out of luck and must
only rely on the outer IP header to filter...

Ramin

