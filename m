From: KKH <knabberknusperhaus@yahoo.de>
Subject: Settings via init.d lost during runtime
Date: Sun, 25 Jul 2004 19:37:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4103EFC4.9060402@yahoo.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I'm using a suse9.1 box with iptables as router/dump for the other 
machines of mine. custom firewall/nat settings are done by a script that 
is linked by 'rc3.d'. the script is like

#!/bin/bash
IPTABLES='/usr/sbin/iptables -v'
echo "Starting NoIP Client..."
/usr/local/bin/noip2
echo "Done"
[...]
echo "Setting more firewall rules..."
$IPTABLES -I INPUT -p tcp -i ppp0 --dport 1337 -j ACCEPT
echo "Done"
[... Executing more tools ...]


now the weird thing is that all tools run by the script are active while 
the iptables settings are not present when the script finishes . 
iptables does not give any error msg - the rules are simply 
ignored/forgotten/whatever.

any idea whats happening?

regards
kkh




