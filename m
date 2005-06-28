From: "massiblue\@libero\.it" <massiblue@libero.it>
Subject: removing entries from conntrack table
Date: Tue, 28 Jun 2005 17:16:18 +0200
Message-ID: <IISVR6$0605B46BBF14FF0959F85306B36F361C@libero.it>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hi all,

i have a nat box
connecting my lan to
internet via two
pppo=
es, i want to be
able to route lan
hosts trough ppp0 or
ppp1 independe=
ntly.
i managed iproute2
and iptables rules
to make the thing
work (a=
lmost...).

the problem is that
if i reroute hosts
on the fly (and i=0D
=
really need to),
conntrack keeps the
entry and sends out
packet on the=

correct interface
but with the wrong
snat (the previous
one), with t=
he
response coming back
on the other ppp
(weird)!

if i wait for the=

conntrack to
timeout, then
everything is ok...
but i need instant=0D
=
complete switch!

i tried the hping2
hack, and it's ok
for TCP... but=
 i
also need to drop
UDP entries... (such
as dns queries...)

so i n=
eed a way to
_selectively_ delete
conntrack entries!

searched the ne=
t but
found nothing apart
some very old
similar posts...

thank you =
very much

Massimiliano Galanti=0A=0A=0A=0A____________________________=
________________________________=0ANavighi a 4 MEGA e i primi 3 mesi sono=
 GRATIS. =0AScegli Libero Adsl Flat senza limiti su http://www.libero.it=0A=



