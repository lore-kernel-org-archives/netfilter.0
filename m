From: Ben Russo <ben@umialumni.com>
Subject: Re: linux router announces bad ip/mac
Date: 06 Nov 2002 09:39:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036593556.1847.3.camel@ben.mis.tnsi.com>
References: <3.0.1.16.20021106084719.230ff560@s-net-04.besancon.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3.0.1.16.20021106084719.230ff560@s-net-04.besancon.org>
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
To: Thierry ITTY <thierry.itty@besancon.org>
Cc: netfilter@lists.netfilter.org

On Wed, 2002-11-06 at 03:47, Thierry ITTY wrote:
> Hello
> 
> I have a linux box (rh 73 out of the box on a P200mmx and 2 accton nics)
> with iptables (1.2.3-1)
....
> 
> OK, now here's the problem I get :
> when the box is in router mode, it answers to ARP requests asking for
> 192.168.1.1 coming on NIC B (sent all from the B side PCs in their normal
> network operation process) with NIC B's mac address. this is fine
> BUT, it also answers to ARP requests asking for 192.168.1.1 coming on NIC A
> (sent all from the A side PCs) with NIC A's mac address. and this is of
> course wrong, because A side PCs then send their routed traffic to the
> linux box (which obviously doesn't handle it) instead of sending it to the
> true router.
> 
> what causes this behaviour (responding on the A side to arp requests which
> it should not answer to) and how can I cure it ?
> 
> tia
...


I have heard of this problem, but never had to deal with it myself and I
don't have time to test it for you, but I have heard that these kernel
settings will solve the problem.

Not sure this will help, but I think it will:
	http://www.linux-vs.org/~julian/bridging.txt

There are dynamically configurable linux kernel parameters like:
	/proc/sys/net/ipv4/conf/all/proxy_arp
    and
	/proc/sys/net/ipv4/conf/all/arp_filter

That might help.



