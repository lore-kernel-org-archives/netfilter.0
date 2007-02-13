From: Steve Brueckner <steve@atc-nycorp.com>
Subject: RE: Troubleshooting SNAT
Date: Tue, 13 Feb 2007 15:05:42 -0500
Message-ID: <60D45469A1AAD311A04C009027B6BF68060E9D20@SERVER20>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Well naturally I shot myself in the foot by not giving everyone the full
info.  Careful readers will notice that I'm executing a Xen kernel, and
indeed if I was in a Xen domU (guest VM) then my problem would have been
truly mystifying.  However, I am executing in dom0 (the VMM domain), which
has a somewhat more complicated view of system networking.  Specifically,
there are bridges and virtual interfaces.  I think my problem is arising
because bridges operate at the MAC level and not the IP level.  So right now
I'm looking into ebtables to fix my problem.  I'll report back if/when I
figure it out entirely.

Steve Brueckner, ATC-NY

