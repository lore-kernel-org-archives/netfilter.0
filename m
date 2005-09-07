From: tedemo <tedemo@free.fr>
Subject: ipset compilation fails on kernel 2.6.13
Date: Wed, 07 Sep 2005 18:09:43 +0200
Message-ID: <431F10C7.7020009@free.fr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Using sources found on http://ipset.netfilter.org/install.html, and also
the latest iptables & pom-ng, I cannot get ipset to compile without error=
s :

  CC [M]  net/ipv4/netfilter/ip_set.o
net/ipv4/netfilter/ip_set.c:35: attention : type defaults to `int' in=20
declaration of `DECLARE_RWLOCK'
net/ipv4/netfilter/ip_set.c:35: attention : noms de param=E8tres (sans=20
type) dans la d=E9claration de fonction
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_find_in_hash =BB=
:
net/ipv4/netfilter/ip_set.c:86: attention : implicit declaration of=20
function `MUST_BE_READ_LOCKED'
net/ipv4/netfilter/ip_set.c:86: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c:86: error: (Each undeclared identifier is=20
reported only once
net/ipv4/netfilter/ip_set.c:86: error: for each function it appears in.)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB __set_hash_del =BB:
net/ipv4/netfilter/ip_set.c:103: attention : implicit declaration of=20
function `MUST_BE_WRITE_LOCKED'
net/ipv4/netfilter/ip_set.c:103: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_hash_del =BB:
net/ipv4/netfilter/ip_set.c:120: attention : implicit declaration of=20
function `WRITE_LOCK'
net/ipv4/netfilter/ip_set.c:120: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c:129: attention : implicit declaration of=20
function `WRITE_UNLOCK'
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_hash_add =BB:
net/ipv4/netfilter/ip_set.c:145: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_testip_kernel =BB=
:
net/ipv4/netfilter/ip_set.c:210: attention : implicit declaration of=20
function `READ_LOCK'
net/ipv4/netfilter/ip_set.c:210: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c:221: attention : implicit declaration of=20
function `READ_UNLOCK'
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_addip_kernel =BB=
:
net/ipv4/netfilter/ip_set.c:237: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_delip_kernel =BB=
:
net/ipv4/netfilter/ip_set.c:266: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_register_set_typ=
e =BB:
net/ipv4/netfilter/ip_set.c:310: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB=20
ip_set_unregister_set_type =BB:
net/ipv4/netfilter/ip_set.c:332: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_bindip =BB:
net/ipv4/netfilter/ip_set.c:554: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_unbindip =BB:
net/ipv4/netfilter/ip_set.c:632: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB find_set_type_rlock =BB=
:
net/ipv4/netfilter/ip_set.c:744: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_create =BB:
net/ipv4/netfilter/ip_set.c:835: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_destroy_set =BB:
net/ipv4/netfilter/ip_set.c:897: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_rename =BB:
net/ipv4/netfilter/ip_set.c:973: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_swap =BB:
net/ipv4/netfilter/ip_set.c:1007: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Dans la fonction =AB ip_set_restore =BB:
net/ipv4/netfilter/ip_set.c:1335: error: `ip_set_lock' undeclared (first=20
use in this function)
net/ipv4/netfilter/ip_set.c: Hors de toute fonction :
net/ipv4/netfilter/ip_set.c:35: attention : `DECLARE_RWLOCK' declared=20
`static' but never defined
make[3]: *** [net/ipv4/netfilter/ip_set.o] Erreur 1
make[2]: *** [net/ipv4/netfilter] Erreur 2
make[1]: *** [net/ipv4] Erreur 2

Should I use another kernel ?



