From: "=?gb2312?B?xe3OrA==?=" <pengwei2004@emails.bjut.edu.cn>
Subject: How to make a mirroring netfiler
Date: Thu, 19 Jan 2006 20:27:10 +0800
Message-ID: <337673630.02343@bjut.edu.cn>
Reply-To: =?gb2312?B?xe3OrA==?= <pengwei2004@emails.bjut.edu.cn>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have mirrored the network traffic on a switch to a switch port which connects a
Linux Box(Redhat 9, one network interface, eth0). I want to anaylis the traffic,
so i set eht0 to promisc mode, open the FORWARD function(echo "1" >
/proc/sys/net/ipv4/ip_forward).
But i cann't see any data in FORWARD chain, how can i do.



