From: "John Jones" <jjones@merlintechnologies.com>
Subject: Ipmasqadm translation
Date: Tue, 4 Jun 2002 15:50:06 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003901c20c1a$2ef7ccf0$6301a8c0@JJONES1>
References: <200206042229.g54MTuA10411@Networker.rockstone.co.uk>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206042229.g54MTuA10411@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Iptables <netfilter@lists.samba.org>

How would I translate this rules from ipchains/ipmasqadm to iptables:

  ipmasqadm portfw -a -P udp -L 10.0.0.4 5162 -R 192.168.1.200 5162

Would the following work:

 iptables -A PREROUTING -t nat -p udp -d 10.0.0.4 --dport 5162 -j DNAT
--to 192.168.1.200:5162
 iptables -I FORWARD 1 -p udp -d 192.168.1.200 --dport 5162 -j ACCEPT

Do I have the translation right, there?  Or did ipmasqadm do two-way
forwarding, and I need to do so with another set of rules like so:

 iptables -A PREROUTING -t nat -p udp -d 192.168.1.200 --dport 5162 -j
DNAT --to 10.0.0.4:5162
 iptables -I FORWARD 1 -p udp -d 10.0.0.4 --dport 5162 -j ACCEPT



