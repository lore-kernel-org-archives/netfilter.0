From: fadhelbb@free.fr
Subject: REdirect all http request to squid except those going to the DMZ
Date: Fri, 24 Feb 2006 16:20:07 +0100
Message-ID: <1140794407.43ff242774810@imp4-g19.free.fr>
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
To: netfilter@lists.netfilter.org



Hello,

I tried this rule in my script

$IPTABLES -t nat -A PREROUTING -i $INTERNAL -d ! $DMZ_NET -p tcp --dport =
80 -j
REDIRECT --to $squid_port

but it doesn't work, all my http request are redirected to the squidport,=
 my
"-d $DMZ_NET" is not seen.

I just want that all my outgoing http requests are processed by squid exc=
ept the
http requests going to the DMZ.

Can somebody help ?

Thks
F

