From: "John Hill" <jhill@noach.com>
Subject: Iptables 2.4.x kernels
Date: Fri, 11 Mar 2005 12:36:44 -0500
Message-ID: <200503111736.j2BHaiZ1016306@commserver.noach.com>
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

Should I consider iptables to be dropping 2.4.x kernel support?

I have yet to compile iptables successfully since 2.4.26 and 1.2.11. I get a
MUTEX error. This was addressed by a patch (sent to me in email) but a
permanent fix has failed to make the kernel and the iptables code. The new
2.4.29 and 1.3.1 still does it. I also had segmentation errors with
shorewall after applying the patch to 2.4.28 and 1.3.0. I gave up without
looking into the problem further hoping the new kernel and iptables would
fix it. It has not.

Thanks

--john


