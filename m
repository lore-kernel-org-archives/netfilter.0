From: Brent Clark <bclark@eccotours.co.za>
Subject: would like to use match limit
Date: Tue, 28 Nov 2006 09:35:01 +0200
Message-ID: <456BE6A5.50106@eccotours.co.za>
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

Hey all

I have the following last four rules in my ruleset.

4863  234K REJECT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable
1800 86165 REJECT     udp  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-port-unreachable
0     0 REJECT     0    --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-unreachable
0     0 REJECT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           reject-with tcp-reset


What I was thinking / or hoping to add was the match limit, where by ill match these rules for a certain period, but 
then after that it moves to my default policy, which is DROP.

The question is, would this be a good feasable solution, and b) what would be a good time period (how much burst).

Thanks to those who reply in advance.

Kind Regards
Brent Clark

