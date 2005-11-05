From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: How to drop an isp
Date: Sat, 05 Nov 2005 15:49:36 -0600
Message-ID: <dkj9dh$h9r$1@sea.gmane.org>
References: <436CBBFB.1070101@nycap.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <436CBBFB.1070101@nycap.rr.com>
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
To: netfilter@lists.netfilter.org

Dave Handler wrote:
> Greetings!
> 
> Sorry if I worded my subject wrong, it's the best I could do!
> 
> Ok, I'm on Fedora Core 3, running iptables 1.2 (which seems to be 
> holding its own).  Logwatch sends me my logs every morning and I see 
> people trying to tap in to tcp port 25.  I do lookups on the addresses 
> and they all seems to be coming either from Taiwan or China.  A few in 
> Europe and every once in while one from the US.
> 
> I've been googling around for how to block them.  I'm rather green to 
> iptables and some of the options confuse me.  Is there a way I can block 
> the whole ip from me?  I'll paste in a section where there where 
> accepted packets:
> 
> Accepted 327 packets on interface eth0
>  From 69.21.138.231 - 169 packets to tcp(22)
>  From 70.86.208.18 - 6 packets to tcp(25)
>  From 72.36.128.42 - 6 packets to tcp(25)
>  From 202.107.195.52 - 128 packets to tcp(22)
>  From 207.150.176.81 - 16 packets to tcp(25)
>  From 219.133.247.226 - 1 packet to tcp(25)
>  From 219.134.232.31 - 1 packet to tcp(25)

First of all, most of those packets (the 169 and the 128) are to
port 22 (ssh) not port 25 (smtp).  The port 22 traffic is a much
bigger security concern.

Are you running an SMTP server that accepts mail from the outside
world?  If so, you need to accept connections from anywhere that
might want to send you legitimate email.  If not, you can close off
incoming port 25 at the firewall.

Are you running sshd and intentionally accepting ssh connections
from the outside?  If not, you can block the port 22 traffic.  If
you need to accept ssh connections, you are getting into a whole
'nother area of security concerns that is mostly outside the scope
of firewalls, though you might use firewall filtering if there is
a fairly limited scope of IP addresses from which you want to
accept connections.

Another puzzling thing is that the default firewall setup in FC-3
(from system-config-securitylevel) keeps all incoming ports closed
except for those you explicitly open.  Before rolling your own
firewall, you might want to take a look at the default
configuration and build upon that.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


