From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: 2 NICs on same subnet
Date: Fri, 05 Nov 2004 10:32:38 -0500
Message-ID: <1099668758.4891.114.camel@localhost>
References: <20041105123843.GB11016@zion.homelinux.com>
	<20041105124107.GE9379@torres.ka0.zugschlus.de>
	<20041105125421.GA12058@zion.homelinux.com>
	<20041105130424.GF9379@torres.ka0.zugschlus.de>
	<20041105142219.GB12563@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041105142219.GB12563@zion.homelinux.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Fri, 2004-11-05 at 09:22, Sven Schuster wrote:
> Hi Marc,
> 
> On Fri, Nov 05, 2004 at 02:04:24PM +0100, Marc Haber told us:
> > What you intend to do does not make sense.
> >
> > This surely is meant to be a solution to some unmentioned problem. By
> > asking about the problem, I am just trying to give a solution.
> 
> well, I know that it doesn't make much sense. This setup was made to
> "balance" the traffic coming in to the machine. I know that there's
> not much  difference between one NIC running at, say 400 Mbps, or
> two NICs running at 200 Mbps each which will also be 400 Mbps, because
> the machine can't handle more traffic (data (backups) is received via
> network from other machines and written to disks)...but as I've already
> written, this wasn't my decision...
<snip>
Unfortunately, I don't have the time right now to think this challenging
issue all the way through but I'll share my first thoughts.  As they are
first thoughts, they may be completely worthless :-)

Like Alexander, I would think iproute2 could be your friend.  I am under
the impression that some of its features are explicitly to load balance
across multiple NICs on the same interface but I don't recall what gave
me that impression.

You may find some other options outside of routing.  If you have
specific services, you may be able to bind those services to a
particular address.  For lack of a better example, let's assume we bind
Apache to 1.2.3.4 and an Asterisk IP PBX to 1.2.3.5.  You could set up
two different DNS entries for the two sets of services:
web.mycompany.com is 1.2.3.4
pbx.mycompany.com is 1.2.3.5

I'm not sure if that will confuse anything.  Just some raw thoughts.  I
hope they help - John


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


