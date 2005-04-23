From: Ed <netfilter@crazeecanuck.homelinux.net>
Subject: Re: blocking all traffic except selected ports
Date: Sat, 23 Apr 2005 18:36:15 -0400
Message-ID: <426ACDDF.5090604@crazeecanuck.homelinux.net>
References: <a3f524e05042301477b3598d3@mail.gmail.com>	<426A13FB.2030507@crazeecanuck.homelinux.net>	<20050423145444.GA8083@bender.817west.com>
	<426AB6F9.2030808@crazeecanuck.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426AB6F9.2030808@crazeecanuck.homelinux.net>
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

Ed wrote:
> Jason Opperisano wrote:
> 

>>multiport doesn't support ranges, mport does (and it uses a ':' not a
>>'-'):
> 
> 
> Again, tiredness :S (glad you caught that).
> 
> 

Actually (after having a pot of coffee) I just looked at `iptables -m
multiport --help` on my box, and saw the following:


multiport v1.3.1 options:
 --source-ports [!] port[,port:port,port...]
 --sports ...
                                match source port(s)
 --destination-ports [!] port[,port:port,port...]
 --dports ...
                                match destination port(s)
 --ports [!] port[,port:port,port]
                                match both source and destination port(s)


It seems multiport has been updated to use port ranges after all.

(Note to self: don't reply to messages right after waking up either.
UGH! I thought there was a reason that I switched from mport to
multiport on my router...)

https://lists.netfilter.org/pipermail/netfilter-devel/2005-January/017977.html

# uname -r && iptables --version
2.6.11.7
iptables v1.3.1

From http://www.netfilter.org/patch-o-matic/pom-obsolete.html

> iptables mport match
> Author: Andreas Ferber <af@devcon.net>
> Status: Deprecated by 'multiport' version1 in 2.6.11-rcX
> 
> This module is an enhanced multiport match. It has support for byte
> ranges as well as for single ports.
> Up to 15 ports are allowed. Note that a portrange uses up 2 port values.
> 
> Examples:
> # iptables -A FORWARD -p tcp -m mport --ports 23:42,65

The way I understand it, if you're using a Linux kernel that is older
than 2.6.11-rcX, use mport.  Otherwise use multiport.

/me still admits being wrong about the ':' separator, as well as
forgetting about the UDP protocol for DNS though. =)

(Thanks for the nitpicking, J, it really is appreciated.  I don't want
to spread *incorrect* information.)



