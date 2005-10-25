From: Askar Ali <askarali@beaconet.net>
Subject: Allowing ping
Date: Tue, 25 Oct 2005 22:32:42 +0500
Message-ID: <435E6C3A.20709@beaconet.net>
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

hi list,

        I have a very simple question, presently we are blocking icmp 
"ping" on our servers. But as far I can userderstand its not very good 
practice or providing a good security by blocking ping request. see one 
can ping www.xyz.com and get the reply back.

However Before allowing ping "echo-request" I just want to confirm 
whether doing ...

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

would be enough or doing some rate limiting would be better?

Any help in this regard  will greatly appreciated.

regards

Askar Ali

