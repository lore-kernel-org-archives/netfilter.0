From: Askar <askarali@gmail.com>
Subject: what is --set-mes 128
Date: Thu, 13 Jan 2005 09:50:11 +0500
Message-ID: <a0f69e505011220501c9284b@mail.gmail.com>
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

Hello,

can someone help mevto understand these rules...

$iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 128
$iptables -t nat -A PREROUTING -p tcp --tcp-flags SYN,RST SYN -j
TCPMSS --set-mss 128

Secondly is there any benefit of changing TOS of packets going out i-e...


$iptables -A OUTPUT -t mangle -p tcp --dport http -j TOS --set-tos
Maximize-throughput

any help will be greatly appreciated.

regards

Askar

-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

