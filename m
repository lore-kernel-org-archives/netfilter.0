From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: wireless security
Date: Thu, 10 Jun 2004 11:26:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040610182609.GA23024@ranjeet-pc2.zultys.com>
References: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0b5b01c44ee2$f2e7cef0$49caa8c0@caris.priv>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

* Peter Marshall (peter.marshall@caris.com) wrote:
> Hi guys,
> 
> I am sure someone has been faced with this problem, and I was just wondering
> what the possible solutions are.  A city wide free wireless network has just
> expanded to cover the area encompassing our building.  The provider of this
> is also the provider of our Internet (via fiber).  It was decided that it
> would be advantageous for some of our employees to be able to use this
> wireless network when we bring in clients etc.  This of course opens a large
> possibility of problems concerning crap getting onto our network (especially
> if they are connected to wireless and plugged into the network).
> 
> We have made it a policy that a personal firewall be installed on all
> firewalls, and that at no time is a wireless card to be plugged into a
> laptop while connected to our LAN.  This of course does not do much for
> internal cards ....
> 
> Is there anyway at all that I can firewall this ?  Or is there a way o
> prevent the two networks from being active at the same time .. I am at a bit
> of a loss here.
> 
> Thank you all,
> Peter
> 
> 
> Peter Marshall, BCS
> Network Administrator, CARIS
> 115 Waggoners Lane, Fredericton NB, E3B 2L4 CANADA
> Phone:  (506) 458-8533 (Reception)
> 
> 

1. Firewall - between corporate and YOUR ISP.
2. Firewall & anti-Virus on EVERY client that uses the public City-ISP.
(ZoneAlarm comes to mind as the easiest/best solution on windows)
3. Snort your network at all times.
(IDS = Intrusion Detection System)
(IPS = Intrusion Prevention System)

4. Assuming the use of laptops, if I were you, I'd allocate one SEPERATE
room/area which is the only place where access to the public city-ISP
is allowed.

5. This way, there is no possibility of anyone "forgetting" to remove the
intranet cable while using the wireless city-ISP.
You KNOW that some people will "try" to or get into the "habit" of plugging
into both networks at the same time, cos it is easier to break the rules than
to follow them. If you make it mandatory for them to physically move to a
seperate room for city-ISP, and this room does not have any corporate cable
drops, you've addressed 90% of the problem. I am assuming that people with
wireless corporate access have ONE pccard and can use it EITHER to be a part
of corporate n/w OR a part of city-ISP.

OR

5. You could throw a WiFi access point (AP) into this seperate room, which
will allow wireline ethernet access, and ban ALL other wifi access, corporate
or city-ISP.

The remaining 1% of stubborn people who cause 99% of the problems, you 
beat into submission using the 800-page corporate policy handbook. :)

HTH

-- 
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye at Zultys dot com
http://www.zultys.com/
 
The views, opinions, and judgements expressed in this message are solely those of
the author. The message contents have not been reviewed or approved by Zultys.


