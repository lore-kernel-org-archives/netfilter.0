From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables rules for cups printer discovery
Date: Fri, 15 Aug 2008 10:21:12 -0500
Message-ID: <48A59EE8.8090709@riverviewtech.net>
References: <19894-78618@sneakemail.com> <48A4DD48.3080004@riverviewtech.net> <alpine.LNX.1.10.0808142150080.25617@fbirervta.pbzchgretzou.qr> <48A4E340.1090305@riverviewtech.net> <alpine.LNX.1.10.0808142202380.25617@fbirervta.pbzchgretzou.qr> <30978-20009@sneakemail.com> <alpine.LNX.1.10.0808150912130.27140@fbirervta.pbzchgretzou.qr> <19140-74447@sneakemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <19140-74447@sneakemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 09:17, Stephen Isard wrote:
> Ok!  Now I find the printers.  (I also had to stick -j ACCEPT at the 
> ends of the lines.  You were probably taking that for granted.)

Good!

> Assuming you really mean that last "not", then my description
> seems to apply.  So if a bad guy knew how take advantage of udp 
> broadcasts to arbitrary high numbered ports, he could sit there waiting 
> for a cups broadcast and then send his evil packets from his port 161 to 
> whichever of my ports he wanted.  Fortunately, such broadcasts will not 
> be very frequent, since once the printers are discovered, there is no 
> need to rediscover them until something changes.  But still it would be 
> better to match the broadcast port number.  A new feature?

If you are worried about someone else spoofing an IP in your recent 
list, look in to the --rttl option to have the recent list remember the 
TTL values of packets and require them to be the same.  This way if some 
jerk off who is more hops away from you is trying to pretend to be you, 
his traffic will appear to be at a different TTL than yours.  This is 
not fool proof, but it will sure help reduce the risk of exposure that 
you are referring to.



Grant. . . .
