From: Stephen Satchell <list@satchell.net>
Subject: Re: Iptables and bridge
Date: Mon, 16 Feb 2004 22:55:17 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077000917.9435.6.camel@ssatchell1.pyramid.net>
References: <003001c3f59a$ba6dc2b0$15a02bca@Rangga>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003001c3f59a$ba6dc2b0$15a02bca@Rangga>
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
To: Adi <kristiadi_himawan@dtp.net.id>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-02-17 at 13:12, Adi wrote:
> Hi,
>  
> Does anyone ever try traffic accounting using iptables (ipac-ng) in at
> linux bridge?
> I have try using iptables -t mangle -A PREROUTING -j ACCEPT, but when
> i see the
> bytes counter using iptables -t mangle -nL -vx, it shown 0. 
> But acctually the traffic already flow from eth0,eth1and br0, 
> i monitoring by the traffic using tcpdump and iptraf.

Yes.  What I do is use accounting when I have blocked a spammer from
using mail to/from the servers behind my layer-2 firewall.  Everything
is selected by raw interface in the FILTER section.  It's been effective
to demonstrate when a person who has been guilty of spamming before is
possibly starting to spam again.

I haven't played with MANGLE in the layer-2 firewall, but then again my
whole purpose for having one of those beasts is to offload our CISCO
7500 routers and provide some very specific protection for Windows
systems.  I run a mostly-closed firewall for them, and ever since I did
that we have had far fewer problems with them.

Satch



