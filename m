From: Frank Gruellich <frank@home.manuelm.org>
Subject: Re: Leaking ICMP and UDP packets
Date: Mon, 19 Apr 2004 18:31:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040419163159.GE10272@home.manuelm.org>
References: <Pine.LNX.4.44.0404190914120.2276-100000@dudester.spoontail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0404190914120.2276-100000@dudester.spoontail.com>
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

* Daniel David Benson <dan@spoontail.com> 19. Apr 04:
> I essentially have everything go out as a global nat,

What exactly is you rule?

> but every now and then a tcpdump on the frontside interface is showing
> some ICMP and UDP packets not getting natted.

What exactly do you tcpdump?  (Cmdline, please.)  What exactly is the
output of it?

> Anyone ever seen this before?

No.

> It's not a major deal as we are are having our front edge router
> handle these ugly packets, but I'd like to tighten it up.

I am just curious: does it NAT, too?  (This has nothing to do with your
problem, whatever it may be.)

 Regards, Frank.
-- 
Sigmentation fault

