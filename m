From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
	<Andre.Paulsberg-Csibi@evry.com>
Subject: No sign of INVALID packet , LOGS DROP but not reason
Date: Sun, 29 May 2016 10:42:47 +0000
Message-ID: <1464518566817.52562@evry.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi ,

=20
I have come across something that I am starting to think is a bug ,

but before I start upgrading and other works lets see if I missed somet=
hing !


I have log entries like these

May 28 10:47:13 zotac kernel: INVALID-STATE IN=3Dvlan0 OUT=3D MAC=3D# S=
RC=3D189.222.120.167 DST=3D# LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D116 =
ID=3D5745 PROTO=3DTCP SPT=3D21735 DPT=3D56715 WINDOW=3D0 RES=3D0x00 ACK=
 RST URGP=3D0


I have used

conntrack -E -o timestamp

and added logging with

echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_invalid


=A0from what I can see there is no "kernel: nf_ct_tcp: " entries at the=
 moment of the DROP of ACK RST

and there is an entry in conntrack for this session that should allow A=
CK RST to terminate that session .


when I do :

zotac:~ # journalctl | grep nf_ct | grep " ACK RST " | grep -v " ACK RS=
T FIN "
May 26 22:35:31 zotac kernel: nf_ct_tcp: invalid RST IN=3D OUT=3D SRC=3D=
# DST=3D81.233.185.232 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D1=
4841 PROTO=3DTCP SPT=3D7905 DPT=3D56206 SEQ=3D2244837322 ACK=3D83571625=
8 WINDOW=3D0 RES=3D0x00 ACK RST URGP=3D0

I only find ONE result , but when I do :

zotac:~ # journalctl | grep INVALID | grep " ACK RST " | grep -v " ACK =
RST FIN " | grep "May 2[678]" | wc
=A0=A0 1590=A0=A0 38480=A0 412611


I should have atleast 1000 + more nf_ct log entries to match all my INV=
ALID ACK RST log entries .


I have tried to spot some issues with TCPDUMPs , but all packets seems =
like normal ACK RST when I try to get same result "manually" by sending=
 SYN packets "I just used "telnet IP PORT" to a port I found in my log =
=2E..

I see the ACK RST telling me the port is blocked and I can't seem to fi=
nd any issues with the packet !



Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer
=46ault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com

=20
   