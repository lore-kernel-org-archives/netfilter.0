From: Simon <dev@networker.co.nz>
Subject: A replacement for rp_filter with iptables (config help needed)
Date: Thu, 30 Jun 2005 16:24:51 +1200
Message-ID: <42C37413.3010504@networker.co.nz>
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

Hi There,

We are debian sarge with two ethernet cards.. To get eth1 (on a seperate 
subnet) working correctly, ive had to change 
/proc/sys/net/ipv4/conf/eth1/rp_filter to 0. Now i need a simple 
solution to protect against spoofing attacks on this interface... I have 
an example setup, but i want to make sure i have it correct.. can 
someone confirm for me?...

Note, this was a small script to block the mysql port on the server, but 
then enable for certain time/ip dynamically by adding/removing chains.

iptables -F
iptables -A INPUT -i lo -j ACCEPT
iptables -N MYSQL
iptables -N SPOOF
iptables -A INPUT -p tcp --dport 3306 -j MYSQL
iptables -A SPOOF -i eth1 -j SPOOF
iptables -A INPUT -p tcp --dport 3306 -j REJECT --reject-with tcp-reset

Is this correct - or have i got it ALL wrong.

Thanks

Simon

