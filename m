From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Samba "Leak"
Date: Wed, 7 Jul 2004 23:03:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407072303.51085.Antony@Soft-Solutions.co.uk>
References: <1089228185.30076.14.camel@localhost> <200407072035.48484.Antony@Soft-Solutions.co.uk> <1089237164.30076.23.camel@localhost>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089237164.30076.23.camel@localhost>
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

On Wednesday 07 July 2004 10:52 pm, David Cary Hart wrote:

> On Wed, 2004-07-07 at 15:35, Antony Stone wrote:
> >
> > Here are my comments / thoughts:
> >
> > 1. Just because you're seeing WAN addresses doesn't mean they aren't
> > spoofed (they could be packets from the LAN, but with external source
> > addresses?)
>
> ??

I can't think of a good reason why, but it seems quite possible to me that 
some Trojan / malware on an internal machine might generate packets with 
false source IPs?

I was just trying to think up an explanation for you seeing packets on your 
LAN with public IPs which didn't come through your firewall...

> > 2. Do you have any wireless involved anywhere, as a means for unknown
> > clients to access the network?
>
> Yes. Security is through the MAC of the client card. It's hard coded for
> our two cards. Encryption is still a challenge for MadWifi. I assumed
> that only the MAC of the router is sent out with packets.

Most Access Points are operated as bridges; therefore the MAC addresses will 
be the real MAC addresses of the communicating devices - you will never see 
the MAC address of the AP on packets unless someone is communicating with it 
directly (eg: SNMP?).

> > 3. A packet sniffer / IDS on the external firewall link + the Samba
> > subnet (DMZ?) should tell you what is really going on.   Maybe a chance
> > to play with Snort :)
>
> That's the simplest solution. I never could quite get the hang of The
> Pig but I suppose that Ethereal should get it done.

Yup - ethereal listening on both an external and an internal interface should 
do a perfectly good job.

Regards,

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


