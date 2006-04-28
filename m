From: "Sergey Dorofeev" <sergey@fidoman.ru>
Subject: iptablet DNAT rule
Date: Fri, 28 Apr 2006 12:47:02 +0400
Message-ID: <009701c66aa0$51f6fad0$151010ac@prodo.ru>
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

Hello.

Cannot understand logic of such rule:

172.16.16.1 has rule
[0:0] -A PREROUTING -d 172.16.16.1 -p udp -m udp --dport 6400:6419 -j
DNAT --to-destination 172.16.16.14:6400

But only some packets pass through it:

(172.16.16.1)
12:14:33.197569 IP 172.31.255.10.59130 > 172.16.16.1.6409: UDP, length:
8   -- this packet rejected
12:14:33.197613 IP 172.16.16.1 > 172.31.255.10: icmp 204: 172.16.16.1 udp
port 6409 unreachable
12:14:33.416206 IP 172.31.255.1.51908 > 172.16.16.1.6400: UDP, length: 1464
12:14:33.427087 IP 172.31.255.14.53870 > 172.16.16.1.6413: UDP, length: 312
12:14:36.619363 IP 172.31.255.9.51978 > 172.16.16.1.6409: UDP, length:
6   -- and this passed

(172.16.16.14)
12:18:35.349735 IP 172.31.255.7.49988 > 172.16.16.14.6400: UDP, length: 120
12:18:36.973405 IP 172.31.255.1.51908 > 172.16.16.14.6400: UDP, length: 1464
12:18:37.171828 IP 172.31.255.9.51978 > 172.16.16.14.6400: UDP, length: 1128
12:18:38.215781 IP 172.31.255.3.55501 > 172.16.16.14.6400: UDP, length: 360
12:18:39.549072 IP 172.31.255.8.50953 > 172.16.16.14.6400: UDP, length: 72
12:18:42.405602 IP 172.31.255.4.49547 > 172.16.16.14.6400: UDP, length: 408
12:18:42.973790 IP 172.31.255.1.51908 > 172.16.16.14.6400: UDP, length: 1464
12:18:43.392740 IP 172.31.255.12.52400 > 172.16.16.14.6400: UDP, length: 456
12:18:44.974014 IP 172.31.255.1.51908 > 172.16.16.14.6400: UDP, length: 1464
12:18:44.984748 IP 172.31.255.14.53870 > 172.16.16.14.6400: UDP, length: 312
12:18:48.177249 IP 172.31.255.9.51978 > 172.16.16.14.6400: UDP, length:
    -- here it is

What's wrong?

# uname -a
Linux gw.prodo.ru 2.6.16.5 #5 SMP Fri Apr 21 15:32:34 MSD 2006 i686
GNU/Linux
# iptables -V
iptables v1.3.5


