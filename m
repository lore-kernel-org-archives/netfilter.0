From: root@lagente.com
Subject: Two gateways
Date: Wed, 30 Apr 2003 12:54:02 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430175402.6D30EFAE0@mail.shore.com.mx>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1051725242"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--bound1051725242
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I have setup 2 DSL outgoing connections for my LAN. I split the traffic according form the source IP.
My network setup is


				---------dsl1 xxx.xxx.xxx.xxx
192.168.0.0/24 LAN------
				---------dsl2 yyy.yyy.yyy.yyy
				
My rules are 

iptables -t nat -A POSTROUTING -s 192.168.0.128/25 -d 0/0 -j SNAT --to xxx.xxx.xxx.xxx
iptables -t nat -A POSTROUTING -s 192.168.0.128/25 -d 0/0 -j SNAT --to yyy.yyy.yyy.yyy

My default gateway is xxx.xxx.xxx.xxx

The nat rule that uses my default gateway has no problem.

How can I set a route rule to send the traffic form yyy.yyy.yyy.yyy out, or I don���t know if I���m using the incorrect iptable command. Sorry I���m a newbie

--bound1051725242--

