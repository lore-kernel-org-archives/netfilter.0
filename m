From: Jason Opperisano <opie@817west.com>
Subject: Re: Patching only one patch from pom-ng
Date: Tue, 26 Oct 2004 00:02:31 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098763351.5877.26.camel@hubcap.ljm.dom>
References: <20041026034059.GA5563@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041026034059.GA5563@legolas.on.net.mk>
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

On Mon, 2004-10-25 at 23:40, Damjan wrote:
> Hi all,
> I'm using the qnet patch for the Linux kernel, but I need to add the
> "ipt_random" support from pom-ng to it.
> 
> So my question is, how do I add the "ipt_random" patch to the 2.6.9-qnet
> tree?

the generic answer to the question, "how do i apply just the random
patch from POM" is:

export KERNEL_DIR="/path/to/kernel_src"
export IPTABLES_DIR="/path/to/iptables_src"
./runme pending
./runme base/random
cd $KERNEL_DIR && make menuconfig [...]
cd $IPTABLES_DIR && make && make install

you should always apply the pending patches from POM to avoid any
unforeseen weirdness...  to apply a single patch, use the "./runme
suite/patch-dir" syntax, where the suite may be ascertained from the
patch-dir/info file.

now for the part that you don't want to hear--as far as i know, the
random patch is 2.4-only...it certainly is in patch-o-matic-ng-20040621,
and appears to remain that way in CVS from a quick perusal of:

http://cvs.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/random/

i.e. there is no "linux-2.6" directory in there.

-j

-- 
Jason Opperisano <opie@817west.com>


