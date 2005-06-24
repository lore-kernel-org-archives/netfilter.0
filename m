From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 08:26:14 -0500
Message-ID: <200506240826.14769.rob0@gmx.co.uk>
References: <fad9d48405062403562537f546@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad9d48405062403562537f546@mail.gmail.com>
Content-Disposition: inline
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
To: NetFilter <netfilter@lists.netfilter.org>

On Friday 24 June 2005 05:56, Kenneth Kalmer wrote:
> I've built several iptables-based firewalls for some clients and
> personal use. Some of them are horrors, now that I look back on

I can identify with that. :) But none of my firewalls (the ones that 
worked, I mean) were as bad as the ones they replaced.

I was forced to learn iptables, because some of the sites I managed 
couldn't get by with something off-the-shelf. Slowly over the years, 
the light came on for me.

> them... I want to build my own 'all-in-one' firewall for the most
> common network setups I use...

I wrote a pretty simple one aimed at home SNAT/MASQ users. I also wrote 
a grotesque, complex one which tried to implement DNAT support and a 
*relatively* simple config file.

> I've used various other GPL'ed scripts 
> for references in past firewalls and they do tend to open one's eyes

Some of them are good. Some are horrid, ipchains-style, or worse. 
Unfortunately Sourceforge and Freshmeat do not have a "Clue filter" to 
prevent incompetent people from posting their wares.

> a bit, thanks for everyone who released their scripts under the GPL.

Thanks to those who released GOOD scripts. :)

> I understand iptables, so that's covered. I'm constantly researching
> security cause it's so damn interesting to see the precautions some
> people take, and the level of protection you yourself would never
> even have dreamed about...

The nice thing about iptables is that a very strong firewall can be 
quite simple. Deny everything by default, allow in just what you want.

> Now, these are the features (independent of implementation) that I've
> considered to put into my firewall:
> - Support for multiple interfaces on both LAN & WAN

Is this common? It's very complex. I have 3 sites now with dual 
redundant and load-balanced external interfaces. At these sites I've 
abandoned the idea of maintaining a script. I built the initial rules 
with a script and then edited the iptables-save(8) output to suit.

I find this much easier to manage. A slight drawback is that some DNS 
names might resolve to different IP's, and iptables-save uses IP's 
only. But iptables-restore(8) can use hostnames, so I just change them 
in the rules file.

> - NAT & DMZ

Yes.

> - Black lists for inbound & outbound traffic

We don't do much of this. We *do* use DNS poisoning for certain known 
"ratware"/virus domains such as gator.com.

> - Host services (global or per interface, allows seperation between
> LAN & WAN services)

Separation is important. My older firewalls didn't do that.

> - Access control on MAC, IP, or MAC-IP pairing
> - Administrative services (SSH) access control on MAC or MAC-IP
> pairing

I have dabbled in this, but it's not worth a lot of effort. Determined, 
capable attackers can easily bypass this, security through obscurity 
notwithstanding. An incompetent attacker is easily defeated with either 
MAC or IP controls.

> - Managed logging

I do little or no logging, usually only for specific temporary 
debugging. Too much noise, even with --limit.

> - Expansion through custom chains*
>
> * Expansion through custom chains might help those often found
> scenarios that render your standard firewall inoperable. By creating
> say, a PREINPUT chain or POSTINPUT chain, another script can modify
> that chain for any function not covered by the standard firewall
> features.

Even so, misplaced rules could be ignored, or worse, break it. :)

> Please remember, this discussion is intended to be about features,
> not implementation. I'll cross that bridge when I get there...
>
> Any suggestions & advice would be appreciated.

Perhaps I'm not really understanding what you're after. Personally, I 
gave up on the idea of one-size-fits-all firewalls. I haven't been 
there in a long time, but I used to read news:comp.os.linux.networking, 
and the number of users whose problems would be solved by "service 
iptables stop" was very high.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

