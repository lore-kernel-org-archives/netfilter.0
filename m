From: "Peter E. Fry" <pfry@redsword.com>
Subject: Re: ICMP types to allow
Date: Wed, 21 Dec 2005 10:31:52 -0600
Message-ID: <43a98378.243.910.4543@redsword.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Derick Anderson <danderson@vikus.com>, netfilter@lists.netfilter.org


----- Original Message -----
From: "Derick Anderson" <danderson@vikus.com>
To: <netfilter@lists.netfilter.org>
Subject: ICMP types to allow
Date: Wed, 21 Dec 2005 08:45:04 -0500

> I know that some networks just drop all ICMP to prevent
> traceroutes but recently I've been been seeing problems
> related to fragementation and MTU and wondering if
> dropping ICMP is causing some of that (since
> Fragementation Needed packets can't get through). On the
> flip side of that there's the Source Quench and
> Fragmentation Needed DoS attacks which have recently
> become mildly popular (I've gotten a few hits on Snort but
> not that many). 
> 
> I'd like to hear from the list what ICMP types firewall
> admins are allowing and why - what are the risks for
> allowing certain types vs. the risks of NOT allowing them?

  In Cisco terms, I always allow
"administratively-prohibited", "echo", "echo-reply",
"packet-too-big", "time-exceeded", "unreachable" (I'm too
lazy to pull out the actual types), with appropriate shaping
and rate-limits to avoid killing the small upstream on my
DSL and/or becoming a 1:1 reflector of any significance.  In
ten years (five with ISDN), I've never actually been
seriously attacked through ICMP -- if someone's going to
flood you, they'll flood you, and it'd take one lazy bastage
not to adapt to whatever filters you have in place.  The
most trash I've seen has not been ICMP, but UDP from berserk
M$ virii (in part because I'm a 'Net-nobody and I haven't
gotten the urge lately to hop on IRC and call all of the
2600 types a bunch of wusses who can't touch my mighty DSL).
 Me, I like ICMP -- I find it useful with little
risk/impact.  Your mileage may vary.

Peter E. Fry


