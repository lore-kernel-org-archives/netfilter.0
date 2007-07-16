From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: Block LAN DHCP broadcast
Date: Mon, 16 Jul 2007 12:37:05 -0400
Message-ID: <20070716163705.GA11481@animx.eu.org>
References: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
	<1184595437.17688.72.camel@localhost>
	<3130eec50707160738o418b7a9m43f68af0c6a9afe4@mail.gmail.com>
	<1184599806.17688.105.camel@localhost>
	<3130eec50707160907x44cfbcc8u294ffd6118de7e9c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3130eec50707160907x44cfbcc8u294ffd6118de7e9c@mail.gmail.com>
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

Gnarlodious wrote:
> On 7/16/07, Thomas Jacob wrote:
> >What makes you think that your router passes
> >on DHCP requests?
> Because computers connected to the modem will obtain a Linksys DHCP
> range, and computer's connected to a Linksys router may obtain a modem
> DHCP.
> 
> I have a DSL modem/router at the terminal end of a chain of Linksys
> routers, and the modem is not very configurable. I need to block DHCP
> at the Linksys so the modem is invisible to the routers. I tried
> disabling DHCP on the modem, but it has a server running from it and
> the server requires DHCP to be running. I could let the router handle
> the server's DHCP request, but then I would need to have another
> device on the UPS battery. I want to have only two devices taking
> power from the UPS battery, the modem and the server.

A diagram might be more helpful.

> Any help to solve this problem with software would be greatly
> appreciated. These routers are Linksys WRT54GL with BusyBox v1.6.0 and
> iptables v1.3.7.
> 
> >On the contrary, one usually does have to put in
> >a bit of effort to allow dhcp over routers (=> dhcp relay)...
> In the BusyBox setup, DHCP broadcast is on by default, and apparently
> a little hard to disable.

DHCP is broadcast when one requests an IP.  That's why it's D(ynamic)HCP.

From what it sounds like, you have several routers attached to the same
network as the dsl modem.  There's really no way to stop DHCP across that. 
The best way I can think of is to have a system (computer, router, whatever
running linux) with 2 bridged interfaces and block DHCP traffic going across
the bridge.  I did this at work with a spare PC so that my part of the
network would see my BOOTP server and not the DHCP server that is also on
the network.  (HINT, use ebtables!)

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

