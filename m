From: Brent Clark <bclark@eccotours.biz>
Subject: --reject-with icmp-host-unreachable VS DROP
Date: Tue, 21 Feb 2006 18:05:09 +0200
Message-ID: <43FB3A35.3000909@eccotours.biz>
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

Hi all

I have a default policy of DROP for the INPUT, OUTPUT AND FORWARD.

I was thinking what just before the end of a FORWARD chain, I would use something like this.

$IPT -t filter -A FORWARD -j -j REJECT --reject-with icmp-host-unreachable
$IPT -t filter -A FORWARD -j DROP

Would anyone be kind to advise me on whether this is ok.

I defianltly think it will slow some applications from continuously retrying.

Kind Regards
Brent Clark

