From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: problem with (incorrectly?) INVALID packets
Date: Tue, 12 Dec 2006 21:11:20 -0600
Message-ID: <457F6F58.3010005@riverviewtech.net>
References: <200612121942.19276.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612121942.19276.mike@v6.gaima.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 12/12/06 13:42, Mike Williams wrote:
> I'm getting quite stuck with a problem of returning packets not being 
> classified as ESTABLISHED or RELATED (when they get to LFW).
> Below is an attempt at an diagram explaining the setup.

>                |
>             internet
>                |
>            81.1...4.217
>            SDSL Router
>            81.1...7.49
>          (81.1...7.48/28)
>                |        (90.1...1.64/27)
>              switch           /
>        ________/\_________   /
>       |                   | /
>   81.1...7.50        81.1...7.59
>      BFW               bridge
>   192.168.0.1        90.1...1.69
> (192.168.0.0/24)          |
>       |              90.1...1.67
>                          LFW
>                     192.168.136.1
>                   (192.168.136.0/24)

Not the simplest thing in the world, nor is it the most complex.

> In the above diagram 90.1...1.64/27 is routed by the SDSL router to 
> 81.1...7.59, as it can't support more than one range on it's "LAN" side.

Don't you just love SOHO (and the likes) routers that don't have near 
the flexibility that a standard unix box has?  :)

> The bridge has a rule for traffic from 90.1...1.64/27 to go via a default 
> gateway of 81.1...7.49, as it can route to that.

What do you mean by "... bridge has a rule ..."?  What sort of rule are 
you talking about?  Are you referring to a route, or an IPTables rule, 
or an EBTables rule, or something else?  Or is this part of your question?

> Traffic can go in, out, and over LFW just fine.

Good.

> To add a bit more difficultly, the interface on LFW with public IPs is also a 
> bridge, some may remember my question about bridging and NATting, this is the 
> machine which will be doing that.

Do you mean to say that the interface on LFW with the public ip is the 
bridge port (i.e. bri0) of the bridge that contains the 81.1...7.48/28 
and 90.1...1.64/27 networks?

> When I ping things from LFW I get an ICMP redirect to 81.1...7.49, but I don't 
> see anyway I can reach it directly from 90.1...1.67. This is however a minor 
> annoyance.

What "things" per say are you trying to ping?  Where are you trying to 
ping them from?  What IP address is used during your pinging?

This leads me to believe that you don't have your routing set up quite 
right.

> The real problem is when you overlay VPNs onto that diagram (something I gave 
> up trying to draw). There is a tunnel between 192.168.0.0/24 and 
> 192.168.136.0/24.

Ok

> 0.0/24 can do all the things they are supposed to be able to do to 136.0/24.
> 136.0/24 can do all they things they are supposed to be able to do against the 
> internet.
> 136.0/24 however can't do anything to 0.0/24, as the packets coming back from 
> 0.0/24 get blocked by rules designed to stop non-authorised traffic being 
> initiated from 0.0/24 to 136.0/24.

I'll presume that you are talking IPTables rules here.  It sounds like 
there is a slight problem in your rules.

> Pretty much the first rules I have say any ESTABLISHED or RELATED packets get 
> accepted. Which should match these returning packets, and does on the 
> more "normal" firewalls I run.

VPNs make things more complicated.  Depending on which VPN technology 
and / or implementation there of, you may or may not get devices to use 
in your IPTables rules.  The existence or lack there of can complicate 
things.  Usually the lack of the devices means you will have to open up 
your firewall rules on interfaces that the traffic does come in to be 
able to match based on IP address.

> For some reason I have failed to fathom, all the returning packets that come 
> in over any of the VPNs (there are 3), are INVALID not the ESTABLISHED or 
> RELATED they should be.

3 VPNs?  Where are they too?  What VPN technology and version there of 
are you using?  Where do these other VPNs connect to?  What subnets are 
on the other ends of the VPNs?

> Can anyone help?

Can / will you please provide us with some more information to be able 
to help you?  Namely, all the subnets you are trying to connect together 
as well as your full IPTables rules.  You can easily get your IPTables 
rules for us via via iptables-save command.

> (I use fwbuilder to manage and generate my rules, as it has served me well for 
> about 2 years)

Ok.  I can't say as I have ever worked with fwbuilder.



Grant. . . .

