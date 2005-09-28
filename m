From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: Re: multi-isp connection NAT not working
Date: Wed, 28 Sep 2005 14:27:03 -0500
Message-ID: <1127935623.32641.19.camel@tholian.starken.com>
References: <1127926307.32641.17.camel@tholian.starken.com>
	<200509281324.11170.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509281324.11170.rob0@gmx.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

Actually I've abstracted it in a script and the function name adds "ip",
just wasn't watching when I copy/pasted :(

I'll take a look, thanks.
Dan


On Wed, 2005-09-28 at 13:24 -0500, /dev/rob0 wrote:
> On Wednesday 2005-September-28 11:51, Daniel Wittenberg wrote:
> > I think this is a simple problem, but nothing I've read so far seems
> > to help, maybe I'm missing something.
> 
> A serious typo?
> 
> > route add default via {ISP-1-gateway} table T1 dev eth0
> > rule add from {ISP-1-ip} table T1
> > rule add fwmark 1 table T1
> 
> Prepend "ip " to those.
> 
> > iptables -t mangle -A PREROUTING -i eth0 -j MARK --set-mark 1
> 
> ok
> 
> > route add default via {ISP-2-gateway} table T2 dev eth1
> > rule add from {ISP-2-ip} table T1
> > rule add fwmark 2 table T1
> 
> Again prepend "ip " and s/T1/T2/
> 
> > iptables -t mangle -A PREROUTING -i eth1 -j MARK --set-mark 2
> >
> > Any ideas?
> 
> I use and recommend Julian Anastasov's routes patch. Usage is explained 
> in http://www.ssi.bg/~ja/nano.txt , the patches are linked from the 
> parent directory. IWFM at 3 sites.

