From: zhuupa@banda.lv
Subject: duplicating packets to other interface
Date: Mon, 13 Dec 2004 03:06:49 +0200
Message-ID: <1102900009.41bceb29f2fac@www.banda.lv>
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

hello,

maybe my question sounds stupid to you but i've tried googling around
and couldn't find any valuable results. so, situation is here:

internet =3D=3D [:eth0 router eth1:] =3D=3D ids sensor (192.168.0.0/16)
            [             eth2:] =3D=3D clients (10.0.0.0/8)=20

so far it's a router which routes (nat) packets between external network
and clients. i added ids sensor to eth1 interface and would like incoming
packets on eth0 interface to be duplicated to eth1 so that ids sees them.

the question is - how can i do that? i haven't messed with iptables much,
and our network administraitor says it's not possible with iptables.
i don't believe him, however ;>

on openbsd packet filter it would look like this:
pass in on $ext_if dup-to $ids_if all

i believe it's as simple on iptables.

thanks in advance,
peter.

---------------------------------------------------------------------
Radical ringtones, java games, mobile phone logos, backgrounds http://sms=
.BANDA.LV !

