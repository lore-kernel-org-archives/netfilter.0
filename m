From: netfilter@lgh3812534.vittran.norrnod.se
Subject: Problem with NAT and ipsec (freeswan)
Date: Fri, 29 Oct 2004 21:49:20 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0410292141120.628@lgh3812534.vittran.norrnod.se>
Reply-To: netfilter@lgh3812534.vittran.norrnod.se
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

I have a linux box (redhat 9.0) that I want to use for NAT and VPN tunnel.
The netfilter setup is very simple, just this line:
iptables -t nat -A POSTROUTING -s 192.168.167.0/24 -o eth1 -j
SNAT --to my_external_ip

Everyting works fine and the linux box does nat for internal subnet. But
when I start ipsec (freeswan) (service ipsec start) nat stops forwarding
packets.

Any tips?


