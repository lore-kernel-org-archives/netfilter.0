From: "Luiz C. Spies" <luiz@iriscolor.com.br>
Subject: CONNLIMIT
Date: Wed, 6 Apr 2005 17:50:09 -0300
Message-ID: <001301c53aea$3884c230$7100000a@wim2000>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi to all, i try many time limit my port 25 to 2 connection, but i have no
achieve success yet!!!

I tried this rulez!
iptables -A INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-above
2 --connlimit-mask 32 -j REJECT --reject-with tcp-reset
iptables -A INPUT -p tcp --syn --dport 25 -m connlimit --connlimit-above
2 -j REJECT
iptables -p tcp --syn --dport 25 -m connlimit --connlimit-above 2 -j REJECT
iptables -p tcp --syn --dport 25 -m connlimit ! --connlimit-above 2 -j
ACCEPT

Anyone has idea!!!???


Greeting's to all!

PS: Sorry about my english!


Luiz C. Spies

--=20
Esta mensagem foi verificada pelo sistema de antiv=EDrus e
 acredita-se estar livre de perigo.

