From: "Javier Govea" <jgovea@magma.ca>
Subject: Re: Round Robin Load Balancing
Date: Sat, 26 Jul 2003 14:07:33 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307261807.h6QI7Xg2022883@webmail1.magma.ca>
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
To: netfilter@lists.netfilter.org

Hi to all, 

Well, i was able to fix my problem with "modprobe ipt_MASQUERADE" and "depmod -a". The
solution (perhaps not the best one): to rebuild the whole kernel again...and to rebuild
all modules (including the Nth module, which was the one i really neede to test). I was
only rebuilding the modules, and i guess there was a mistmatch between my modules and the
kernel. Anaway, that problem is fixed....

Cheers...
X

> On Wed, Jul 23, 2003 at 08:58:32PM -0400, Javier Govea wrote:
> > modprobe: Too deep recursion in module dependencies!
> > modprobe: Circular dependency? ip_nat_core ip_nat_proto_udp ip_conntrack ip_tables
> > ipt_MASQUERADE
> > Aborted (core dumped)
> > 
> > how do i fix this??????
> > 
> Just trying to understand, did you point iptables to the kernel source
> you custom rolled?
> -- 
> Jerry M. Howell II
> 

