From: Jochen Radmacher <jradmacher@gmx.de>
Subject: DNAT possible Bug?
Date: Mon, 27 Jan 2003 18:13:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E35689E.4070604@gmx.de>
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

I'm using a DNAT- Rule to Forward a Port from my Router to my Server:

iptables -t nat -A PREROUTING -d <outsideip> -p tcp --dport 4000 \
-j DNAT --to 192.168.0.44:80

This works fine when I'm connecting from the outside. But If i try:
jr@192.168.0.42# lynx <outsideip>:4000
this does not work. Her is the Output from /proc/net/ip_conntrack:

tcp      6 84 SYN_SENT src=192.168.0.44 dst=<outsideip> sport=33474 
dport=4000 [UNREPLIED] src=192.168.0.44 dst=192.168.0.44 sport=80 
dport=33474 use=1


Jochen



