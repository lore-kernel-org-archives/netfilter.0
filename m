From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 15:15:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087326912.2055.26.camel@localhost>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
	 <1087322336.2054.12.camel@localhost>
	 <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
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
To: Jonathan Villa <jvilla@e37.net>
Cc: netfilter@lists.netfilter.org

On Tue, 2004-06-15 at 14:41, Jonathan Villa wrote:
> > I'm not doing exactly what you are doing but I do use full subnets for
> > both source and destination and it works fine for me.  What do you see
> > that makes you believe it is not working? - John
> > --
> > John A. Sullivan III
> > Chief Technology Officer
> > Nexus Management
> > +1 207-985-7880
> > john.sullivan@nexusmgmt.com
> > ---
> > If you are interested in helping to develop a GPL enterprise class
> > VPN/Firewall/Security device management console, please visit
> > http://iscs.sourceforge.net
> >
> >
> 
> Access is denied.
> 
> I have more information now.
> 
> Here is the background:
> A machine running MySQL is to be locked down for access only to a select
> group of people working from home and people at the office, hence the
> xx.xx.xx.0
> 
> I've noticed that the script works fine for anyone who is not on the
> network but for those who are, well the rules block access to them all the
> time.
> 
> I have something similar to the following
> 
> ALLOWIPS="array of ip addresses"
> 
> for ip in $ALLOWIPS;
> do
> $IPTABLES -A INPUT -p tcp --dport 3306 -s $ip -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 80 -s $ip -j ACCEPT
> done
> 
> then I had the rules from my original post
> 
> $IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 80 -s xxx.xxx.xx.0/24 -j ACCEPT
> 
> the ips in the loop are fine, but then ips on the same network were being
> blocked regardless of my rules.  That is why I thought that it was the
> syntax...
> 
> I have added 5 ips which are on the same network as the server to the
> array ALLOWIPS and they get denied access while the other ips are granted
> access.
> 
> so then I tried taking them out of the loop and doing them individually,
> still no access.
> 
> Could it be because they are on the block?  Do I need to specify that the
> interface is -i eth0 or something instead of specifying -s ip
> 
> example
> 
> use:
> 
> 
> $IPTABLES -A INPUT -p tcp --dport 3306 -i eth0  -j ACCEPT
> 
> vs
> 
> 
> $IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
> 
> 
> but then my question is, I only have one nic, so won't everything that is
> not from lo come from eth0?
> 
> -very confused
Hmmm . . . that is very confusing.  It should work which makes me think
something else is going on.  I would suggest it is time to do a little
tracing to find out where the problem really is.

I would suggest that the first order of business be ensure that the
packets are making it to the MySQL server.  One could enable all traffic
and see if you are still denied (if so, a good sign that the packets
never make it there in the first place) or, if that is impractical or
you really want to be sure, put a protocol analyzer on the line (e.g.,
http://www.ethereal.com).  If the server is on a switch, you can either
insert a hub, use port mirroring or use ettercap
(http://ettercap.sourceforge.net) to insert yourself into the packet
stream.  If you do not see the packets arriving, we know the problem is
somewhere else in the network.

If the packets arrive at the MySQL server, then I would start placing
log rules at various points in the iptables rules set to see where the
packets are dropped.  If they are not dropped before the ACCEPT rule,
then see if they are still in the chain after the ACCEPT rule (in which
case something is wrong with the match portion of the rule).  If not,
they have been ACCEPTED and are either being DROPped or mangled in
another POSTROUTING chain or, more likely, there is an application layer
problem.

Regarding interface versus subnet, it depends on which you fear most!
The interface allows you to add new subnets and they will all be allowed
based upon port regardless of IP.  If that kind of free access scares
you, then restrict it to specific addresses and subnets (which seems
like it is what you want to do anyway).  The downside there is that you
must change the rules for any subnets or addresses you later add.  If
that kind of maintenance scares you, go back to allowing everything from
the allowed ports on the interface.

Hope this helps - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


