From: Les Mikesell <les@futuresource.com>
Subject: Re: ip_conntrack_pptp and inbound PPTP/GRE
Date: Thu, 05 Aug 2004 08:08:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091711283.28889.14.camel@les-home.futuresource.com>
References: <Pine.LNX.4.44.0408041734340.21854-100000@e-smith.charlieb.ott.istop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0408041734340.21854-100000@e-smith.charlieb.ott.istop.com>
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
To: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-08-04 at 16:50, Charlie Brady wrote:
> I've struck a problem with inbound PPTP with CVS pptp conntrack and a 
> patched 2.4.18 kernel.
[...]
> The problem is that after establishing the connection, I have two gre 
> conntrack entries. The first one above sees the tunnel traffic, and the 
> timeout value is continually reset. The second one always stays UNREPLIED 
> and times out after 10 minutes. After the timeout, new incoming GRE 
> packets no longer have state RELATED and are blocked.
> 
> Is this a bug, or am I doing something wrong? If nobody is sure, can 
> someone advise how I can proceed?  I'm in the process of enabling the 
> debugging code in the conntrack module.

If this is the kernel used in SMEserver, I think there is a bug in
GRE handling.  I've added CIPE vpns and in some cases try to route
a GRE tunnel between two Cisco routers on private LANs through the
CIPE vpn.  This worked fine with SME versions before 5.6 but now
GRE packets (only) coming from the inside ethernet and routed through
the CIPE interface are SNAT'ed with the outside ethernet IP which
of course keeps them from working.  I always see a conntrack entry
of:
unknown  47 597 src=192.168.254.3 dst=192.168.254.1 [UNREPLIED]
src=192.168.254.1 dst=166.90.87.10 use=1
even though the dst address mentioned was never used and there
is no reason for any association with it (the packets are
static-routed through the CIPE interface address) and I can't
find anything in iptables handling related to this.

The odd thing is that the first remote office upgraded to
5.6 does work but others have the problem above.  I just
haven't been able to pin down the difference or anything
between Upgrade5 or Upgrade6 that might cause it.

---
  Les Mikesell
    les@futuresource.com



