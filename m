From: "Holger Burmann" <H.Burmann@gmx.de>
Subject: DF reset / MSS clamp pmtu
Date: Mon, 26 Jul 2004 15:29:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c47314$908a0100$0a00020a@burmann.local.tld>
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

Hello !
Windows 2000 Server drop icmp messages "fragmentation needed". I can
only get stupid answers from Microsoft about routers who drop the packes
- but the problem is Microsoft.

So I add=20

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS
--clamp-mss-to-pmtu

To my Linux router. It works fine for outgoing traffic but not on
incomming.

Example:
 1) Windows Client --- mss 1460 -> Linux box ---ppp mss 1452 --->
 2) Windows Client <-- mss 1460 -- Linux box <--ppp mss 1460 ---
 3) Windows Client -- 1500 Bytes --> Linux box=20
 4) Windows Client <-- icmp max 1492 Bytes -- Linux box=20
 5) Windows Client -- 1500 Bytes --> Linux box=20
 6) Windows Client <-- icmp max 1492 Bytes -- Linux box=20
 ...

I guess the "clamp-mss-to-pmtu" hack only work for the destination
network - or is that a bug ? The second packed comming from the ppp-IF
go throu without change.

One solutin is to reset the DF-Bit - but how ?

The other way is always sutract 100-200 bytes from the mss
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
800:899  -j TCPMSS --set-mss  700
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
900:999  -j TCPMSS --set-mss  800
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
1000:1099 -j TCPMSS --set-mss  900
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
1100:1199 -j TCPMSS --set-mss 1000
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
1200:1299 -j TCPMSS --set-mss 1100
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss
1300:1399 -j TCPMSS --set-mss 1200
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -m tcpmss --mss 1400:
-j TCPMSS --set-mss 1300


Any other idea ?

Mit freundlichen Gr=FC=DFen=20
 =20
Holger Burmann=20


