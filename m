From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Broken MS tcp new not syn: better to REJECT or DROP?
Date: Wed, 29 Jan 2003 13:41:53 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301291326290.29265@dns.toxicfilms.tv>
References: <3E307456.70104@orix.com.au.>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E307456.70104@orix.com.au.>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Crooker <pcrooker@orix.com.au>
Cc: netfilter@lists.netfilter.org

> Hi,
>
> We've a recent install of iptables and came across the broken ms tcp
> problem.
Um, i though new, not syn is a result of a conntrack entry expiry.
Ofcourse besides 'on purpose' packet crafting or scanning, etc.

> I was wondering, would rejecting the packet be faster than
> dropping it for the client?
Well, yes. The client's tcp stack on receiving either the tcp rst or icmp
unreach will inform the applicaton about it. Now it's up to the client's
application (eg. IE) to handle to network error properly.

Anyway dropping the packet will get you nowhere, you'll be waiting as much
as the clients application (or the tcp stack) timeout is. Or the user's
patience is :)

> client will wait for a timeout before sending a proper syn packet.
Really? ms ie sending unproper syn packets? What is so unproper about it?
It must be something else.

> IE too dumb to recognise the reject?
Well, try -j REJECT --reject-with tcp-reset, it will result as IE finding
that the port is closed.

Also this works great for blocking ads in messenger software, just have to
know the ip/port of the ads.

Regards,
Maciej


