From: mailinglists@belfin.ch
Subject: RE: TTL target
Date: Sun, 3 Nov 2002 19:15:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <31347F3CE518D6118ACB00A0246AD0560B2411@mx.snizek.ch>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: 'Cedric Blancher' <blancher@cartel-securite.fr>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


> > + iptables -t mangle -A PREROUTING -i eth1 -j TTL --ttl-inc 1
> > iptables: No chain/target/match by that name
> > modprobe ipt_ttl is in my script.
> > According to 
> > 
> http://cert.uni-stuttgart.de/archive/usenet/comp.os.linux.secu
> rity/2002/08/m
> > sg00458.html
> > there should be two ttl modules in
> > /lib/modules/2.4.18-4GB/kernel/net/ipv4/netfilter/.
> > ipt_TTL for the target
> > ipt_ttl for matching.
> > ipt_TTL isnt in the modules directory.
> [...]
> > System is Suse 8.0, Kernel 2.4.18, iptables 1.2.25
> 
> You have to build your kernel and last iptables version (1.2.7a) using
> patch-o-matic. TTL target is not yet part of mainstream.

By when do you expect it to be mainstream?

Philipp

