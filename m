From: Berndt Sevcik <berndt.sevcik@tgm.ac.at>
Subject: Performance Problems with iptables
Date: 25 Oct 2002 16:03:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035554619.24039.28.camel@ITS-Sevcik>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello!

I am using a combination of iproute2 (source based routing) and iptables
(NAT Iptables Version 1.2.6a-5). The problem is that I have big
performance problems. The maximum download speed per user is about 5kb.
We can only use our existing line to the ISP by about 20%, and thats not
an ISP problem.

Need help!

IPRoute Config:
ip rule add from 10.0.0.0/8 table chello1
ip route add feault via 192.168.158.101 table chello1

ip rule add from 193.170.8.133 table chello1
ip rule add from 193.170.8.134 table chello1
ip route flush cash

NAT Config:
iptables -t nat -A POSTROUTING -p ip -s 10.0.0.0/8 -j SNAT --to
212.17.100.114
iptables -t nat -A POSTROUTING -p ip -s 193.170.8.133 -j SNAT --to
212.17.100.115
iptables -t nat -A POSTROUTING -p ip -s 193.170.8.133 -j SNAT --to
212.17.100.116

Thanks
Berndt

--=20
Diese Message wurde erstellt mit freundlicher Unterst=FCtzung
eines freilaufenden Pinguins aus artgerechter Freilandhaltung.
Sie ist garantiert frei von Microsoftschen Viren.

-----------------------------------------
TGM - Die Schule der Technik
IT-Service
A-1200 Wien, Wexstr. 19-23
Tel. +43(1)33126/316 Fax: +43(1)33126/154
E-Mail: berndt.sevcik@tgm.ac.at
-----------------------------------------


