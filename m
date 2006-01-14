From: Ishwar Rattan <ishwar@pali.cps.cmich.edu>
Subject: Bridge rule info?
Date: Sat, 14 Jan 2006 16:53:32 -0500 (EST)
Message-ID: <Pine.LNX.4.56.0601141648560.28674@pali.cps.cmich.edu>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a debian based Linux box connected to dept LAN
with iptables running. I am interested in eth0 and tun0
bridge (br0) on this box. If I remove the firewall first and
then set up the bridge, it works as promised. If the firewall
is brought up the bridge stops. So, I am looking for a
way for bridge and firewall to work together.

Any ideas?
-ishwar


