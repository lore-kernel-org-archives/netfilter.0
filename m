From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: MARK and routing issue
Date: Thu, 01 Jul 2004 14:23:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088684583.2889.62.camel@axl.seasidesoftware.co.za>
References: <267354A234DF4D46AA6AE56E1240BEF0A48E@tv.wcslnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <267354A234DF4D46AA6AE56E1240BEF0A48E@tv.wcslnet.net>
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
To: Steve Wakelin <steve@wcsl.net>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-07-01 at 01:58, Steve Wakelin wrote:

> I am simply ;-( trying to MARK packets and then route them according to
> the mark.
> 
> [root@localhost sysconfig]# ip rule
> 0:      from all lookup local
> 32760:  from all fwmark 0x6 lookup T4
> 32761:  from all fwmark 0x5 lookup T3
> 32762:  from 192.168.252.1 lookup T2
> 32763:  from 192.168.253.1 lookup T1
> 32764:  from 192.168.252.1 lookup T2
> 32765:  from 192.168.253.1 lookup T1
> 32766:  from all lookup main
> 32767:  from all lookup default

I can't see what you're doing wrong, because I don't understand advanced
routing well enough.  However, this works for me:

ip rule add prio 100 fwmark 1 table 100
ip rule add prio 100 fwmark 5 table 5
ip route add local 0/0 dev lo table 100
ip route default via 172.16.6.2 table 5

Obviously, you don't want that "local 0/0" route, but the point is that,
using table (instead of lookup, which I don't know how to use), I get
mark-based routing that works.

Hope that helps.

Ciao,
Sheldon.


