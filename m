From: "Stephen Jones" <sljones8@hotmail.com>
Subject: tcp-MSS target extensions Patch
Date: Sun, 16 May 2004 09:28:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F39s3nJQHd4Kkc00018f2c@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello All,

I am having difficulty locating and applying the tcp-MSS patch as described=
=20
here:

http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-4.=
html#ss4.7

I have run through both the patch-o-matic-20031219 and the=20
patch-o-matic-ng-20040302 against an iptables 1.2.9 and  2.4.25 kernel=20
sources.  The option to apply the patch does not appear as I run through th=
e=20
./runme extra or ./rume userspace  scripts for either patch-o-matics.

I am in desperate need to implement:

iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS=20
--clamp-mss-to-pmtu

with a pptp client I have installed on a gateway device. =20
(http://pptpclient.sourceforge.net/  <-- main page, and see these for the=20
problem I am tryting to solve: =20
http://pptpclient.sourceforge.net/howto-diagnosis.phtml#connections_freeze =

and finally     http://lartc.org/howto/lartc.cookbook.mtu-mss.html)

The kernel config has these options set:

CONFIG_IP_NF_MATCH_TCPMSS=3Dy
CONFIG_IP_NF_TARGET_TCPMSS=3Dy

Both the kernel and iptables appear to compile without complaints.

I get an "unknown arg `--clamp-mss-to-pmtu'  gripe from the recompiled=20
iptables when I enter the full command as specified above.

The only "hits" I could find using tcp-MSS on a google hunt were to a post =

on the netfilter list from October of 1999, and a reference to the patch on=
=20
the samba cvs, but it was a dead link...

A nudge in the right direction would be greatly appreciated!  Thanks for=20
your time!

SJ

_________________________________________________________________
MSN Toolbar provides one-click access to Hotmail from any Web page =96 FREE=
=20
download! http://toolbar.msn.click-url.com/go/onm00200413ave/direct/01/


