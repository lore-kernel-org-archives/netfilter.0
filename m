From: =?ISO-8859-1?Q?Gerard_Par=EDs_Aixal=E0?=
	<gerard.paris@estudiants.urv.cat>
Subject: Filtering MAC addresses and Multicast
Date: Tue, 01 Aug 2006 10:35:50 +0200
Message-ID: <44CF1266.5090109@estudiants.urv.cat>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I have a strange problem using iptables that had been reported yet in 
this list two years ago, but it has not been solved: 
http://lists.netfilter.org/pipermail/netfilter/2004-October/056506.html

I emulate a MANET on an Ethernet by adding iptables rules like these 
(filtering at MAC layer):

/sbin/iptables -t mangle -A PREROUTING -m mac --mac-source 
00:06:5B:12:C9:7A -j DROP
/sbin/iptables -t mangle -A PREROUTING -m mac --mac-source 
00:06:5B:13:4A:69 -j DROP

These rules drop Unicast traffic but they do not drop Multicast traffic.
How can I fix it?

Thank you in advance
Kind regards,
Gerard

