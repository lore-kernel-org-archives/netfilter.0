From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Why must I restart Iptables?
Date: Mon, 12 Sep 2005 20:30:27 -0500
Message-ID: <200509122030.28040.rob0@gmx.co.uk>
References: <5.0.2.1.2.20050912172705.01d82d60@shawmail.cg.shawcable.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.0.2.1.2.20050912172705.01d82d60@shawmail.cg.shawcable.net>
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
To: netfilter@lists.netfilter.org

On Monday 2005-September-12 19:50, frayn@shaw.ca wrote:
> Ok, first off I'm new to Netfilter and Iptables.
>
> I've setup an old computer running linux to act as a firewall. It has
> access to the net. On my internal network I have a Win 98 machine
> connected to my linux box/firewall also with access to the net.

Superb way to learn a whole lot, if that is your ultimate goal, but I 
think Slackware would be a better choice than Fedora. Slackware does 
less for you, and you quickly learn how to RTFM and edit configuration 
files and scripts.

That's not a Fedora flame BTW. :) A competent Fedorist can do anything 
that a competent Slacker can do. It's just probably harder for a 
beginner to get to that point on Fedora. OTOH it might be easier to get 
some things working quickly, without really understanding why and how 
they work. It's a tradeoff.

> I used firehol to start out with to set up my iptable rules. I then
> saved the iptable rules and disabled firehol.

I don't know firehol so I can't say, but it sounds right so far. You 
saved the rules like this: "iptables-save > /etc/sysconfig/iptables", 
correct? I guess so, given what you said below.

> When I boot my linux box I see the message "Applying iptable firewall
> rules". From the linux box I can ping the external (internet) and the
> internal networks.
>  From my Win 98 machine I can ping the linux box, but not the
> internet.
>
> If go to etc/rc.d/init.d  and do a ./iptables restart
> everything works fine.   (using RedHat Fedora)

So there's a workaround for you, albeit a bit ugly ...
    echo "service iptables restart" >> /etc/rc.d/rc.local
(Check out service(8), which is a handy frontend for those init.d 
scripts. See also chkconfig(8) for management of services per 
runlevel.)

> It took me a while to get to this point. Everything seems to be
> working the way I want. I'm just trying to figure out why I must
> restart Iptables for the rules to work?

This is primarily an OS issue, not a netfilter one. Something in the 
Fedora scripts is working as designed, but not as expected. :) 2 months 
ago we had a poster here who found a similar issue with PPPoE. The pppd 
was apparently loading a different set of iptables rules.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

