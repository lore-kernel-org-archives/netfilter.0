From: Kevin <kmg952@bigpond.com>
Subject: Re: SYN packet "disappears"
Date: Fri, 28 Apr 2017 12:55:48 +1000
Message-ID: <9574980.6JjInWLu8z@giles>
References: <1538022.l5gG4X5sYW@giles> <adf6ae74-e152-a88f-d721-51f82f799534@pobox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <adf6ae74-e152-a88f-d721-51f82f799534@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

On Friday, 28 April 2017 11:00:57 AM AEST Robert White wrote:
> On 04/27/17 05:21, Kevin wrote:
> > (... DROP rules and a tun+ device but virtually no rules that ACCEPT the
> > packet so it can get into the tun+ device ...)
> So you've got these policies...
> 
> > $IPT -t filter   --policy INPUT       DROP
> > $IPT -t filter   --policy FORWARD     DROP
> > $IPT -t filter   --policy OUTPUT      DROP
> 
> And you've got these post TUN/TAP decode rules
> 
> > $IPT -A INPUT   -i tun+ -s 999.999.999.999 -j ACCEPT
> > $IPT -A FORWARD -i tun+ -s 999.999.999.999 -j ACCEPT
> > $IPT -A OUTPUT  -o tun+ -d 999.999.999.999 -j ACCEPT
> 
> But you've got no
> 
> $IPT -A INPUT -i ethX (Whatever the tunnel needs) -j ACCEPT

As I indicated in my original message, the rules I included were only the 
initial rules in my configuration. My question was not so much why my VPN was 
not working as expected by what happened to the packet. Why were the no log 
entries on the mangle and filter input chains?

As per my previous message, that has been explained. I did not know about the 
rp-filter mechanism. Those expected log entries now appear.

And, for the record, I did try with all chain policies as ACCEPT.

Cheers,
Kevin
