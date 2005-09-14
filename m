From: Jan Eidtmann <cmak_@arcor.de>
Subject: big table tweaks ?
Date: Wed, 14 Sep 2005 14:43:00 +0200
Message-ID: <20050914144300.6ceef8db.cmak_@arcor.de>
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

hello,

i have one kind of big table with 80.000+ rules. its referenced in
INPUT. lookup (when someone wants to connect) is kinda slow and system
hangs noticable (desktop usage). i tried preemptive and non_preemptive
kernels, its all the same. so, is there anything i could tweak to make
this run smooth?

thx in advance,
jan


note: i am not subscribed...

