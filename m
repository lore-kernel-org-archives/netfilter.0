From: Jason Opperisano <opie@817west.com>
Subject: Re: Fw: Problem with CONNMARK
Date: Fri, 29 Oct 2004 08:54:15 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1099054455.2986.66.camel@hubcap.ljm.dom>
References: <002701c4bd79$589838c0$2a245cc2@cea05>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002701c4bd79$589838c0$2a245cc2@cea05>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-10-29 at 01:37, Tomek Macioszek wrote:
> Hi!
> I have problems with use target CONNMARK. When I type command :
> iptables -j CONNMARK -h
> output gives me  information that iptables is compiled with this options, 
> but when I use command like this i.e.:
> iptables -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
> system couldn't do this. It write to me :
> iptables: No chain/target/match by that name
> 
> My system: FEDORA 2
> KERNEL: 2.6.5 ( compiled with target CONNMARK)
> IPTABLET: v 1.2.9.
> What is wrong wiht it??
> Sorry for my English
> Best regards
> Tomek 

it means the "iptables" command (/sbin/iptables) on FC2 has been
compiled with awareness of the CONNMARK target, but your kernel does not
have support for it
(ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/ipt_CONNMARK.ko)

you need to grab patch-o-matic from:
http://netfilter.org/files/patch-o-matic-ng-20040621.tar.bz2

and follow the instructions.  a summary:

        cd /path/to/pom
        export KERNEL_DIR="/path/to/kernel_src"
        export IPTABLES_DIR="/path/to/iptables_src"
        ./runme pending
        ./runme extra/CONNMARK
        cd $KERNEL_DIR && make menuconfig [...]
        cd $IPTABLES_DIR && make && make install

-j

-- 
Jason Opperisano <opie@817west.com>


