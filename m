From: Gavin Carr <gavin@openfusion.com.au>
Subject: Re: Connection failing to SNAT
Date: Wed, 26 Jan 2005 10:29:43 +1100
Message-ID: <20050125232943.GA22043@openfusion.com.au>
References: <20050125111802.GA19384@openfusion.com.au>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050125111802.GA19384@openfusion.com.au>
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

On Tue, Jan 25, 2005 at 10:18:02PM +1100, Gavin Carr wrote:
> Added some logging like so:
> 
>   # Log mangle POSTROUTING
>   $IPT -t mangle -A POSTROUTING -o $EXT -j LOG --log-prefix 'MANGLE POST: '
> 
>   # Turn on SNAT
>   $IPT -t nat -A POSTROUTING -o $EXT -j LOG --log-prefix 'POSTROUTING1: '
>   $IPT -t nat -A POSTROUTING -o $EXT -j SNAT --to-source 203.213.47.14
>   $IPT -t nat -A POSTROUTING -o $EXT -j LOG --log-prefix 'POSTROUTING2: '
> 
> and all I see in the logs for the bad connection is the 'MANGLE POST'
> packets - no 'POSTROUTING1' shows up at all. So it looks like the packets
> are just skipping the nat table altogether somehow?

This does seem to be the core problem - packets are being logged in the 
mangle POSTROUTING table, but then not showing up in the nat POSTROUTING 
table. Not all packets, though - just these problem ones. Anyone have
any idea how this can happen? All the diagrams I've seen seem to indicate
that mangle and nat postrouting are strictly sequential?

All suggestions gratefully received.

Cheers,
Gavin


