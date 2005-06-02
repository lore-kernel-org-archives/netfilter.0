From: "Thibault Le Meur" <Thibault.Lemeur@supelec.fr>
Subject: RE : iptable 1.2.11 and kernel 2.6.11-1 compatibility issue
Date: Thu, 2 Jun 2005 10:54:23 +0200
Message-ID: <008801c56750$ac6c4af0$7c66e4a0@supelec.fr>
References: <429DE09F.2060409@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429DE09F.2060409@riverviewtech.net>
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

> could we see the entire script or at the very least an output of =
iptables-
> save after your script has run?

The issue is related to a bug that was recently patched into Netfilter
(https://lists.netfilter.org/pipermail/netfilter-devel/2005-May/019543.ht=
ml)

Here is the script I used to confirm the bug:
-------------------------------------------------------------------------=
---
-------------------------------------------------------------------------=
---
#!/bin/sh
#
PATH=3D"/sbin:/usr/sbin:/bin:/usr/bin:${PATH}"
export PATH
IPTABLES=3D"/sbin/iptables"

# Default policy
$IPTABLES -P OUTPUT  DROP
$IPTABLES -P INPUT   DROP
$IPTABLES -P FORWARD DROP

# Flush tables
cat /proc/net/ip_tables_names | while read table; do
  test "X$table" =3D "Xmangle" && continue
  $IPTABLES -t $table -L -n | while read c chain rest; do
      if test "X$c" =3D "XChain" ; then
        $IPTABLES -t $table -F $chain
      fi
  done
  $IPTABLES -t $table -X
done

# Accept related, established
$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "Rule 0 (lo)"
# Added to confirm the bug
$IPTABLES -N lo_INVALID_RULE
$IPTABLES -A INPUT  -i lo  -m state --state INVALID  -j lo_INVALID_RULE
$IPTABLES -A OUTPUT  -o lo  -m state --state INVALID  -j lo_INVALID_RULE
$IPTABLES -A lo_INVALID_RULE -j LOG  --log-level info --log-prefix
"lo_INVALID_RULE - Accept "
$IPTABLES -A lo_INVALID_RULE -j ACCEPT

# Standard loopback rule
$IPTABLES -N lo_NEW_RULE
$IPTABLES -A INPUT  -i lo  -m state --state NEW  -j lo_NEW_RULE
$IPTABLES -A OUTPUT  -o lo  -m state --state NEW  -j lo_NEW_RULE
$IPTABLES -A lo_NEW_RULE -j LOG  --log-level info --log-prefix =
"lo_NEW_RULE
- Accept "
$IPTABLES -A lo_NEW_RULE -j ACCEPT

# Simple test policy
$IPTABLES -A OUTPUT  -s 160.228.120.129  -m state --state NEW  -j ACCEPT
$IPTABLES -A INPUT  -d 160.228.120.129  -p tcp -m tcp  --dport 22 -m =
state
--state NEW  -j ACCEPT
-------------------------------------------------------------------------=
---
-------------------------------------------------------------------------=
---


With this script and the Fedora new kernel-2.6.11-1.27_FC3, a "ssh
localhost" command results in the following logs:
Jun  2 10:47:41 MYHOST kernel: lo_NEW_RULE - Accept IN=3D OUT=3Dlo =
SRC=3D127.0.0.1
DST=3D127.0.0.1 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D47020 DF =
PROTO=3DTCP
SPT=3D52640 DPT=3D22 WINDOW=3D32767 RES=3D0x00 SYN URGP=3D0
Jun  2 10:47:41 MYHOST kernel: lo_NEW_RULE - Accept IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1 =
DST=3D127.0.0.1
LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D47020 DF PROTO=3DTCP =
SPT=3D52640 DPT=3D22
WINDOW=3D32767 RES=3D0x00 SYN URGP=3D0
Jun  2 10:47:41 MYHOST kernel: lo_INVALID_RULE - Accept IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1 =
DST=3D127.0.0.1
LEN=3D75 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D40002 DF PROTO=3DTCP =
SPT=3D22 DPT=3D52640
WINDOW=3D8192 RES=3D0x00 ACK PSH URGP=3D0
Jun  2 10:47:41 MYHOST kernel: lo_INVALID_RULE - Accept IN=3Dlo OUT=3D
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1 =
DST=3D127.0.0.1
LEN=3D74 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D47026 DF PROTO=3DTCP =
SPT=3D52640 DPT=3D22
WINDOW=3D8192 RES=3D0x00 ACK PSH URGP=3D0

Thanks again,
Thibault



