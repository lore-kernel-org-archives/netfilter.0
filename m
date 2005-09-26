From: Vagner H <vagnerh@yahoo.com>
Subject: Debian Bridge Iptables - Forward Problem
Date: Mon, 26 Sep 2005 19:32:43 +0000 (GMT)
Message-ID: <20050926193244.60555.qmail@web50811.mail.yahoo.com>
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


Hello!

I'm problem with iptables 1.2.11, Debian 3.1 and kernel 2.4.31.

My forward rules don't work correctly.=20

I'm using the command below to see Chains counters,

#iptables -xvL=20

=20

But, I don't see any traffic in Forward rules.=20

The Input and Output Chains functions ok.

=20

The bridge is ok, because the network function ok, but the packets don't go=
 to layer 3  (iptables).

 =20

If possible, I would like to help to resolv this problem.

=20

=20

Vagner H.


	=09
---------------------------------
 Novo Yahoo! Messenger com voz: liga=E7=F5es, Yahoo! Avatars, novos emotico=
ns e muito mais. Instale agora!
