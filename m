From: "Andy Samuel" <anci@centrin.net.id>
Subject: --limit 5/m doesn't work
Date: Wed, 23 Mar 2005 09:56:35 +0700
Message-ID: <000001c52f53$ed3f3220$1500a8c0@itasam>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Dear All

I have this rule :
iptables -A INPUT -i eth0 -m limit --limit 5/m --limit-burst 5 -j ACCEPT

When I tried to ping my Linux box from a Windows box, :
ping -t 192.168.12.1 

The reply always come within less than 1 ms.
I'm actually expecting many timeouts because iptables would drop my
package, but the reply always come within less than 1 ms and no timeouts
at all.
Am I expecting something wrong ?

Thank you all in advance.
Andy



