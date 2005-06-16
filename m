From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: multiport
Date: Thu, 16 Jun 2005 18:26:52 +0300
Message-ID: <1118935612.16084.16.camel@debianbox>
References: <1118930391.16084.2.camel@debianbox>
	<20050616141652.GA27648@bender.817west.com>
	<200506160957.17356.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200506160957.17356.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

Maybe a misconception from my part here, please correct me:

When you want to block an IP from connecting to the internet, should i
use: 
iptables -A INPUT -i $INTERNAL -s 192.168.1.2 -j DROP
or 
iptables -A FORWARD -i $INTERNAL -s 192.168.1.2 -j DROP or both?

since the firewall is set to the gateway, then any client will try to
connect to the IP of the gateway to then establish a connection with the
site needed, if i already block that IP to connect to my NIC via the
INPUT chain, then there is no need for me to DROP in FORWARD, or is it
the other way around? 


correction,
i want to drop MSN to all 172.168.3.* to /24 should be used since
172.168.2.* should be able to connect to MSN.



On Thu, 2005-06-16 at 09:57 -0500, /dev/rob0 wrote:
> On Thursday 16 June 2005 09:16, Jason Opperisano wrote:
> > On Thu, Jun 16, 2005 at 04:59:51PM +0300, Sadus . wrote:
> > > iptables -A INPUT -i eth1 -s 172.16.3.0/16 -p tcp -m multiport !
> > > --destination-port  20,21,80,443 -j DROP #USERS
> > >
> > > which basicaly means if source is in 172.16.3.0 then drop all
> > > except for HTTP,FTP,HTTPS. that's in order for that IP range to not
> > > be able to connect to Instant Messenging services such as MSN, AIM,
> > > Yahoo etc... while keeping other IP ranges be able to use them.
> >
> > unless you're trying to keep them from connecting to MSN, AIM, Yahoo
> > etc on your firewall vs. hosts on the internet, you want those rules
> > in FORWARD, not INPUT.  also, it's often much more logical to
> > explicitly allow what you want and then deny everything else vs.
> > using negation in your rules.  so *i* would do this:
> >
> >   iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> >   iptables -A FORWARD -i eth1 -p tcp -s 172.16.3.0/16 \
> >     -m multiport --dports 21,80,443 -j ACCEPT
> >
> >   iptables -A FORWARD -i eth1 -p tcp -s 172.16.3.0/16 -j DROP
> 
> Minor additions here. First be aware of the CIDR specification, as it 
> might not be what you want:
> # iptables -vA INPUT -s 172.16.3.0/16
>   all opt -- in * out *  172.16.0.0/16  -> 0.0.0.0/0
> It takes you up to the /16 which contains 172.16.3.0. The written 
> description sounded like you wanted 172.16.3.0/24 (172.16.3.0-255.)
> 
> Jason properly left out the --dport 20 because it's used outbound. You 
> will need the ipt_nat_ftp module to NAT FTP connections.
> 
> > keep in mind that most messenger apps (i know msn does this) will
> > connect to a proxy at microsoft over port 80 if its default port (TCP
> > 1863) is blocked.  the proper way to stop this is to force all TCP
> > port 80 traffic through an application-level proxy such as squid.
> 
> Right again. It's VERY difficult to block MSN in particular. If you're 
> serious about it you need to keep an eye on their servers and block 
> them by IP. I did it once, but they are a moving target. My blocks are 
> probably no longer effective (except for the transparent HTTP proxy.)
> 
> 'Net censorship is not an easy thing. I think it's more effective to 
> deal with human issues in human terms. I do what the management wants 
> me to do, but when they ask for things like this I tell them what I 
> think of it. :)
-- 
Sadus . <sadus@swiftbin.net>
Swiftbin.net


