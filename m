From: netfilter-maillist <vlad@fakt.tazovsky.ru>
Subject: Re[2]: time modules
Date: Mon, 24 Mar 2003 11:08:09 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <208058078.20030324110809@fakt.tazovsky.ru>
References: <15911867640.20030318121718@mail.ru>
 <200303231921.04004.fabrice@netfilter.org>
Reply-To: netfilter-maillist <vlad@fakt.tazovsky.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303231921.04004.fabrice@netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1251"
To: netfilter <netfilter@lists.netfilter.org>

Hello, Fabrice.

You wrote 23 =EC=E0=F0=F2=E0 2003 =E3., 16:21:04:


FM> Hi Vladimir,

FM> On Tuesday 18 March 2003 15:17, vlad wrote:
>> Hello netfilter,
>> iptables -I INPUT 1 -p tcp -s 192.168.1.2/32 -m time --timestart \
>> 11:00 --timestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
>> -d 192.168.1.1/32 --j DROP
>> Defaul policy in INPUT chain - DROP
>> But... packets allows to 192.168.1.240 (server) in this
>> time --> 11:00-17:00.
>> Why?

FM> With a quick guess, two reasons come to mind:
FM> 1- you have an ACCEPT rule that shadows the -m time -j DROP rule,
FM>    therefore nullifying its effect.
FM> 2- the packets that you talk about still being allowed might be from
FM>    a forwarding connection ? In which case you have to filter in
FM>    forward chain.

FM> To see if 1 is your problem, simply put the rule -m time -j DROP at
FM> the _begining_ of the ruleset, this way you'll be sure it won't be sh=
adowed
FM> by other rules.

FM> To see if 2 is your problem, simply put the rule -m time -j DROP in
FM> the FORWARD chain instead.

/sbin/iptables -A FORWARD -p tcp -m time --timestart 00:00 --timestop 23:=
59 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
-d 192.168.1.240 --dport 3128 -j DROP

/sbin/iptables -A INPUT 192.168.1.2 -p tcp -m time --timestart 10:00 --ti=
mestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
 -d 192.168.1.240 --dport 3128 -j LOG --log-prefix "####### VLAD SQUID AC=
CEPT "
/sbin/iptables -A INPUT 192.168.1.2 -p tcp -m time --timestart 10:00 --ti=
mestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
 -d 192.168.1.240 --dport 3128 -j ACCEPT

/sbin/iptables -A INPUT -p tcp -m time --timestart 00:00 --timestop 23:59=
 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
 -d 192.168.1.240 --dport 3128 -j LOG --log-prefix "####### SQUID DROP "
/sbin/iptables -A INPUT -p tcp -m time --timestart 00:00 --timestop 23:59=
 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
-d 192.168.1.240 --dport 3128 -j DROP

# date
Mon Mar 24 10:58:10 YEKT 2003
# clock
Mon Mar 24 10:58:32 2003  -0.459821 seconds

# iptables -nL INPUT -v
Chain INPUT (policy DROP 9 packets, 1979 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation
    0     0 ACCEPT     all  --  *      *       127.0.0.1            0.0.0=
.0/0
    0     0 LOG        tcp  --  *      *       192.168.1.2          192.1=
68.1.240       TIME from 10:0 to 17:0 on Sun,Mon,Tue,Wed,Thu,Fri,Sat tcp =
dpt:31288 LOG flags 0 level 4 prefix `####### VLAD SQUID ACCEPT '
    0     0 ACCEPT     tcp  --  *      *       192.168.1.2          192.1=
68.1.240       TIME from 10:0 to 17:0 on Sun,Mon,Tue,Wed,Thu,Fri,Sat tcp =
dpt:31288
    0     0 LOG        tcp  --  *      *       0.0.0.0/0            192.1=
68.1.240       TIME from 0:0 to 23:59 on Sun,Mon,Tue,Wed,Thu,Fri,Sat tcp =
dpt:31288 LOG flags 0 level 4 prefix `####### SQUID DROP '
    0     0 DROP       tcp  --  *      *       0.0.0.0/0            192.1=
68.1.240       TIME from 0:0 to 23:59 on Sun,Mon,Tue,Wed,Thu,Fri,Sat tcp =
dpt:31288


# iptables -nL FORWARD -v
Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               desti=
nation
    0     0 DROP       tcp  --  *      *       0.0.0.0/0            192.1=
68.1.240       TIME from 0:0 to 23:59 on Sun,Mon,Tue,Wed,Thu,Fri,Sat tcp =
dpt:31288


In an effort join with server in /var/log/messages writes:
ipt_time unloaded
Mar 24 11:00:03 fakt kernel: ip_tables: (C) 2000-2002 Netfilter core team
Mar 24 11:00:03 fakt kernel: ip_conntrack version 2.1 (4607 buckets, 3685=
6 max) - 292 bytes per conntrack
Mar 24 11:00:05 fakt kernel: ip_tables: (C) 2000-2002 Netfilter core team
Mar 24 11:00:05 fakt kernel: ip_conntrack version 2.1 (4607 buckets, 3685=
6 max) - 292 bytes per conntrack
Mar 24 11:00:06 fakt kernel: ipt_time loading
Mar 24 11:04:18 fakt kernel: ####### SQUID DROP IN=3Deth0 OUT=3D MAC=3D00=
:01:02:ac:f0:cb:00:00:62:a1:3c:9b:08:00 SRC=3D192.168.1.2 DST=3D192.168.1=
.240 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D200 ID=3D28601 DF PROTO=3DTCP =
SPT=3D1196 DPT=3D3128 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
Mar 24 11:04:21 fakt kernel: ####### SQUID DROP IN=3Deth0 OUT=3D MAC=3D00=
:01:02:ac:f0:cb:00:00:62:a1:3c:9b:08:00 SRC=3D192.168.1.2 DST=3D192.168.1=
.240 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D200 ID=3D28604 DF PROTO=3DTCP =
SPT=3D1197 DPT=3D3128 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
Mar 24 11:04:21 fakt kernel: ####### SQUID DROP IN=3Deth0 OUT=3D MAC=3D00=
:01:02:ac:f0:cb:00:00:62:a1:3c:9b:08:00 SRC=3D192.168.1.2 DST=3D192.168.1=
.240 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D200 ID=3D28606 DF PROTO=3DTCP =
SPT=3D1196 DPT=3D3128 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0

Why does not pass rule =B91 in INPUT-chain ???

   =20
--=20
With best wishes,
 netfilter-maillist                          mailto:vlad@fakt.tazovsky.ru


