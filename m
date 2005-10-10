From: dfgdfg dfgdf <borneoo@freemail.hu>
Subject: iptables local port forward
Date: Mon, 10 Oct 2005 15:39:26 +0200 (CEST)
Message-ID: <freemail.20050910153926.43612@fm17.freemail.hu>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi=20

I have a question about iptables port forward:
I have the following rules which are working ok if I try it
from outside
but when I try it from the localhost (which is running the=20
iptables) it is not working ?=20
Does any body know why it isn't  working this way?
and what is the solution ?

Thx a lot
Anti
------------------
# Redirect port 5900
iptables -t nat -A PREROUTING -p tcp -d $LOCAL_IP --dport
5900 -j DNAT --to $OTHER_HOST_IP:5900

iptables -t nat -A POSTROUTING -o eth0 -p tcp -d
$OTHER_HOST_IP --dport 5900 -j MASQUERADE
=0A=0A_____________________________________________________________________=
_______________________=0AKisbab=E1d lesz? Kisbab=E1d sz=FCletett? Tele vag=
y k=E9rd=E9sekkel, =E9s nem tudod, hol tal=E1lsz v=E1laszt?=0AKukkants be a=
 Bab=E1z=F3ba! - www.babazo.hu=0A=0A

