From: Matt Brei <mbrei@carolina.rr.com>
Subject: Routing a VPN.....confused
Date: Sat, 13 Dec 2003 21:24:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071368662.3630.37.camel@Psycho>
Reply-To: mbrei@carolina.rr.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

Hi all,

I'm trying to set up a VPN with my buddy back in Chicago.  We're both
using iptables to nat our Internet connection to the rest of the LAN and
filter out all the naughtiness on the cable modem connection.  So far,
we've tried FreeS/WAN on the iptables routers, but as soon as we start
the ipsec service, it kills the Internet connection.  

Now I know this sounds like a FreeS/WAN problem, and it probably is, but
the mailing list seems to be down, and the netfilter people are great,
so I'm asking you.  Hopefully someone can give me some advice, or point
me in another direction. 

Is the ipsec service supposed to block the rest of the Internet?  If
this is supposed to happen, is there a way to stop it or will we need to
use 2 machines with public IP addresses?  Provided we can get the VPN
working, is there a way to use iptables to nat the VPN connection to the
rest of the LAN?  Basically we would like to use a PC with iptables and
whatever ipsec software just like you would use a Cisco PIX.

Thanks for your time,
Matt


