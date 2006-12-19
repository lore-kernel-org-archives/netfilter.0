From: Adhiraj <adhiraj@linsyssoft.com>
Subject: dev->hard_start_xmit() and dev->poll()
Date: Tue, 19 Dec 2006 16:17:32 +0530
Message-ID: <1166525252.3422.12.camel@triumph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi all,

Can dev->hard_start_xmit() and dev->poll() be called parallely inside
the kernel (may be on 2 different processors)?  Kernel takes care that
no two xmits run in parallel. I am not sure about an xmit and poll
running in parallel.

Thanks,
Adhiraj.


