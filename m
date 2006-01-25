From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Tue, 24 Jan 2006 20:16:21 -0500
Message-ID: <20060125011621.GC3805@bostoncoop.net>
References: <20051218055403.002CDA00EA@bostoncoop.net>
	<20051218131621.GC2197@bostoncoop.net>
	<12626109102.20051219163925@wbp.krakow.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <12626109102.20051219163925@wbp.krakow.pl>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm following up on a thread that started at
<https://lists.netfilter.org/pipermail/netfilter/2005-November/063703.html>.

The problem was trying to connect to a SonicWALL VPN through a NAT box
running iptables. Packets went from client to NAT box, then NAT box to
VPN server, then back from the VPN serve to the NAT box, but disappeared
into an abyss somewhere between mangle PREROUTING and nat PREROUTING. The
connection showed up as tracked in /proc/net/ip_conntrack, but tcpdump
showed no packets going out the inward facing ethernet card.

As it turns out, an upgrade to 2.6.15.1 seems to have totally fixed the
problem. I also went through the kernel options one-by-one and turned off
absolutely everything that was not essential for the server. So either
explanation could account for the fix.

People had suspected before that the Debian stock kernel IPSec
functionality was getting in the way; the Debian kernel does come with
IPSec modules but none of them were loaded.

In any case, I thought I'd just post this to put some finality to the
discussion. Thanks for everyone who helped earlier.
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

