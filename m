From: David Cary Hart <DCH@TQMcube.com>
Subject: Re: Samba "Leak"
Date: Wed, 07 Jul 2004 17:52:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089237164.30076.23.camel@localhost>
References: <1089228185.30076.14.camel@localhost>
	 <200407072035.48484.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407072035.48484.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-07-07 at 15:35, Antony Stone wrote:
> On Wednesday 07 July 2004 8:23 pm, David Cary Hart wrote:
> 

> Here are my comments / thoughts:
> 
> 1. Just because you're seeing WAN addresses doesn't mean they aren't spoofed 
> (they could be packets from the LAN, but with external source addresses?)
> 

??

> 2. Do you have any wireless involved anywhere, as a means for unknown clients 
> to access the network?
> 
Yes. Security is through the MAC of the client card. It's hard coded for
our two cards. Encryption is still a challenge for MadWifi. I assumed
that only the MAC of the router is sent out with packets.

> 3. A packet sniffer / IDS on the external firewall link + the Samba subnet 
> (DMZ?) should tell you what is really going on.   Maybe a chance to play with 
> Snort :)

That's the simplest solution. I never could quite get the hang of The
Pig but I suppose that Ethereal should get it done.
> 
> Regards,
> 
> Antony.

Thanks.
-- 
                            David Cary Hart
Hart's PGP key: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x58A60BB1


