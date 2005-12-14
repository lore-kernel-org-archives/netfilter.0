From: Andreas Bayer <angel_azrael@gmx.de>
Subject: problems with masquerade
Date: Wed, 14 Dec 2005 09:13:52 +0100
Message-ID: <200512140913.52746.angel_azrael@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi,

i try to route several protocols through a vpnc connection to my university. 
Masquerade works fine for the outgoing packets. But all packets from the 
university which should be redirected to my PC are delivered localy on my 
server.

My config shows like:

UNI............ --- Internet --- my Router ---Server (eth0). --- PC
Cisco VPN ==================== vpnc (vpnlink)


iptables -A PREROUTING -t mangle -p tcp -d [UNI.UNI.0.0]/16 --dport 22 -j MARK 
--set-mark 3

iptabeles -A POSTROUTING -t nat -d [UNI.UNI.0.0]/255.255.0.0 -o vpnlink -j 
MASQUERADE

iptables -A FORWARD -i vpnlink -s !  [UNI.UNI.0.0]/16 -j DROP

/sbin/ip rule add from  [UNI.UNI.0.0]/16 to [UNI.UNI.0.0] /16 table 103 pref 
32762
/sbin/ip rule add fwmark 3 table 103 pref 32753
/sbin/ip route add default dev vpnlink table 103

Did i something wrong or/and have can i fix it?

thanks

