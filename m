From: "Dimitri Yioulos" <dyioulos@firstbhph.com>
Subject: RE: Adding variables to iptables file
Date: Wed, 9 Mar 2005 10:43:34 -0500
Message-ID: <200503091543.j29FhVXV032434@mail1.firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

>that's the classic symptom of kernel & userspace being out of sync. 
>i.e. your kernel has patches applied to it that your userspace iptables
>command is not aware of.
 
OK.  I'm a noob, and that's useful info., tough I wish I hadn't gotten to
that point in the first place :-)
Question:  if I uninstall the current version, and role back to the previous
version, which worked just fine, should I be OK?  There have been a number
of kernel updates since I first installed it from rpm.
 
>when you apply patches from PoM, make sure you specify KERNEL_DIR and
>IPTABLES_DIR and that you then compile the iptables userspace against
>that kernel source tree.
> 
>the error indicates that the conntrack structures of the iptables binary
>and the kernel are different sizes.
 

Thanks for this.  Since I've never used PoM, I'll rtfm and any how-to's
(suggestions?) before moving forward.  Are there any tips/tricks/gotchas you
can suggest?

 

Many thanks!

 

Dimitri

