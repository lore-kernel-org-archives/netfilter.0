From: Nicolas Martin <nico.martin@gmail.com>
Subject: Problems to get TARPIT functionnality with iptables
Date: Thu, 14 Oct 2004 22:05:17 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <487eee530410141305460b18ca@mail.gmail.com>
Reply-To: Nicolas Martin <nico.martin@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I'm using Debian GNU/Linux and I'd like to get iptables working with
the tarpit function.
I have my 2.6.8 kernel in /usr/src/linux.
I've downloaded patch-o-matic with cvs as told in the netfilter
modification tutorial. It created me /usr/src/linux/netfilter and
/usr/src/linux/netfilter/patch-o-matic (no
/usr/src/linux/netfilter/userspace as told in the tutorial).

After that I launch ./runme ./extra/ipt_TARPIT.patch and if I apply the pat=
ch :

Testing patch extra/ipt_TARPIT.patch...
Warning - no help text file could be found in either
/usr/src/linux/net/ipv4/netfilter/Config.help
or /usr/src/linux/Documentation/Configure.help
grep: /usr/src/linux/net/ipv4/netfilter/Config.in: Aucun fichier ou
r=E9pertoire de ce type
Could not find place to slot in Config.in line
TEST FAILED: patch NOT applied

If I force with f :

Applying patch extra/ipt_TARPIT.patch...
Warning - no help text file could be found in either
/usr/src/linux/net/ipv4/netfilter/Config.help
or /usr/src/linux/Documentation/Configure.help
grep: /usr/src/linux/net/ipv4/netfilter//Config.in: Aucun fichier ou
r=E9pertoire de ce type
Could not find place to slot in Config.in line
grep: /usr/src/linux//dev/null: Aucun fichier ou r=E9pertoire de ce type
Could not find place to slot in null entry
Could not find place to slot in Makefile line
Patch extra/ipt_TARPIT.patch applied cleanly.
=20
But I can't find the tarpit item when I use make xconfig which should be in=
=20
networking_options -> network packet filtering -> IP:Netfilter configuratio=
n=20

Thanks for your help because I spent a lot of time trying to figure
this out... I'm quite sure it's something quite silly that I forgot to
do ...

Nicolas

