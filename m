From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: SNAT interaction with kernel-based IPSEC (in 2.6)
Date: Thu, 4 Sep 2003 11:34:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPEEFNCIAA.markee@bandwidthco.com>
References: <20030904091525.GO17837@questra.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030904091525.GO17837@questra.com>
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
To: Scott Mcdermott <smcdermott@questra.com>, netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

NAT and IPsec (depending on whether you are using AH or ESP) often do not
play well together.  I suspect your assumptions are correct on what is
occurring.  To solve this problem, I suggest you add a third interface on
your firewall and direct all IPsec packets out if it.  Non-IPsec packets
would then be allowed to go outbound (SNATTED) as normal. This would allow
you to effectively SNAT and use IPsec off the same firewall.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Scott Mcdermott
Sent: Thursday, September 04, 2003 2:15 AM
To: netfilter@lists.netfilter.org; linux-kernel@vger.kernel.org
Subject: SNAT interaction with kernel-based IPSEC (in 2.6)


I'm having some difficulty doing simple pings over an IPSEC
tunnel using the implementation in 2.6.0-test4 (with
Racoon, and successful Phase 1 and 2, I get the IPSEC SA
fine), in combination with iptables.

I have SNAT rules on the same machine that is my IPSEC
tunnel endpoint.  I have RFC1918 IPs on my near side of the
NAT/IPSEC box, which are SNATted to routable IPs in the
normal case (where they don't go over the IPSEC tunnel) and
conntracked.  If they are destined for the remote LAN though
(at other end of tunnel), they need to go through
unmolested: I do NOT want them SNATted when they go over the
IPSEC tunnel, but to instead just bypass the `nat' table
altogether.  Is this possible? I would like them still to
traverse the `filter' table (so I can restrict the remote
LAN), but I would be happy right now if I could get just
bypass iptables altogether.

I am suspecting that when my packets do go over the tunnel,
get to the other end, and are unwrapped, they have the
translated IP as the source, and not the original RFC1918
source IP (which would then allow replies to get routed
correctly back over the IPSEC tunnel to me).  I am awaiting
a reply from the other end on whether or not my suspicion is
true, but in the meantime, I thought I would try to get an
understanding of how the kernel IPSEC implementation and
netfilter interact, and if it's even possible to do what I'm
trying to do (bypass nat rules in the case that the packet
is destined for the tunnel).  Hopefully this is a common
procedure that others have attempted already.

Thanks for any information.  Sorry to crosspost, I am not
sure where to discuss IPSEC issues that regard Netfilter.  I
tried subscribing to netdev, but it seems to just ignore my
subscription emails.



