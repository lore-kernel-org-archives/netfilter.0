From: =?ISO-8859-15?B?SmVz+nMgR2FyY+1hIENyZXNwbyAoYWthIFNldmVpbik=?= <correo@sevein.com>
Subject: Where libipt_MASQ.so (???)
Date: Mon, 4 Aug 2003 18:48:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1211419607.20030804184812@sevein.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hi! Im tired because I have tryed to run iptables on my system too
times. The problem is that I dont have the dynamic library
/lib/iptables/libipt_MASQ.so, but anybody have it!

I use Gentoo Linux on kernel 2.4.20. I have compiled all netfilter
options as modules althoun I tried also installing it into the kernel
system.

I only want, by now, this rules for the iptables tool:

 iptables -P INPUT ACCEPT
 iptables -F INPUT
 iptables -P OUTPUT ACCEPT
 iptables -F OUTPUT
 iptables -P FORWARD DROP
 iptables -F FORWARD
 iptables -A FORWARD --match mac --mac-source 00:c0:49:c9:d3:f1 -j MASQ
 iptables -A FORWARD --match mac --mac-source 00:c0:49:bc:9f:08 -j MASQ
 iptables -A FORWARD --match mac --mac-source 00:02:8a:3a:77:b7 -j MASQ
 iptables -A FORWARD --match mac --mac-source 00:90:d1:08:19:8d -j MASQ

But the problem is when iptables execute '-j MASQ', telling me that
libipt_MASQ.so doesn't exist. What should I do? I can't find an
explication.

Sorry, but I am from Spain and my English could be poor for you. Try
to understand me, :).

--
Jes=FAs Garc=EDa Crespo (aka Sevein)
http://www.sevein.com
correo@sevein.com


