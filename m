From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT Helper or UPnP?
Date: Mon, 5 Jul 2004 19:18:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407051918.34681.Antony@Soft-Solutions.co.uk>
References: <SERVER7T2NqFJ3sl3xb000000a7@server7.bandwidthco.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <SERVER7T2NqFJ3sl3xb000000a7@server7.bandwidthco.com>
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
To: netfilter@lists.netfilter.org

On Monday 05 July 2004 6:56 pm, Mark E. Donaldson wrote:

> > On Monday 05 July 2004 08:29, Antony Stone wrote:
> > > I know this is by no means a detailed reply, but I would say it comes
> > > down to one word - "security".
> >
> > I'll second that.
>
> How about a third. Permitting Microsoft's UPnP through your firewall is
> equivalent to taking all the curtains down in your house and letting the
> entire world look inside. But alas, they may not be content with just
> viewing as they may see some things they might like and will eventually
> break in at night and take them.

Actually, I'd say the analogy above is more like running IIS (or some similar 
service where a quick scan will reveal the version of vulnerabilities you're 
running, and the attacker can then come back with the right tool when they 
want to exploit it).

uPnP would let the burglars look through your windows in the afternoon, say 
"that looks nice", and take it there and then.

The whole point of uPnP is to advertise the availability of services, so 
allowing it through a firewall is simply inviting people to partake of those 
services as they wish.

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


