From: capsx <capsx@divx.team.lv>
Subject: POSTROUTING
Date: Wed, 18 Feb 2004 17:08:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40337FD5.5000905@divx.team.lv>
Reply-To: capsx@divx.team.lv
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello!

Is it possible in POSTROUTING as source to specify a chain:

f.e.

iptables -N LOCAL_NET
iptables -A INPUT -i eth1 -s 10.0.0.9 -j LOCAL_NET

iptables -t nat -A POSTROUTING -o eth0 -s LOCAL_NET -j SNAT --to ip.ad.re.ss

-- 

-[capsx]-


