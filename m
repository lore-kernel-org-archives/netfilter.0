From: wlagmay@yanbulink.net
Subject: Iptables logging problem
Date: Thu, 21 Dec 2006 11:41:19 +0300
Message-ID: <1166690479.458a48af53596@webmail.yanbulink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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



Hi all,

Im using SAME for my NATting example:

-A POSTROUTING -s 192.168.15.0/255.255.255.0 -j SAME --nodst --to
212.xxx.xxx.10-212.xxx.xxx.15

I have tried using the below logging commands:

1. iptables -t nat -I PREROUTING -i eth0 -j LOG --log-prefix "incoming"
--log-level 6

2. iptables -t nat -I PREROUTING -i eth1 -j LOG --log-prefix "outgoing"
--log-level 6

3. iptables -I FORWARD -i eth0 -j LOG --log-prefix "incoming" --log-level 6

4. iptables -I FORWARD -i eth0 -j LOG --log-prefix "incoming" --log-level 6

Either of the above logging command I can log the source IP and the destination
IP, example, source = 192.168.15.35 destination = 209.73.186.238. this is but
what I'm more concern is the NATting portion since 192.168.15.0/24 is my
private IP, I want to also the PUBLIC IP its using before the destination.

Information that I need:
1. Source private IP = 192.168.15.35  <<< this is ok I can see it on the log

2. Source Public IP = ?  <<<< This is the one I'm looking at which I cannot
find, suppose to be from the range 212.xxx.xxx.10 to 212.xxx.xxx.15

3. Destination IP = 209.73.186.238 << this is ok I can see it on the log


Is there a way to log this?

Thank you very much and I hope that you can help me on my problem.

Wennie






