From: Jason Opperisano <opie@817west.com>
Subject: Re: Does anybody work on supporting SPD matching Netfilter MARKS?
Date: Wed, 19 Jan 2005 13:58:59 -0500
Message-ID: <20050119185859.GA12706@bender.817west.com>
References: <41EE01DF.5040707@protactive.nl>
	<1106145684.4934.32.camel@hubcap.ljm.dom>
	<41EEAD74.4030804@protactive.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41EEAD74.4030804@protactive.nl>
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

On Wed, Jan 19, 2005 at 07:56:52PM +0100, Ludo Stellingwerff wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Thank for you reaction Jason,
> and sorry about the cross post, you're right, my mistake:(
> 
> The question I raised was not about the filtering side, but about the
> policy match. What NetBSD is capable of is to use it's packetfilter
> for deciding ipsec policies, by using a "tag".
> 
> In Linux terms this would mean that by using a firewall mark you could
> use the netfilter matching structure instead of the SPD internal matches.
> 
> spdadd mark 1 -P out esp/transport//require
> 
> This would read: All packages marked with firewall mark 1 should be
> encrypted and send on a transport mode ipsec connection.
> 
> Does anyone know some sort of implementation doing this?

ah--i misunderstood what you were asking.  i think your question is
probably better suited to the ipsec-tools list, as all you need
netfilter to do is set the mark, which it can already do.

-j

--
"It takes two to lie. One to lie and one to listen."
        --The Simpsons

