From: =?UTF-8?B?QmrDtnJuIFNjaG1pZHQ=?= <bj-schmidt@uni-paderborn.de>
Subject: Re: state: INVALID
Date: Sun, 21 Nov 2004 23:46:45 +0100
Message-ID: <41A11AD5.3080401@uni-paderborn.de>
References: <419E75B1.3030406@uni-paderborn.de>	
	<1100990773.3501.9.camel@hubcap.ljm.dom>	
	<419FD0BD.6000906@uni-paderborn.de>
	<1101061543.3501.18.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101061543.3501.18.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Jason Opperisano wrote:
> On Sat, 2004-11-20 at 18:18, Bj=C3=B6rn Schmidt wrote:
>>Jason Opperisano wrote:
>>Here is a(n older) packet that is _falsely_ classified as INVALID (should=
 be
>>ESTABLISHED). I changed the IP-adress and hostname in the meantime:
>>
>>Oct 29 13:51:05 skyron ILLEGAL_PACKET IN=3D OUT=3Deth0 MAC=3D SRC=3D192.1=
68.1.1=20
>>DST=3D192.168.1.2 LEN=3D60 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=
=3DTCP SPT=3D22=20
>>DPT=3D33085 SEQ=3D1048000056 ACK=3D1050690244 WINDOW=3D5792 ACK SYN URGP=
=3D0
>=20
> well--this is a SYN-ACK packet...without seeing the log rule that
> creates this "ILLEGAL_PACKET" entry, i can't say.

I changed the log rule(s) that creates "ILLEGAL_PACKET", now it creates
"OUTPUT_INVALID", "INPUT_INVALID" and "FORWARD_INVALID". Here is one line
from the log with the new rules (client):

Nov 21 23:21:43 gigabyte OUTPUT_INVALID IN=3D OUT=3Deth0 MAC=3D SRC=3D192.1=
68.1.2=20
DST=3D192.168.1.1 LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D23692 DF PROT=
O=3DTCP SPT=3D32807=20
DPT=3D22 SEQ=3D798630945 ACK=3D685050669 WINDOW=3D1460 ACK URGP=3D0

The state of this packet should be ESTABLISHED, but it _is_ INVALID.
Perhaps there is a bug in ipsec or netfilter...

 > my guess is that your rules do not match your intentions.

Impossible. I have this problem even with this _minimalistic_ ruleset:

gigabyte:~# cat firewall.tmp
#!/bin/sh

iptables  -P INPUT DROP
iptables  -P OUTPUT DROP
iptables  -P FORWARD DROP

iptables  -A INPUT   -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
iptables  -A OUTPUT  -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT
iptables  -A FORWARD -m state --state ESTABLISHED,RELATED,NEW -j ACCEPT

iptables -A INPUT -m state --state INVALID -j ULOG --ulog-prefix INPUT_INVA=
LID
iptables -A OUTPUT -m state --state INVALID -j ULOG --ulog-prefix OUTPUT_IN=
VALID
iptables -A FORWARD -m state --state INVALID -j ULOG --ulog-prefix FORWARD_=
INVALID

>>Besides I forgot to mention that i only get "false INVALID" states with
>>activated IPsec (esp in transport mode, kernel 2.6). With IPsec _AND_ ipt=
ables
>>it es NOT possible to establish a new tcp connection due to these "INVALID
>>state packets".
>=20
> uh huh...  post your rules:
>=20
> iptables -t mangle -vnxL

gigabyte:~# iptables -t mangle -vnxL
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination


> iptables -t nat -vnxL

gigabyte:~# iptables -t nat -vnxL
Chain PREROUTING (policy ACCEPT 7 packets, 1515 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

Chain POSTROUTING (policy ACCEPT 26 packets, 2637 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

Chain OUTPUT (policy ACCEPT 26 packets, 2565 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination

> iptables -vnxL

gigabyte:~# iptables -vnxL
Chain INPUT (policy DROP 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination
     2460  2616788 ACCEPT     all  --  *      *       0.0.0.0/0=20
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
        0        0 ULOG       all  --  *      *       0.0.0.0/0=20
0.0.0.0/0           state INVALID ULOG copy_range 0 nlgroup 1 prefix=20
`INPUT_INVALID' queue_threshold 1

Chain FORWARD (policy DROP 0 packets, 0 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination
        0        0 ACCEPT     all  --  *      *       0.0.0.0/0=20
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
        0        0 ULOG       all  --  *      *       0.0.0.0/0=20
0.0.0.0/0           state INVALID ULOG copy_range 0 nlgroup 1 prefix=20
`FORWARD_INVALID' queue_threshold 1

Chain OUTPUT (policy DROP 38 packets, 2036 bytes)
     pkts      bytes target     prot opt in     out     source=20
destination
     1938   959688 ACCEPT     all  --  *      *       0.0.0.0/0=20
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
       38     2036 ULOG       all  --  *      *       0.0.0.0/0=20
0.0.0.0/0           state INVALID ULOG copy_range 0 nlgroup 1 prefix=20
`OUTPUT_INVALID' queue_threshold 1


Hmmm, it is not possible to establish a ssh connection, but it IS
possible to establish a telnet connection (but it needs ~148 seconds
until the "skyron login:" appears).

--=20
Greetings
Bjoern Schmidt


