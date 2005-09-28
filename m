From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: hitcount miss
Date: Wed, 28 Sep 2005 10:02:21 +0200
Message-ID: <433A4E0D.1040303@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

In my ruleset  on my hosted box, I have the following ruleset.

$IPT -N SSH_Brute_Force
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name SSH --set --rsource -j SSH_Brute_Force
$IPT -A SSH_Brute_Force -s $myhomeip -j ACCEPT
$IPT -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j ACCEPT
$IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$IPT -A SSH_Brute_Force -p tcp -j DROP

I thought this would work.

But I cant SSH from any other location, other than from the IP $myhomeip.

What I was looking for, was that when I go on holiday (Thailand here I come). I can still SSH from anywhere else in the world.
But obviously, for the bruteforcers out there, who try and make multiple connections, they will fall to DROP, based on their hitcount.

If anyone could assist, I would be most grateful

