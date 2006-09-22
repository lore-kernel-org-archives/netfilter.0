From: "sundar" <sundar@cynaptix.com>
Subject: iptables rtsp port forwarding
Date: Fri, 22 Sep 2006 16:43:22 +0530
Message-ID: <16920.6906379715$1158923752@news.gmane.org>
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
To: netfilter@lists.netfilter.org

Hi,

I am new to Linux IPTABLES.

I have a windows box ( for Windows Streaming Media Server) behind the
firewall (Iptables). I would like to redirect the external calls to my
windows box for streaming video. But i am not able to configure it since my
player says "your server may not support rtsp protocol"

iptables -t nat -A PREROUTING -i xx.252.1225.27 -p tcp --dport 554 -j DNAT
--to-dest 192.168.1.200:554


please help me in resolve this issue

thanks & regards
sundar


