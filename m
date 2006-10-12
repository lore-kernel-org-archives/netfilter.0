From: Brent Clark <bclark@eccotours.co.za>
Subject: -j ROUTE vs marking and then forwarding
Date: Thu, 12 Oct 2006 14:34:14 +0200
Message-ID: <452E3646.6050804@eccotours.co.za>
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

Hi

Im still in a state of uncertainty on this question, as I have not performed routing with -j ROUTE before, but getting a glimpse of ROUTE did make me wonder
about effiency / speed.

So my question is.

Would anyone know if there is a difference or which is the faster of just routing via just using -j ROUTE --oif as opposed to

a) marking the packets (-j MARK --set-mark 0x1) and then
b) using FORWARD.

Kind Regards
Brent Clark

