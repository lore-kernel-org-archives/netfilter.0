From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Samba "Leak"
Date: Wed, 7 Jul 2004 20:35:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407072035.48484.Antony@Soft-Solutions.co.uk>
References: <1089228185.30076.14.camel@localhost>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089228185.30076.14.camel@localhost>
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

On Wednesday 07 July 2004 8:23 pm, David Cary Hart wrote:

> I cannot figure this out. Our server - running IPTables - has very few
> ports open to input and the default is Drop. While a substantial number
> of 139 and 445 packets show up in the log as rejected, I am seeing a few
> attempts to connect to Samba in the log. These are identified by WAN IPs
> so they are not spoofing localhost or a LAN IP.
>
> I also have INVALID and fragmented packets rejected so that path is
> closed.
>
> So far, nobody has actually gained access, yet it is disconcerting. Any
> ideas how these are getting past the firewall?

So, you have a firewall (routing packets between LAN & Internet), and you also 
have netfilter running on Samba server?

You have netfilter LOGging turned on on the server for these packets - do you 
also have the same LOGging rules on the firewall (so that you would see if 
that's where they were coming from)?

Here are my comments / thoughts:

1. Just because you're seeing WAN addresses doesn't mean they aren't spoofed 
(they could be packets from the LAN, but with external source addresses?)

2. Do you have any wireless involved anywhere, as a means for unknown clients 
to access the network?

3. A packet sniffer / IDS on the external firewall link + the Samba subnet 
(DMZ?) should tell you what is really going on.   Maybe a chance to play with 
Snort :)

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


