From: "Robert Czechonski" <mlody@elpec.com>
Subject: connlimit problem
Date: Wed, 14 Jul 2004 11:37:06 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3470.80.51.249.26.1089797826.squirrel@www.elpec.com>
Reply-To: mlody@elpec.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello
I have kernel 2.4.25 and iptables 1.2.11. When I typed:

iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 80 -j REJECT

The system pesponded:

iptables v1.2.11: no command specified
Try `iptables -h' or 'iptables --help' for more information.

Anyone can tell me what did I wrong?
-- 

Robert


