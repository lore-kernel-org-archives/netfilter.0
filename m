From: rsnel@cube.dyndns.org
Subject: Re: 26sec+forwarding, bug or PEBKAC?
Date: Wed, 6 Apr 2005 23:25:13 +0200
Message-ID: <20050406212513.GA19637@cube.dyndns.org>
References: <9C1918067C3BC14C9C351C206D8A8437372FF2@rennsmail03.eu.thmulti.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <9C1918067C3BC14C9C351C206D8A8437372FF2@rennsmail03.eu.thmulti.com>
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


Hi,

On Wed, Apr 06, 2005 at 02:36:10PM +0200, Allain Yoann wrote:
> > On Tue, 31 Mar 2005 22:16:40, rsnel at cube.dyndns.org wrote
> > >
> > >packets from ipsec tunnel seem to get lost before they enter the the
> > >FORWARD chain with kernel 2.6.11. There is no problem with 2.6.8-2-k6
> > >(Debian kernel with 26sec) and there is no problem with ipsec turned
> > >off.
> > > [...]
> > >So, is it a bug, feature, or just misconfiguration? Can you reproduce?
> > >I would appreciate any insight on this problem.
> 
> I solved the problem:
> Since the kernel 2.6.10, we must set a "fwd" policy in the same way we
> did for the "in" policy on each host-end of the tunnel.
> 
> I just found one reference on the web:
> http://www.ipsec-howto.org/x277.html (one line in the middle)
> 
> I hope others newbies like me won't lose too much time on it...

Many thanks Allain for your solution. (I didn't try it out yet, but I
expect it to work) And so problem turned out to be misconfiguration of a
new feature...

Greetings,

Rik.


