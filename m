From: thomasmkling@arcor.de
Subject: Automatically turn on connection tracking?
Date: Mon, 30 May 2005 19:27:50 +0200 (CEST)
Message-ID: <1579720.1117474070771.JavaMail.ngmail@webmail-06.arcor-online.net>
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

Hello,

I do NOT want to type: (but it works correctly)
[1] iptables -A INPUT -m state --state NEW,INVALID,RELATED,ESTABLISHED,UNTR=
ACKED,... -j A_TARGET_WHICH_REQUIRES_CONNTRACK

I just want to have:
[2] iptables -A INPUT -j A_TARGET_WHICH_REQUIRES_CONNTRACK


But [2] does not work, it fails because conntrack does not work: invalid co=
nntrack, here:

ct =3D ip_conntrack_get((struct sk_buff *)skb, &ctinfo);
if (!ct) {
 DEBUGP("invalid conntrack \n");
=09return;
}


Can someone please explain why? What I do wrong?





Machen Sie aus 14 Cent spielend bis zu 100 Euro!
Die neue Gaming-Area von Arcor - =FCber 50 Onlinespiele im Angebot.
http://www.arcor.de/rd/emf-gaming-1

