From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: Block LAN DHCP broadcast
Date: Mon, 16 Jul 2007 20:43:55 -0400
Message-ID: <20070717004355.GA13667@animx.eu.org>
References: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
	<1184595437.17688.72.camel@localhost>
	<3130eec50707160738o418b7a9m43f68af0c6a9afe4@mail.gmail.com>
	<1184599806.17688.105.camel@localhost>
	<3130eec50707160907x44cfbcc8u294ffd6118de7e9c@mail.gmail.com>
	<20070716163705.GA11481@animx.eu.org>
	<3130eec50707161010q62a32011p527c11ca9026f07f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3130eec50707161010q62a32011p527c11ca9026f07f@mail.gmail.com>
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
To: Gnarlodious <lists.gnarlodious@gmail.com>
Cc: netfilter@lists.netfilter.org

Please keep list mail on the list.

Gnarlodious wrote:
> On 7/16/07, Wakko Warner wrote:
> >Gnarlodious wrote:
> >> I would need to have another
> >> device on the UPS battery. I want to have only two devices taking
> >> power from the UPS battery, the modem and the server.
> >
> >A diagram might be more helpful.
> http://etc.Gnarlodious.com/Images/Lan1.png

So you have a dsl connection with 3 computers and a wireless router
connected directly to it.  I would assume that you want to keep those 3
computers from getting an IP via DHCP from the dsl modem?  From the
networking perspective, unless the ups is actually networked, has nothing to
do with the network.  (Personally, I would assign a static IP to the UPS).

Does the DSL modem have a built in hub?

From the AP1 you have 2 PCs and another wireless router.  Are these getting
their IP from AP1?

From AP2 you have 2 PCs and nothing else.  Since I don't know the interfaces
on the AP devices, I don't know if they are routing traffic or switching
traffic.

I guess the real question is, does the 4 devices connected (according to
your diagram) directly to your DSL modem have non-private IPs?
(private IP ranges: http://tools.ietf.org/html/rfc1918 section 3).

> >DHCP is broadcast when one requests an IP.  That's why it's D(ynamic)HCP.
> OK, I'm starting to understand that what I want can't be done.
> 
> >The best way I can think of is to have a system (computer, router, whatever
> >running linux) with 2 bridged interfaces and block DHCP traffic going 
> >across
> >the bridge.
> Any page that explains how to set that up? I'm not a network pro...

The man page for ebtables and brctl.  You'll need a linux kernel with
bridging (802.1d support), ebtables enabled (Personaly, I just enable all
the netfilter modules and let the system decide at runtime which onces to
load), the drivers for 2 nics (I used 3c905b cards on a celeron 600 pc,
throughput is around 8-9mb/sec).

> And thanks for the hint about ebtables.

You could probably do it with iptables on a bridging interface, but ebtables
might be easier.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

