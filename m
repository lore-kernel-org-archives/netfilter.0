From: Michael Weiser <michael@weiser.dinsnail.net>
Subject: Re: Match packet address against addresses on interface
Date: Sun, 12 Feb 2017 13:43:32 +0100
Message-ID: <20170212124332.GE2935@weiser.dinsnail.net>
References: <20170211171321.GC31183@weiser.dinsnail.net>
 <568f0d90-e6e6-f1ac-4d9b-27b3b21438da@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <568f0d90-e6e6-f1ac-4d9b-27b3b21438da@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi Pascal,

On Sun, Feb 12, 2017 at 09:59:14AM +0100, Pascal Hambourg wrote:

> > is there an elegant way in either ip{,6}tables or nftables to match
> > addresses in packets against all the addresses set on a specific local
> > interface?
> For the interface the packet is coming in or going out, maybe with the
> iptables 'addrtype' match.

A first test with a rule like

iptables -I OUTPUT 1 -p tcp --dport 22 -m addrtype --src-type LOCAL -j ACCEPT

looks very promising: Allowing out only packets with source addresses
actually assigned to a local interface (tested with hping3 -u -p 22 -a
7.7.7.7 192.168.2.1). If you don't hear from me again, my question is
answered. :)

The thing for dummies like me to note about this is that addrtype
doesn't deal with predefined classes of addresses but the actual state
of things on the interfaces present in the system. Consequently LOCAL
doesn't mean RFC1918 addresses or somesuch but addresses actually
assigned to local interfaces.
-- 
Thanks!
Michael
