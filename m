From: john decot <johndecot@yahoo.com>
Subject: iptable for single nic for mutiple ips.
Date: Sun, 24 Jul 2005 19:29:06 -0700 (PDT)
Message-ID: <20050725022907.89819.qmail@web42403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello all,
 i am facing a problem in iptables as follows:
  i have  single nic which ip is eth0= x.x.x.x(public_ip)
    alias is  eth0:1=y.y.y.y( private_ip)
the proxy works when ip of server and port 3128 at lan connection is configured at client side(windows os).
But doesn't work without that whenever i flow traffic to proxy server, again i have used ip tables as:
 
iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j REDIRECT 3128
 
with above it doesn't work then i tried following

iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j DNAT  $public_ip or $private_ip:3128
 
again the same result.
client pc and server is connect at same switch. and clients have private ip where as server has public as well as private ip.

any help will be appreciated.
 
thanks in advance.
john


		
---------------------------------
 Start your day with Yahoo! - make it your home page 
