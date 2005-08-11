From: Pierre Westeel <pierre.westeel@gmail.com>
Subject: Netfilter cluster / Invalid state problem
Date: Thu, 11 Aug 2005 19:47:04 +0200
Message-ID: <da73b3d905081110475176121@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I have a Linux netfilter cluster with keepalived to perform high avalaibili=
ty.
The master runs a 2.6.12 kernel and the Backup runs a 2.4.26 kernel. (
both from kernel.org without patch )

I have the same iptables config on  firewalls  ( Only usefuls rules
are pasted below ) :

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

-A INPUT -m state --state INVALID -j drop_invalid
-A FORWARD -m state --state INVALID -j drop_invalid
-A OUTPUT -m state --state INVALID -j drop_invalid
-A drop_invalid -j LOG --log-prefix "INVALID state -- DENY " --log-level 7
-A drop_invalid -j DROP

---

-A INPUT -d 10.24.240.0/255.255.248.0 -m state --state NEW -j ACCEPT
-A INPUT -s 10.24.240.0/255.255.248.0 -m state --state NEW -j ACCEPT
-A OUTPUT -d 10.24.240.0/255.255.248.0 -m state --state NEW -j ACCEPT
-A OUTPUT -s 10.24.240.0/255.255.248.0 -m state --state NEW -j ACCEPT
-A FORWARD -d 10.24.240.0/255.255.248.0 -m state --state NEW -j ACCEPT
-A FORWARD -s 10.24.240.0/255.255.248.0 -m state --state NEW -j ACCEPT

---

When I swap all the connections on the backup firewall with stopping
keepalived daemon on master, the connections are correctly forwarded
through the backup and I can see the new entry in
/proc/net/ip_conntrack
( This is a VNC stream , the connexion is never Idle so the sequence
number is increasing quickly )

BUT when i restart the keepalived daemon to make connection go back
through the master firewall 30 seconds after the first swap, i get the
following logs :

INVALID state -- DENY IN=3Deth0.730 OUT=3Deth0.732 SRC=3D172.18.130.194
DST=3D10.24.247.253 LEN=3D46 TOS=3D0x00 PREC=3D0x00 TTL=3D126 ID=3D46274 DF
PROTO=3DTCP SPT=3D1522 DPT=3D5901 WINDOW=3D17520 RES=3D0x00 ACK PSH URGP=3D=
0
INVALID state -- DENY IN=3Deth0.732 OUT=3Deth0.730 SRC=3D10.24.247.253
DST=3D172.18.130.194 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D30732 DF
PROTO=3DTCP SPT=3D5901 DPT=3D1522 WINDOW=3D5840 RES=3D0x00 ACK URGP=3D0
INVALID state -- DENY IN=3Deth0.732 OUT=3Deth0.730 SRC=3D10.24.247.253
DST=3D172.18.130.194 LEN=3D1040 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D30733 =
DF
PROTO=3DTCP SPT=3D5901 DPT=3D1522 WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0
INVALID state -- DENY IN=3Deth0.730 OUT=3Deth0.732 SRC=3D172.18.130.194
DST=3D10.24.247.253 LEN=3D46 TOS=3D0x00 PREC=3D0x00 TTL=3D126 ID=3D46276 DF
PROTO=3DTCP SPT=3D1522 DPT=3D5901 WINDOW=3D17520 RES=3D0x00 ACK PSH URGP=3D=
0

But the connection is still present in  /proc/net/ip_conntrack :

tcp      6 431933 ESTABLISHED src=3D172.18.130.194 dst=3D10.24.247.253
sport=3D1522 dport=3D5901 src=3D10.24.247.253 dst=3D172.18.130.194 sport=3D=
5901
dport=3D1522 [ASSURED] use=3D1

When I swap the master with the backup it works correctly. ( 2.4.26 ->
2.6.12 -> 2.4.26 instead of 2.6.12 -> 2.4.26 -> 2.6.12 )
It seems that 2.6.12 is checking TCP  sequence number for conntracking
... but I don't use patch-o-matic.

This configuration works well with 2 firewall with  2.4.26 kernel

Any ideas ?

Regards,

---
Pierre Westeel

