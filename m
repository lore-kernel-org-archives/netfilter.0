From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: /sbin/iptables -vnxL OUTPUT
Date: Wed, 3 Mar 2004 22:31:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040303213113.GG757@home.manuelm.org>
References: <20040302170849.GD757@home.manuelm.org> <18196.1078334024@www39.gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <18196.1078334024@www39.gmx.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Mario Ohnewald <mario.Ohnewald@gmx.de>  3. Mar 04:
> Hi,

Hello,

> I call this default policy at the beginning of my script (actually
> SuSEFirewalls script):

It doesn't matter, when you call it.  Packets traverse chains from top
to bottom.  The 'bottom' is the default policy.  (Well, it's listed on
top, but you know what I mean.)

> $IPTABLES -F INPUT
> $IPTABLES -F OUTPUT
> $IPTABLES -F FORWARD             2> /dev/null
> $IPTABLES -P INPUT "$DROP"
> $IPTABLES -P OUTPUT "$ACCEPT"
> $IPTABLES -P FORWARD "$ACCEPT"     2> /dev/null
> $IPTABLES -F
> $IPTABLES -X
> $IPTABLES -t nat -F
> $IPTABLES -t nat -X
> $IPTABLES -t mangle -F
> $IPTABLES -t mangle -X
> 
> so why am i "-j ACCEPT" accepting it before that?

In these scrambled outputs I did not wanted to sort again was a
match-any-rule with -j ACCEPT in your OUTPUT (it isn't set here).  So
never a packet reached the bottom (policy) of your OUTPUT.

Please RTFM,
 regards, Frank.
-- 
Sigmentation fault

