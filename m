From: PayalR <payal@hotpop.com>
Subject: block ports
Date: Mon, 16 Sep 2002 12:32:45 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <28485.773134935$1032163822@news.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
I have a stupid question. I want to have incoming internet access for onl=
y=20
port 22, 25, 80 and 110. How do I go abut it?
I thought of this rule first,

#iptables -A INPUT -i eth0 -p tcp --dport ! 22 -j DROP

and go for the other ports as well. But my problem is that if a packet=20
arrives from port 110, it will be checked for rule 1 above and since it i=
s=20
not for port 22 it will be dropped disregarding the next rules. Right?

What can I do about this? How do I exactly frame the rules?
Thanks a lot and bye.
-Payal


