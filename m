From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: Re: state table not working
Date: Mon, 21 Jun 2004 08:48:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087825693.5497.1.camel@hawk.wittenberg.org>
References: <Pine.LNX.4.33.0406211129530.31871-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406211129530.31871-100000@blackhole.kfki.hu>
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
To: netfilter@lists.netfilter.org

On Mon, 2004-06-21 at 04:38, Jozsef Kadlecsik wrote:
> On Fri, 18 Jun 2004, Daniel Wittenberg wrote:
> 
> > tcpdump I won't be able to get until it fails again, but it's
> > 2.4.22-1.2188.nptl (did it with kernel-2.4.22-1.2174.nptl too).
> 
> First I'd make sure the server truly responds to the client request
> *and* the packet is missed somehow by netfilter. That'd mean to run
> tcpdump on the interface facing to the server so that the relevant packets
> could be captured.

Yeah, I've been running tcpdump/ethereal on the external interface to
make sure.  If I drop iptables/restart firewall, everything works just
fine.

> 
> 2.4.22 is pretty old. Is there any patches applied from patch-o-matic?

No, this is the latest, stock Fedora Core 1 kernel.

Dan


