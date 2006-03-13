From: "Pedro Drimel Neto" <pedrodrimel@uol.com.br>
Subject: list of ip
Date: Mon, 13 Mar 2006 10:02:52 -0300
Message-ID: <019f01c6469e$70c20b60$2f00a8c0@TRINTASETE>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

How do I make a rule with a lot os ips like

IPS="{192.168.1.2, 192.168.1.50, 192.168.1.55}"

iptables -A INPUT -p tcp -s $IPS -j DROP

Regards.

