From: Jason Opperisano <opie@817west.com>
Subject: Re: ipsec troubles
Date: Fri, 15 Oct 2004 14:44:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015184450.GA7688@bender.817west.com>
References: <0f2001c4b2e0$cbd8fbb0$49caa8c0@caris.priv>
	<20041015181025.GA7564@bender.817west.com>
	<0f3101c4b2e5$02c5d130$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0f3101c4b2e5$02c5d130$49caa8c0@caris.priv>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 03:30:13PM -0300, Peter Marshall wrote:
> Thanks for the fast reply ...
> 
> So you are saying I should use a value of 1440 for X ?
> What rule do I apply it too ? (sorry to sound stupid .. brain is fried ..
> have been working on this for a long time).
> 
> Peter

you would add a new rule that matches your outbound VPN
traffic...something along the lines of (this is 2.4 and *swan biased):

  iptables -A FORWARD -i $INSIDE_IF -o $IPSEC_IF -p tcp --syn \
    -j TCPMSS --set-mss 1440

from my own personal experience--i use lower values than 1440, but 1440
is the mathematical maximum you can use...so that's your starting point.

-j

-- 
Jason Opperisano <opie@817west.com>

