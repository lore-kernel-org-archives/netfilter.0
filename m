From: Markus Marquardt <markus.marquardt@atosorigin.com>
Subject: ipsec-01-output-hooks / ipsec-02-input-hooks patches vs. 2.6.14
Date: Fri, 18 Nov 2005 16:07:05 +0100
Message-ID: <437DEE19.9090701@atosorigin.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

i've tried to apply the netfilter patches for ipsec-01-output-hooks and 
ipsec-02-input-hooks against kernel 2.6.14.2.

When using patch-o-matic-ng both complained about missing nf_reset. When 
trying to apply them manually, the former applied with some offset & 
fuzz, the latter failed and complained about missing files etc.

Is there any workaround or work-in-progress to make this working on 2.6.14?

Regards,
Markus


