From: "David Alexandre M. de Carvalho" <david@di.ubi.pt>
Subject: iptables -L command
Date: Wed, 21 Jun 2006 17:46:59 +0100 (WEST)
Message-ID: <3720.10.0.1.96.1150908419.squirrel@www.di.ubi.pt>
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

Hi !
How can I do something equivalent to "ipchains -L -M" ?
I want to see active masq/nat rules.
iptables -t nat -L is not enough. I need to see active connections.
Thanks !
Best regards
David

