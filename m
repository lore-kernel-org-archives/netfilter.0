From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: default policy
Date: Sat, 2 Nov 2002 11:08:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021102110903.MEF292.mta03-svc.ntlworld.com@there>
References: <31347F3CE518D6118ACB00A0246AD0560B2405@mx.snizek.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31347F3CE518D6118ACB00A0246AD0560B2405@mx.snizek.ch>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Saturday 02 November 2002 8:18 am, mailinglists@belfin.ch wrote:

> Who's Ziegler?

Rober Ziegler; Linux Firewalls; New Riders 2nd Ed 2001; ISBN 0735710996

http://www.bookpool.com/.x/ndmjrgo08i/sm/0735710996

> > You should never set any default policy other than ACCEPT on
> > a nat or mangle table.
> >
> > I sometimes think it was a bad idea even to make it possible.
>
> No, I don't think so. It's hard for beginners, yes. But once you understand
> what iptables is capable of (compared to other commercial products) you
> actually are glad that there is a product giving you control over
> everything.
> Defining the policies for every chain is such a freedom.

Can you think of a situation where it would be a good idea to set a default 
policy other than ACCEPT for a nat or mangle table ?

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.


