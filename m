From: Daniel David Benson <dan@spoontail.com>
Subject: Re: Leaking ICMP and UDP packets
Date: Mon, 19 Apr 2004 10:08:51 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0404191001531.2276-100000@dudester.spoontail.com>
References: <Pine.LNX.4.44.0404190949530.2276-100000@dudester.spoontail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0404190949530.2276-100000@dudester.spoontail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Gruellich <frank@home.manuelm.org>
Cc: netfilter@lists.netfilter.org


> > I am just curious: does it NAT, too?  (This has nothing to do with your
> > problem, whatever it may be.)

Overlooked this question.  No, the edge router does no natting -- just 
routes.  We block private IPs going in/out the edge router -- that's how 
we handle them, and how we found these packets.  By the way, here's some 
needed version numbers:

iptables: 1.2.8
kernel: 2.4.20-28.8smp (yeah I know -- moving away from RH8 soon)

Outside of these packets, NAT is working fine -- in fact, UDP and ICMP are 
being natted correctly outside of these packets.

Thanks!

-Dan




