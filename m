From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: ipsec troubles
Date: Fri, 15 Oct 2004 15:30:13 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <0f3101c4b2e5$02c5d130$49caa8c0@caris.priv>
References: <0f2001c4b2e0$cbd8fbb0$49caa8c0@caris.priv>
	<20041015181025.GA7564@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Thanks for the fast reply ...

So you are saying I should use a value of 1440 for X ?
What rule do I apply it too ? (sorry to sound stupid .. brain is fried ..
have been working on this for a long time).

Peter


----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, October 15, 2004 3:10 PM
Subject: Re: ipsec troubles


On Fri, Oct 15, 2004 at 03:00:03PM -0300, Peter Marshall wrote:
> Hi everyone.  I have two firewalls, internal and external.  I have a vpn
> server in the middle on a routeable internet IP address.  The remote vpn
> server is a rh9 linux box.  When I make the local one a rh9 box,
everything
> is great, however when the local one is an openbsd box, I get the
following
> error in my firewall logs on my internal firewall.  Does anyone know what
it
> means.
>
> Note: E.F.G.33 is a routeable internet IP address
>
> Oct 15 14:53:43 radium kernel: FORWARD REJECT IN=eth1 OUT=eth0
> SRC=E.F.G.33 DST=192.168.201.22 LEN=56 TOS=0x00 PREC=0x00 TTL=254
> ID=25774 PROTO=ICMP TYPE=3 CODE=4 [SRC=192.168.201.22 DST=10.0.0.2
LEN=1500
> TOS=0x00 PREC=0x00 TTL=126 ID=18062 DF PROTO=TCP INCOMPLETE [8 bytes] ]
> MTU=1444

ICMP Type 3 Code 4 = Destination Unreachable, Fragmentation Needed and
Don't Fragment was Set.

lower the MTU (or MSS) of your IPSec traffic.  you can do this with the
"-j TCPMSS --set-mss X" target in iptables.

mathematically speaking, the maximum value of X in these situations
would be 1440, derived as:

1500 (MTU of ethernet) - 20 (bytes in IPSec header) = 1480

MSS is defined as MTU - 40; or 1480 - 40 = 1440.

-j

-- 
Jason Opperisano <opie@817west.com>


