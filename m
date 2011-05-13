From: bm@it41.de
Subject: manually update iptables
Date: Fri, 13 May 2011 07:28:53 +0200 (CEST)
Message-ID: <41501.87.139.33.146.1305264533.squirrel@mx2bln1.prossl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hey guys,

I have a problem with my iptables installation. My system is CentOS 5.5
and the kernel version is
2.6.32.21.

=46irst of all the default installation of iptables was version 1.3.5. =
which
seemed to have an issue regarding the connlimit module, cause i got tha=
t
weird errors.

-----------------------------------------------
testserver1:/# iptables -A INPUT -p tcp --dport 80 -m connlimit
--connlimit-above 3 -j REJECT
iptables: Unknown error 18446744073709551615
-----------------------------------------------

So i found the following reference link
-----------------------------------------------
http://bugzilla.netfilter.org/show_bug.cgi?id=3D515
Summary: 	connlimit filter doesn't work in 1.3.5 version of iptables
-----------------------------------------------

which lead me to try to update iptables. Unfortunately updating iptable=
s
via yum didn't seem to work
"No Packages marked for Update".

So i tried to manually install 1.3.8 (just some minor releases up to
prevent huge conflicts) against the kernel source. That actually worked=
=2E
----------------------------------------------
testserver1:/usr/src/iptables-1.3.8# iptables -v
iptables v1.3.8: no command specified
----------------------------------------------

But i missed something, it seems that i need to update the kernel
netfilters aswell
----------------------------------------------
testserver1:/usr/src/iptables-1.3.8# iptables -m connlimit --help
iptables: match `connlimit' v1.3.5 (I'm v1.3.8).
----------------------------------------------

and i have no real clue how to do that and i dont find any useful links
guiding me.

As you may have noticed i am not a kernel expert and never tried to
install iptables from source before, i would be very happy about any
advice, hint, link or whatever you could give to me.
A solution to solve the "Unknown error" in Version 1.3.5 without updati=
ng
the whole kernel netfilter modules or iptables would be fine for me
aswell.

Thx for any help,
Bj=F6rn


