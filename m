From: "Peter E. Fry" <pfry@redsword.com>
Subject: Re: [OT] New router with NIC (4-port HUB) recommandation
Date: Sun, 13 Feb 2005 04:19:39 -0600
Message-ID: <420ED55B.19131.35ACE7D@localhost>
References: <20050213083054.GL16546@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
In-reply-to: <20050213083054.GL16546@freenet.de>
Content-description: Mail message body
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
To: netfilter@lists.netfilter.org
Cc: Michelle Konzack <linux4michelle@freenet.de>

On 13 Feb 2005 at 9:30, Michelle Konzack wrote:

> Hello all,
> 
> I am installing a new Router and have some problems with the NIC's,
> because I need to much  :-) 
> 
> I have 4 ADSL-Modem Router (4 IP's, each 8 MBit/512 kBit) which I like
> to connect to one (!) NIC. Because of lacking place for an external
> HUB/Switch I like to buy a NIC with a 4-port-HUB inside.
> 
> Can anyone recommand such 100 MBit NIC ?
> (I do not have very much money curently)

  Now there's a voice from the past.  OK, a year or two.
  Hmm.  As Andrew said...  I've heard of applications where folks 
need a single MAC and/or IP, so the hub card is nice.  But yours 
sounds like four independent links, so a true quad NIC should work as 
well.
  There must be actual drivers for some of the switch chipsets as 
well, to support devices like the LinkSys 802.11 boxes -- where you 
can tag the internal port for four independent links.  More versatile 
than a quad NIC, but other than that, not terribly useful.
  I'd personally go for a quad NIC, just because I used a bunch back 
in my LRP days.  I'd send you one, but I gave them all away long ago -
- I'm down to a crusty old Compaq dual TLAN.  (If you were looking 
for ATM, FDDI, ATM, DS3, more ATM, an old Alpha, or some other 
useless junk, I could help.)  Quad NICs are all over eBay here, but 
they don't seem to be as common in Europe.  And the hub NICs are 
cheap, and some folks have had success with 'em.
  Best o' luck.

Peter E. Fry


