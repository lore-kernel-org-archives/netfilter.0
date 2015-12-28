From: Misterke <netfilter@quintux.com>
Subject: Re: Problems with bridge+router setup
Date: Mon, 28 Dec 2015 21:59:56 +0100
Message-ID: <b574dcf038177fbbc8f8ea2baeff61fd@vpn.quintux.com>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com>
 <20151227142118.27861ea5@playground>
 <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com>
 <5681128F.5090203@plouf.fr.eu.org>
 <e6259eb987cf9fb4d54fdf3b44ecac86@vpn.quintux.com>
 <5681839F.4080801@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5681839F.4080801@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 2015-12-28 19:46, Pascal Hambourg wrote:

> I am not saying to use VLAN tagging. I am asking whether the
> communication between the cable modem and the TV box over the LAN 
> uses
> VLAN tagging, because I have seen it with a triple-play provider, and 
> in
> that case it is easy to identify which packets must be bridged : 
> those
> with a VLAN tag.

Ah, sorry for the misunderstanding.  Is there any way I could find out?
The supplier (Telenet) isn't communicating much on what it is doing 
between
its Set-Top_Boxes and the cable-modem, but putting them behind a router
does break the interactive functions (and hence also video-on-demand).

>> Would passing all ARP requests and broadcast frames be dangerous 
>> from a
>> security point-of-view?
>
> It depends what your security requirements are. Beyond security, it
> could disrupt normal operations of the hosts on the network.

Well, my security needs are pretty simple: nothing from the Internet 
(so
the cable-modem) should be able to get to anything on a host of type A
(unless being forwarded through iptables of course).  But I'm pretty
paranoia ...

When I now think about it, I guess this will never be 100% safe: 
possibly
the cable-modem could be hacked and since the B client (digital STB) is
directly reachable from the cable-modem, that one could also be 
compromised
and then just giving it an extra IP address within my LAN range, would
allow access to the LAN ...  Perhaps I need to rethink the original 
idea
completely ...  I assume setting up a VLAN for the B clients could
address this, but then I would need something more complex than a 
simple
switch near the clients, correct?

Thanks,
K
