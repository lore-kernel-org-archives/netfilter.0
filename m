From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: Filtering content inside packets , specifically RELATED data in the
 various ICMP TYPE 3 packets
Date: Fri, 13 Jan 2017 10:52:56 +0000
Message-ID: <d60d0ad0fe82496a86f052993fe2cb9b@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all ,

I have detected in my iptables that someone(s) are sending spoofed DNS requ=
est to various targets ( I assume DNS servers ),
from this I have also counted that this accounts for approximately 25% of a=
ll log entries so it would helpful to just DROP
these prior to the log rule for OUT-OF-STATE / INVALID packets sent to my F=
IREWALL .

FireWall:~/FireWall # fwlog | grep ^Jan | grep INVALID | grep PROTO=3DICMP =
| grep SPT=3D24116 | wc
   1270   37026  344056
FireWall:~/FireWall # fwlog | grep ^Jan | grep INVALID | grep PROTO=3DICMP =
| wc
   1331   38903  361959
FireWall:~/FireWall # fwlog | grep ^Jan | grep INVALID | wc
   1882   49010  454195
FireWall:~/FireWall # fwlog | grep ^Jan | wc
   5248  114384 1081222

Based on the log entries I have tracked down some very specific details tha=
t "identifies" the packets in the ICMP RELATED data payload :
  SRC=3D always my IP      ( obviously )
PROTO=3D always UDP        ( normal for DNS traffic )
  DPT=3D always 53         ( normal for DNS traffic )
  SPT=3D always port 24116 ( The trigger that makes this filter viable )


Jan 13 11:03:08 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D177.10.109.210 DST=
=3DAa.Bb.Cc.Dd LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D242 ID=3D0 PROTO=3DICM=
P TYPE=3D11 CODE=3D0=20
                [SRC=3DAa.Bb.Cc.Dd DST=3D177.10.97.81 LEN=3D69 TOS=3D0x00 P=
REC=3D0x00 TTL=3D1 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=3D49 ]

Jan 11 07:50:05 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D177.10.109.209 DST=
=3DAa.Bb.Cc.Dd LEN=3D101 TOS=3D0x00 PREC=3D0x00 TTL=3D51 ID=3D7445 PROTO=3D=
ICMP TYPE=3D3 CODE=3D0
                [SRC=3DAa.Bb.Cc.Dd DST=3D177.10.100.1 LEN=3D73 TOS=3D0x00 P=
REC=3D0x00 TTL=3D239 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=3D5=
3 ]

Jan 13 10:40:11 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D189.5.192.3 DST=3DAa=
.Bb.Cc.Dd LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D16683 PROTO=3DICMP =
TYPE=3D3 CODE=3D1
                [SRC=3DAa.Bb.Cc.Dd DST=3D189.123.123.253 LEN=3D82 TOS=3D0x0=
0 PREC=3D0x00 TTL=3D243 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=
=3D62 ]

Jan 13 10:41:27 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D115.224.146.173 DST=
=3DAa.Bb.Cc.Dd LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D52 ID=3D58805 DF PROTO=
=3DICMP TYPE=3D3 CODE=3D3
                [SRC=3DAa.Bb.Cc.Dd DST=3D115.224.146.173 LEN=3D71 TOS=3D0x0=
0 PREC=3D0x00 TTL=3D229 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=
=3D51 ]

Jan 08 14:00:38 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D93.182.24.46 DST=3DA=
a.Bb.Cc.Dd LEN=3D93 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D49810 PROTO=3DICMP=
 TYPE=3D3 CODE=3D9
                [SRC=3DAa.Bb.Cc.Dd DST=3D93.182.24.46 LEN=3D65 TOS=3D0x00 P=
REC=3D0x00 TTL=3D240 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=3D4=
5 ]

Jan 13 10:06:02 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D210.135.86.225 DST=
=3DAa.Bb.Cc.Dd LEN=3D106 TOS=3D0x00 PREC=3D0x00 TTL=3D53 ID=3D16769 PROTO=
=3DICMP TYPE=3D3 CODE=3D10
                [SRC=3DAa.Bb.Cc.Dd DST=3D210.135.86.225 LEN=3D78 TOS=3D0x00=
 PREC=3D0x00 TTL=3D241 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=
=3D58 ]

Jan 13 07:02:14 FW-GET-INVALID IN=3Dvlan0 OUT=3D SRC=3D93.181.16.83 DST=3DA=
a.Bb.Cc.Dd LEN=3D56 TOS=3D0x00 PREC=3D0x00 TTL=3D54 ID=3D36278 PROTO=3DICMP=
 TYPE=3D3 CODE=3D13
                [SRC=3DAa.Bb.Cc.Dd DST=3D93.181.16.83 LEN=3D71 TOS=3D0x00 P=
REC=3D0x00 TTL=3D245 ID=3D36278 DF PROTO=3DUDP SPT=3D24116 DPT=3D53 LEN=3D5=
1 ]

Since this system runs named ( a linux based DNS resolver ) , filtering ICM=
P for all DNS could impact valid packets also ...
... but my conclusion is that making any filter after the RELATED rules and=
 also limiting it to the very specific combo
of only those with source port SPT=3D24116 ( and UDP 53 ) should virtually =
make it impossible to go wrong ( at least in theory ).

FireWall:~/FireWall # iptables -m string -help
iptables v1.4.21
[cut]
string match options:
--from                       Offset to start searching from
--to                         Offset to stop searching
--algo                       Algorithm
--icase                      Ignore case (default: 0)
[!] --string string          Match a string in a packet
[!] --hex-string string      Match a hex string in a packet


Now the problem is to create a rule that would perform this task , but look=
ing at the module for string match
and searching google has left me a bit unsure if I am going in the right di=
rection ...
... if anyone has any experience with similar filtering on the DATA part of=
 packets it would be appreciated .

Since the IPTABLES normally can find this data in its RELATED function in t=
he STATE-MODULE ,
I am hoping that there might be a more relevant way to look at this data si=
nce it obviously can be
analyzed internally in that module ( maybe there is also a way for the rule=
set to use that same dataset ).




Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS

