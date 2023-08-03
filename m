From: toml <toml@thlu.de>
Subject: Re: Nftables + ALG + Linux 6.1.0-10-amd64
 =?UTF-8?Q?=E2=80=A6=3F=2E=2E=2E?= is it a kown Problem?
Date: Thu, 03 Aug 2023 14:35:10 +0200
Message-ID: <76311f64eb31224c7e750279a62fa8bd8257dba1.camel@mail>
References: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
         <20230731133608.GA21425@breakpoint.cc>
         <b47e1dc20a97eb4e6972d5cbfd2cf9dcaaab7e06.camel@mail>
         <20230801201148.GB32288@breakpoint.cc>
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230801201148.GB32288@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/markdown; charset="us-ascii"
To: netfilter@vger.kernel.org

Am Dienstag, dem 01.08.2023 um 22:11 +0200 schrieb Florian Westphal:

> Sounds about right, helper assignment looks correct to me.

Unfortunately, the example from my previous post does not work, when I tigh=
ten the filter to prevent unwanted traffic. For outgoing FTP I always get t=
he message:
"Could not open data connection to port nnnnn: Connection refused".

I then just created a log entry before the general-drop (like policy) takes=
 effect. And surprise, S-Port 20 is the Problem. This Package going dropped=
.
Aug 03 13:54:12 ftps kernel: Debugging: IN=3Denp1s0 OUT=3D MAC=3D0a:cc:00:2=
2:44:0a:e0:28:zv:11:5f:ff:gg:00 SRC=3D222.178.19.133 DST=3D10.1.1.4 LEN=3D6=
0 TOS=3D0x00 PREC=3D0x00 TTL
1=3D55 ID=3D30979 DF PROTO=3DTCP SPT=3D20 DPT=3D38909 WINDOW=3D64240 RES=3D=
0x00 SYN URGP=3D0=20

The Package is marked with "SYN", but seems it is not related to the connec=
tion via Port 21.  But, also open for SYN in general, also suitable to esta=
blish a another connection as friendly. This was not necessary until now wi=
th the old ALG-model in Bullseye. Could it be, that I myself and my expecta=
tion am the source of the Problem here?=20
The following sample works. But I don't know, is it that, what I want... a =
closed filter with explicit permissions?=20

table ip filter {
        ct helper ftp-helper {
                type "ftp" protocol tcp
                l3proto ip
        }

        chain prerouting {
                type filter hook prerouting priority -100; policy accept;
                ct state 0x8 tcp dport 21 ct helper set "ftp-helper"
        }

        chain input {
                type filter hook input priority 0; policy accept;
                iifname "lo" accept
                ct state 0x2,0x4 accept
                ip protocol 1 accept
                meta pkttype { 1, 2 } accept
                tcp sport 20 accept
                tcp dport 21 accept
                ct helper "ftp" accept
                log prefix "Debugging: "
                ip protocol 6 counter packets 0 bytes 0 reject with tcp res=
et
                counter packets 0 bytes 0 reject
        }

        chain output {
                type filter hook output priority 0; policy accept;
                oifname "lo" accept
                ct state 0x2,0x4 accept
                meta pkttype { 0, 1, 2 } accept
                ip protocol 1 accept
                ct state 0x8 tcp dport 21 ct helper set "ftp-helper"
                tcp dport 21 accept
                ct helper "ftp" accept
                counter packets 0 bytes 0 reject with icmp 13
        }
}


Best Regards
Thomas
