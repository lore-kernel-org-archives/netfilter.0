From: "hostingbr" <hostingbr@bol.com.br>
Subject: iptables: Problem in Kernel 2.6.4
Date: Fri, 19 Mar 2004 01:30:20 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HUT36K$CE1E161A9FBC75897443932B0D75698B@bol.com.br>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello all,

I'm need install the KISS firewall on server with 
kernel =
2.6.4 but receive this error:

root@servidor7 [/usr/bin]# ./kiss start=0D
=
lsmod: QM_MODULES: Function not implemented
modprobe: QM_MODULES: Functi=
on not implemented
insmod: QM_MODULES: Function not implemented
insmod:=
 insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip_ta=
bles.o 
failed
insmod: QM_MODULES: Function not implemented
insmod: QM=
_MODULES: Function not implemented
insmod: insmod ip_tables failed
modp=
robe: QM_MODULES: Function not implemented
insmod: QM_MODULES: Function =
not implemented
insmod: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/=
net/ipv4/netfilter/ip_tables.o 
failed
insmod: QM_MODULES: Function not=
 implemented
insmod: QM_MODULES: Function not implemented
insmod: insmo=
d ipt_state failed
modprobe: QM_MODULES: Function not implemented
insmo=
d: QM_MODULES: Function not implemented
insmod: insmod /lib/modules/2.4.=
21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip_tables.o 
failed
insmod: =
QM_MODULES: Function not implemented
insmod: QM_MODULES: Function not im=
plemented
insmod: insmod ipt_multiport failed
modprobe: QM_MODULES: Fun=
ction not implemented
insmod: QM_MODULES: Function not implemented
insm=
od: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip=
_tables.o 
failed
insmod: QM_MODULES: Function not implemented
insmod:=
 QM_MODULES: Function not implemented
insmod: insmod ip_tables failed=0D
=
modprobe: QM_MODULES: Function not implemented
insmod: QM_MODULES: Funct=
ion not implemented
insmod: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/ker=
nel/net/ipv4/netfilter/ip_tables.o 
failed
insmod: QM_MODULES: Function=
 not implemented
insmod: QM_MODULES: Function not implemented
insmod: i=
nsmod ipt_state failed
modprobe: QM_MODULES: Function not implemented=0D
=
insmod: QM_MODULES: Function not implemented
insmod: insmod /lib/modules=
/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip_tables.o 
failed
ins=
mod: QM_MODULES: Function not implemented
insmod: QM_MODULES: Function n=
ot implemented
insmod: insmod ipt_multiport failed
modprobe: QM_MODULES=
: Function not implemented
insmod: QM_MODULES: Function not implemented=0D
=
insmod: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilte=
r/ip_tables.o 
failed
insmod: QM_MODULES: Function not implemented
ins=
mod: QM_MODULES: Function not implemented
insmod: insmod iptable_filter =
failed
modprobe: QM_MODULES: Function not implemented
insmod: QM_MODULE=
S: Function not implemented
insmod: insmod /lib/modules/2.4.21-
4.0.1.E=
Lsmp/kernel/net/ipv4/netfilter/ip_tables.o 
failed
insmod: QM_MODULES: =
Function not implemented
insmod: QM_MODULES: Function not implemented=0D
=
insmod: insmod ipt_unclean failed
modprobe: QM_MODULES: Function not imp=
lemented
insmod: QM_MODULES: Function not implemented
insmod: insmod /l=
ib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip_tables.o =0D
=
failed
insmod: QM_MODULES: Function not implemented
insmod: QM_MODULES:=
 Function not implemented
insmod: insmod ipt_limit failed
modprobe: QM_=
MODULES: Function not implemented
insmod: QM_MODULES: Function not imple=
mented
insmod: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/=
netfilter/ip_tables.o 
failed
insmod: QM_MODULES: Function not implemen=
ted
insmod: QM_MODULES: Function not implemented
insmod: insmod ipt_LOG=
 failed
modprobe: QM_MODULES: Function not implemented
insmod: QM_MODUL=
ES: Function not implemented
insmod: insmod /lib/modules/2.4.21-
4.0.1.=
ELsmp/kernel/net/ipv4/netfilter/ip_tables.o 
failed
insmod: QM_MODULES:=
 Function not implemented
insmod: QM_MODULES: Function not implemented=0D
=
insmod: insmod ipt_REJECT failed
modprobe: QM_MODULES: Function not impl=
emented
insmod: QM_MODULES: Function not implemented
insmod: insmod /li=
b/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip_conntrack.o =0D
=
failed
insmod: QM_MODULES: Function not implemented
insmod: QM_MODULES:=
 Function not implemented
insmod: insmod ip_conntrack failed
modprobe: =
QM_MODULES: Function not implemented
insmod: QM_MODULES: Function not im=
plemented
insmod: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ip=
v4/netfilter/ip_conntrack.o 
failed
insmod: QM_MODULES: Function not im=
plemented
insmod: QM_MODULES: Function not implemented
insmod: insmod i=
p_conntrack_irc failed
modprobe: QM_MODULES: Function not implemented=0D
=
insmod: QM_MODULES: Function not implemented
insmod: insmod /lib/modules=
/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/netfilter/ip_conntrack.o 
failed=0D
=
insmod: QM_MODULES: Function not implemented
insmod: QM_MODULES: Functio=
n not implemented
insmod: insmod ip_conntrack_ftp failed
modprobe: QM_M=
ODULES: Function not implemented
insmod: QM_MODULES: Function not implem=
ented
insmod: insmod /lib/modules/2.4.21-
4.0.1.ELsmp/kernel/net/ipv4/n=
etfilter/ip_tables.o 
failed
insmod: QM_MODULES: Function not implement=
ed
insmod: QM_MODULES: Function not implemented
insmod: insmod iptable_=
mangle failed

The first error not found files 
in /lib/modules/2.6.4/=
... I'm create a symbol link of 
2.6.4 to 2.4.21-4.0.1.ELsmp (the direct=
ory exist 
in /lib/modules).

Any ideia to fix the problem?

Thanks,=

Minotauro.=0A =0A______________________________________________________=
____________________=0AAcabe com aquelas janelinhas que pulam na sua tela=
.=0AAntiPop-up UOL - =C9 gr=E1tis!=0Ahttp://antipopup.uol.com.br/=0A


