From: Jason Opperisano <opie@817west.com>
Subject: RE: Adding variables to iptables file
Date: Tue, 08 Mar 2005 20:37:12 -0500
Message-ID: <1110332232.4814.10.camel@hubcap.ljm.dom>
References: <200503082250.j28MoZra020800@mail1.firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503082250.j28MoZra020800@mail1.firstbhph.com>
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
To: netfilter@lists.netfilter.org

On Tue, 2005-03-08 at 17:50, Dimitri Yioulos wrote:
> This may not be related, but I'm also getting this error.  

it's not.

> I upgraded from
> iptables-1.2.8-12.3 to iptables-1.2.11-3.2 on a CentOS 3.4 box.  I created
> the new version from src.rpm.  Now, when I fire off iptables, I get the
> "error at line 2", which in my iptables is nat, and iptables fails to load.
> Further exploration and experimentation shows that when I try to load
> iptable_nat.o, I get symbol errors.  However, when I run a iptables script I
> created, despite a little complaining, iptables does load.

that's the classic symptom of kernel & userspace being out of sync. 
i.e. your kernel has patches applied to it that your userspace iptables
command is not aware of.

> Any help to get this fixed (which hopefully helps the OP, too) would be
> greatly appreciated.

when you apply patches from PoM, make sure you specify KERNEL_DIR and
IPTABLES_DIR and that you then compile the iptables userspace against
that kernel source tree.

the error indicates that the conntrack structures of the iptables binary
and the kernel are different sizes.

-j

--
"The lesson is: Our God is vengeful! O spiteful one, show me who to
 smite and they shall be smoten!!!"
	--The Simpsons


