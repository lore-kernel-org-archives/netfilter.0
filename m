From: "John Black" <black@arbbs.net>
Subject: ip aliasing
Date: Sat, 18 Jun 2005 19:08:54 -0500
Message-ID: <003c01c57463$157942e0$3822a141@alpha>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

i'm trying to setup my firewall to do ip aliasing.  i have two private ip 
address that i would like aliased.

if i run the command:
ifconfig eth0:0 10.10.10.11 (public address) netmask 255.255.255.0

then in my firewall script i have:
    iptables -t nat -A PREROUTING -d 192.168.180.181 -i eth0 \
                -j DNAT --to-destination 10.10.10.11

is this right?  since eth0 is the address connecting the firewall to the 
internet?

thanks
john 


