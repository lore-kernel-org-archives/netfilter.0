From: "Hwang, Byoung Woo" <bwh@net-safe.co.kr>
Subject: TCM MSS control over OUTPUT chain
Date: Sat, 3 May 2003 11:36:53 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c3111c$db9d9540$100aa8c0@bwhwangnotepc>
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

Hi, all
I tried to control the size of TCP MSS but failed by
following command. I have a reason to contorl TCP MSS size on OUPUT
chain
not FORWARD chain.

iptables -A OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss
1400

I potentially conclude that the above command has no effect.

How can I control the TCP MSS on OUTPUT chain?

Reguards,
Hwang, Byoung Woo



