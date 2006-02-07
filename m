From: Mark-Walter@t-online.de
Subject: how to clear kernel routing chains / iptables
Date: Tue, 7 Feb 2006 10:24:44 +0100
Message-ID: <20060207092444.GA3439@marschmellow.homeunix.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

a howto from Russel describes a reboot clears all created chains
concerning the kernel routing.

So I tried this but it's not working:

$IPTABLES -F 		# flush aller chains (Tabelle filter)
$IPTABLES -X 		# delete all userdefined chains
$IPTABLES -t nat -F 	# flush aller chains (Tabelle nat)

All chains are deleted (iptables -L) but my routing is not working
properly while using masquerade.

How can I overcome this problem to avoid a reboot while using iptables ?

-- 
Best Regards, 

Mark 

