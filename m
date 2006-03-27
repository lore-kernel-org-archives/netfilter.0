From: Brent Clark <bclark@eccotours.co.za>
Subject: REJECT --reject-with icmp-host-unreachable vs DROP
Date: Mon, 27 Mar 2006 10:47:25 +0200
Message-ID: <4427A69D.6010702@eccotours.co.za>
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

Just something I would like to pick someones brain with.

If I use the default policy of drop, BUT at the end of the chain use the following

$IPT -t filter -A FORWARD -j REJECT --reject-with icmp-host-unreachable

Would that be ok, or does is another ICMP message I can reply back with.

Reason I ask this is because I find that by using the default policy (DROP), some applications keep retrying to make a
connection etc.
Where as this approach, seems to slow things down (I stand to correction on this).

If someone could maybe help me understand this or assit I would be most grateful.

Kind Regards
Brent Clark



