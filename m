From: zechim <lucas@cneccapivari.br>
Subject: Re: Forwarding help
Date: Wed, 26 Nov 2003 20:30:21 -0200 (BRST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0311262028180.18749-100000@mail.cnec>
References: <000701c3b469$17203ba0$14d36c50@anonymous>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c3b469$17203ba0$14d36c50@anonymous>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: sc2@gmx.at
Cc: netfilter@lists.netfilter.org

On Wed, 26 Nov 2003 sc2@gmx.at wrote:

||hello
||i use iptables .7, but it does not work (forward) , any ideas?
||thank you ,
||ps: same rules down i have make for tcp match not only for udp
||
||echo "1" > /proc/sys/net/ipv4/ip_forward
||iptables -F FORWARD
||iptables -t nat -F
||iptables -A FORWARD -j LOG
||iptables -A FORWARD -p udp -d ip --dport port -j ACCEPT
||iptables -t nat -A PREROUTING -p udp -d ip --dport port -j DNAT --to
||ip:port

iptables -t nat -A PREROUTING -p udp -d ip --dport port -j DNAT --to-destin=
ation
ip


||
||

+ Lucas de Camargo Zechim
+ Administrador TI
+
+ phone: 55 19 3492 8894
+
+  CNEC Capivari
+   Rua Bar=E3o do Rio Branco, 374
+   13360-000
+   Capivari / S=E3o Paulo / Brasil
+
+ email by pine 4.58 / Slackware Linux 9.1 / kernel 2.4.22-xfs
+ "Os poderosos podem matar uma, duas ou tr=EAs rosas, mas
+ jamais consiguir=E3o deter a primavera inteira"




