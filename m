From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block p2p
Date: Thu, 11 Mar 2004 09:26:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403110926.26421.Antony@Soft-Solutions.co.uk>
References: <001201c40744$1f34a190$2a245cc2@cea05> <200403110859.53154.Antony@Soft-Solutions.co.uk> <003301c40749$b68e4280$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003301c40749$b68e4280$2a245cc2@cea05>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thursday 11 March 2004 9:17 am, Tomasz Macioszek wrote:

> > > iptables -P FORWARD DROP
> > iptables -F FORWARD

> I know but I would like to block only p2p traffic??
> Is patch which blocks only p2p??

I do not know of a way to block p2p without blocking other protocols.

However, does not mean there isn't one, just that I don't know about it.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


