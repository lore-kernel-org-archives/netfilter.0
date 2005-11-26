From: PassWord Sistemas <password@speedy.com.ar>
Subject: dual/triple adsl router natting problem
Date: Fri, 25 Nov 2005 21:58:57 -0300
Message-ID: <4387B351.00000C.03940@OFICINA>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: Text/Plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi, sorry for my bad english, i=B4m trying to share 2 adsl line in a =
lan
conected to one AP with 15 clients, but i can=B4t. I=B4m using Fedora=
 Core 3
with a few lines scripts with one adsl line:=20

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --table nat --append POSTROUTING --out-interface ppp0 -j MAS=
QUERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT

service named start
=20
I need to include in this script the other adsl because the clients a=
re
webing very slow.
Very thanks...

Federico.
Rawson - Argentina



