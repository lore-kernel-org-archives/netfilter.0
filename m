From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: Masquerading problems
Date: Wed, 3 Jul 2002 19:28:15 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA1F8@JUPITER>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "'davidgr@interlap.com.ar'" <davidgr@interlap.com.ar>
Cc: netfilter@lists.samba.org

All you really need is to POSTROUTE the workstations..

With PPPoE do this..

INTSN=3D"192.168.1.0/24"
IPTABLES=3D/sbin/iptables
EXTDEV=3D"`adsl-status | grep "Link encap"  | awk {'print $1'}"
$IPTABLES -A POSTROUTING -o $EXTDEV -t nat -s $INTSN -d $ANYWHERE -j
MASQUERADE



There is a /proc switch which you should turn on for dynamic IPs.. =
forgot
the path.. someone must know it.. argh..


-----Original Message-----
From: David Gaston Rodriguez [mailto:davidgr@interlap.com.ar]
Sent: Wednesday, 03 July 2002 3:08 PM
To: netfilter@lists.samba.org
Subject: Masquerading problems


Hi!, i am new in the list, i am from argentina, this is mi problem:
I have a small LAN with a server doing masquerading, I used the kernel
2.2.20 and
did not have any problem, now i decided to use the kernel 2.4.18, i set
iptables=20
to make the masquerading, but now there are web pages which i can enter =
from

workstations, like for example www.mixmail.com or www.yahoo.com, and =
from
the server
i can enter to this pages. I using 2 interfaces, eth0: external, eth1:
internal, the
external interface is connect to ADSL Modem (PPPoE).
Some idea on as could be mi problem?
Thanks!!


--=20

---------------------------------
DAVID GAST=D3N RODRIGUEZ
Linux Tucum=E1n
Nick: [[D4V|D]]
---------------------------------
Email:  davidgr@interlap.com.ar
        david_80gr@hotmail.com
ICQ: 81492566
MSN Messenger: david_80gr
---------------------------------


