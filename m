From: lst_hoe01@kwsoft.de
Subject: Strange RST,ACK packet from my Host
Date: Thu, 23 Dec 2004 09:07:35 +0100
Message-ID: <1103789255.41ca7cc7e4549@webmail.kwsoft.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="-MOQ11037892552ad976007ba8182b0bc58026fe5c370c"
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
To: netfilter@lists.netfilter.org

This message is in MIME format.

---MOQ11037892552ad976007ba8182b0bc58026fe5c370c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello

we have a mailserver protected itself by iptables and a firewall (iptable=
s) in
front of it. The firewall sometimes log RST,ACK packets from our mailserv=
er as
not permitted so i have done a tcpdump trace for one source IP for which =
this
is happening (attached to the mail).
This trace shows that after the last packet from the remote (217.219.215.=
10) our
mailserver respond with a RST,ACK packet from a random high port which is
dropped from the firewall because it does not match any connection??

Can anyone explain why the mailserver send this strange packet?

OS is Linux Kernel 2.4.21
Iptables v1.2.8

Thanxs for any help

Andreas




---MOQ11037892552ad976007ba8182b0bc58026fe5c370c
Content-Type: application/octet-stream; name="test.log"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="test.log"

1MOyoQIABAAAAAAAAAAAAGAAAAABAAAAMx3KQV3hCQBKAAAASgAAAACQJ76rVwACs4ggyAgARQAA
PG9pQAAnBhp22dvXCtWkQ1JRXAAZxfYeIgAAAACgAkAATk4AAAIEBbQBAwMAAQEICgNKugQAAAAA
Mx3KQQfiCQBKAAAASgAAAAACs4ggyACQJ76rVwgARQAAPKgIQABABsjW1aRDUtnb1woAGVFciInT
dsX2HiOgEhagMHEAAAIEBbQBAQgKAY7pnQNKugQBAwMAMx3KQTPDDgBCAAAAQgAAAACQJ76rVwAC
s4ggyAgARQAANHAxQAAnBhm22dvXCtWkQ1JRXAAZxfYeI4iJ03eAEEPgLtYAAAEBCAoDSrojAY7p
nTMdykHs1g4AYAAAAAYBAAAAkCe+q1cAArOIIMgIAEUAAPhwMkAAJwYY8dnb1wrVpENSUVwAGcX2
HiOIidN3gBhD4DjAAAABAQgKA0q6IwGO6Z1QT1NUIC8gSFRUUC8xLjANCkhvc3Q6IG1haWxpbi4z
HcpBQdcOAEIAAABCAAAAAAKziCDIAJAnvqtXCABFAAA0qApAAEAGyNzVpENS2dvXCgAZUVyIidN3
xfYe54AQGSBXjQAAAQEICgGO6uIDSrojNB3KQSUMAABgAAAAZgAAAAACs4ggyACQJ76rVwgARQAA
WKgLQABABsi31aRDUtnb1woAGVFciInTd8X2HueAGBkghEwAAAEBCAoBjusAA0q6IzIyMCBtYWls
aW4ua3dzb2Z0LmRlIEVTTVRQIFBvczQdykHjdgQAYAAAAOoFAAAAkCe+q1cAArOIIMgIAEUABdxw
vEAAJwYTg9nb1wrVpENSUVwAGcX2HueIidN3gBBD4JpRAAABAQgKA0q6QgGO6uJSU0VUDQpIRUxP
IGt3c2NwYS5jb20NCk1BSUwgRlI0HcpB53YEAGAAAAAOAQAAAJAnvqtXAAKziCDICABFAAEAcL1A
ACcGGF7Z29cK1aRDUlFcABnF9iSPiInTd4AYQ+AKvQAAAQEICgNKukIBjuribWFuIGV1Z2VuZSBt
b29raWUNCmFiY2RlZiBsdWx1NB3KQT13BABCAAAAQgAAAAACs4ggyACQJ76rVwgARQAANKgMQABA
Bsja1aRDUtnb1woAGVFciInTm8X2JVuAECHwRsYAAAEBCAoBjuwiA0q6QjQdykHGegQAQgAAAEIA
AAAAkCe+q1cAArOIIMgIAEUAADRwzEAAJwYZG9nb1wrVpENSUVwAGcX2JVuIidObgBBDvCYaAAAB
AQgKA0q6RAGO6wA0HcpBDw8KAEIAAABCAAAAAJAnvqtXAAKziCDICABFAAA0cZdAACcGGFDZ29cK
1aRDUlFcABnF9iVbiInTm4ARQ+AkrwAAAQEICgNKumgBjuwiNB3KQcSoCgBCAAAAQgAAAAACs4gg
yACQJ76rVwgARQAANKgNQABABsjZ1aRDUtnb1woAGVFciInTm8X2JVyAECHwRQkAAAEBCAoBju24
A0q6aD4dykE+DgAAYAAAAK4AAAAAArOIIMgAkCe+q1cIAEUAAKCoDkAAQAbIbNWkQ1LZ29cKABlR
XIiJ05vF9iVcgBgh8J/1AAABAQgKAY8SEQNKumg1MDIgRXJyb3I6IGNvbW1hbmQgbm90IGltcGxl
bWU+HcpBxmUEADwAAAA8AAAAAJAnvqtXAAKziCDICABFAAAogasAACcGSEjZ29cK1aRDUlFcABnF
9iVcAAAAAFAEAACpOwAAAAAAAAAASB3KQScTAABCAAAAQgAAAAACs4ggyACQJ76rVwgARQAANKgP
QABABsjX1aRDUtnb1wqDNVFciInUB8X2JVyAFCHwdhIAAAEBCAoBjzkiA0q6aA==

---MOQ11037892552ad976007ba8182b0bc58026fe5c370c--


