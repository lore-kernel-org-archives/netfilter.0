From: Torsten Puls <netfilter@pumpum.de>
Subject: iptables -m time does not work
Date: Fri, 01 Nov 2002 14:40:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E187c2V-0001ft-00@kashyyyk.netfilter.org>
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
To: IP <netfilter@lists.netfilter.org>

Hello	

My Problem
After input of dis order I get the following error message:

iptables -A INPUT -m time --timestart 08:00 --timestop 16:00 --days Mon -j ACCEPT
iptables: No chain/target/match by that name

Why? 

Regards

