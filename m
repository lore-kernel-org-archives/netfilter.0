From: "Bc. Miroslav Kopecek" <kopecek@email.cz>
Subject: Connlimit problem k2.6.18.2 , ipt1.3.7
Date: Fri, 9 Mar 2007 18:59:05 +0100
Message-ID: <00fd01c76274$a089c3e0$3464000a@oksystem.local>
Reply-To: kopecek@email.cz
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
   I have Debian Sarge 3.1 testing, compiled kernel 2.6.18.2 and actual
iptables 1.3.7 compiled and installed

I need to solve problem with full ip_conntrack on my router. One client with
some agressive P2P makes ip_conntack full. So I need to limit connections
per that IP address

I can't add connlimit rule? What's wrong? Any suggestion?

-----------------------------------------
iptables -m connlimit -h
connlimit v1.3.7 options:
[!] --connlimit-above n         match if the number of existing tcp
connections is (not) above n
 --connlimit-mask n             group hosts using mask

-----------------------------------------
RouterBM:/home/kopecek# iptables -A FORWARD -p tcp -s 10.88.99.71 -m
connlimit --connlimit-above 300 --connlimit-mask 32  -j REJECT --reject-with
tcp-reset
iptables: No chain/target/match by that name

RouterBM:/home/kopecek# iptables -A FORWARD -p tcp -m connlimit
--connlimit-above 300 --connlimit-mask 32  -j REJECT --reject-with tcp-reset
iptables: No chain/target/match by that name

RouterBM:/home/kopecek# iptables -A FORWARD -p tcp -m connlimit
--connlimit-above 300 --connlimit-mask 32  -j DROP
iptables: No chain/target/match by that name



