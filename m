From: Askar <askarali@gmail.com>
Subject: MARKing question
Date: Mon, 31 Jan 2005 15:29:32 +0500
Message-ID: <a0f69e5050131022966942181@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

hi list, 

I'm MARKing packets in PREROUTING of mangle with the below rule to
route them from other route then the default route .(iproute2 +
iptables)

$iptables -A PREROUTING -i eth0 -t mangle -s 202.xxx.xxx.0/24 -d 0/0
-p tcp --dport 80 -j MARK --set-mark 4

What I want is to exclude a single IP from the above to be MARKed, i-e
the particular IP packets goes through default route of the firewall
machine not through iproute2 route.

Is this possible with iptables or I have to apply pom (extentions) to
accomplished this?

regards

Askar

(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

