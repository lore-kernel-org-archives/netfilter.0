From: Corin Langosch <corinl@gmx.de>
Subject: conntrack
Date: Mon, 15 Mar 2004 22:16:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <373399813.20040315221620@gmx.de>
Reply-To: Corin Langosch <corinl@gmx.de>
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

Hi all,

i used to use iptables conntrack module. as our servers are really
busy and get a lot of connections, we got a lot of errors like
conntrack: table full, dropping packet. due to resource limits
we dont want to increase the conntrack_max limit, its currently
set to something about 32000.

how can we configure iptables so that some ports are excluded
from being tracked? as most connections are incomming on only
around 5 different ports all problems should be solved with
such an option :)

is there anything like iptables --notrack -dport 80 ..?
would be great!!

thanks for any help,
corin


