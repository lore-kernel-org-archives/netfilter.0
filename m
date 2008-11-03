From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: Another way of doing? --state NEW -j DROP
Date: Mon, 3 Nov 2008 04:00:57 +0100
Message-ID: <20081103030057.GF19842@outback.rfc2324.org>
References: <1225679763.2479.34.camel@sylv>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1225679763.2479.34.camel@sylv>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Anno domini 2008 Sylvan Andrew - NIDS scripsit:

Hi!

>  I am sure this might be an easy answer for someone. Could you please
> enlighten me ?

Let's see. :)

> I am using the rule below to drop any inbound connections into my .0.3
> Class which by default allows any Outbound connections. Plus if the
> connection is already established than those outside connections are ok
> as well.

> iptables -A INPUT -d 192.168.3.0/24 -m state --state NEW -j DROP

> However I am now using a router that doesn't support the -m state
> --state NEW rule.(crappy GUI thing) :-( Could someone please tell me another way using
> iptables to drop any new inbound connections but allow everything else
> outbound and the established connection replys to get back into the .0.3
> Class ? What is the most secure/easiest way ?

So you have to input all your rules via a GUI which does not acceppt
'--state NEW' right?
Asuming yes and the you catched all '--state ESTABLISHED,RELATED'
packet which are/could be answer packets to outbound connections, how
about just leaving '--state NEW' out and DROP'ing all packets
remaining? Obviously after all rules which should accept things.

Nearby:
 DROP'ing unwanted packets IMO is rather bad behavior as it makes
 debugging (possible) network problems a lot harder. If you just
 REJECT packets you don't want (with a appropriate limit) everybody
 knows he is not welcome. So IMO it would be nicer to use
 '-j REJECT --reject-with icmp-admin-prohibited'.

HTH
Ciao
Max
-- 
	Follow the white penguin.
