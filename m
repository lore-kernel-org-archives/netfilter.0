From: Eirik Thorsnes <eirik.thorsnes@fys.uib.no>
Subject: Performance advantage of separate tcp,udp,icmp chains?
Date: Thu, 03 Apr 2003 08:26:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <b6gk5l$rio$1@main.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I'm writing up a bash script with iptables. Thus far my strategy has
been to separate different services into sections that can be switched
"on" or "off" at the top of the script.

My question is whether it is a performance advantage to separate tcp,udp
and icmp traffic near the top of the script to chains handling
tcp-input, tcp-output, udp-input.... and so on.
If so, what do I do with rules that have "all" as protocol (or none
given)? Do I need to have a RETURN rule at the end of each chain?
In addition, should I separate the different interfaces also? That would
give chains like this: tcp-input-eth0, tcp-input-eth1... etc.

Regards,

Eirik Thorsnes



