From: jorge alonso <livebrain@gmail.com>
Subject: iptables & ifconfig wrong packet accounting
Date: Mon, 13 Dec 2004 06:21:34 +0000
Message-ID: <c65016fb041212222114c8a41f@mail.gmail.com>
Reply-To: jorge alonso <livebrain@gmail.com>
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

i'm trying to do traffic accounting with iptables but the received
packets from iptables (iptables -L -v) and packets from ifconfig dont
match.
ifconfig counts more packets is it normal ?

