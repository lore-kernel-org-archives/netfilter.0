From: "linuxmc\@libero\.it" <linuxmc@libero.it>
Subject: Re: Help me... please
Date: Sat,  2 Aug 2008 10:57:25 +0200
Message-ID: <K4YU7P$3906019F62CB0933449DE713598EF00E@libero.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="_=__=_XaM3_.1217667445.2A.321891.42.2034.52.42.007.1734963857"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "michele.petrazzo" <michele.petrazzo@unipex.it>
Cc: x86ever <x86ever@gmail.com>, netfilter <netfilter@vger.kernel.org>


--_=__=_XaM3_.1217667445.2A.321891.42.2034.52.42.007.1734963857
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

I have tried to remove de "-m state --state" but nothing change.
I have attached the section of the firewall log file with the defect. Loo=
k to the first and to the last line.....


thank. Marco


---------- Initial Header -----------

From      : netfilter-owner@vger.kernel.org
To          : "Anatoly Muliarski" x86ever@gmail.com
Cc          : "netfilter" netfilter@vger.kernel.org
Date      : Sat, 02 Aug 2008 10:10:45 +0200
Subject : Re: Help me... please







> Anatoly Muliarski wrote:
> > Hi,
> > 
> > You should remove -m state --state NEW statements because they track =

> > only START of connections.
> > 
> 
> 
> Or you can accept the established and related _before_ to the other rul=
es.
> 
> $IPTABLES -I INPUT 1 [FORWARD] -m state --state RELATED,ESTABLISHED -j =

> ACCEPT
> 
> However, can you send us the log that drop the traffic on the rule_39 ?=

> 
> Michele
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in=

> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

--_=__=_XaM3_.1217667445.2A.321891.42.2034.52.42.007.1734963857
Content-Type: text/plain;
	name="=?iso-8859-1?Q?firewall_log_file?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?iso-8859-1?Q?firewall_log_file?="

Aug  2 10:54:01 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.1.54 DST=3D209.62.179.57 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D=
126 ID=3D21164 DF PROTO=3DTCP SPT=3D1617 DPT=3D80 WINDOW=3D65535 RES=3D0x=
00 SYN URGP=3D0 
Aug  2 10:54:01 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.25 DST=3D151.99.125.3 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D54181 PROTO=3DUDP SPT=3D1076 DPT=3D53 LEN=3D52 
Aug  2 10:54:03 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.25 DST=3D151.99.125.2 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D54182 PROTO=3DUDP SPT=3D1076 DPT=3D53 LEN=3D52 
Aug  2 10:54:03 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.25 DST=3D151.99.125.3 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D54183 PROTO=3DUDP SPT=3D1076 DPT=3D53 LEN=3D52 
Aug  2 10:54:04 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.30 DST=3D151.99.125.2 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D6672 PROTO=3DUDP SPT=3D1026 DPT=3D53 LEN=3D42 
Aug  2 10:54:04 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.1.54 DST=3D209.62.179.57 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D=
126 ID=3D21230 DF PROTO=3DTCP SPT=3D1617 DPT=3D80 WINDOW=3D65535 RES=3D0x=
00 SYN URGP=3D0 
Aug  2 10:54:04 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.100 DST=3D151.99.125.2 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D=
60 ID=3D65453 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D456 SEQ=3D0 
Aug  2 10:54:05 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.30 DST=3D151.99.125.3 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D6673 PROTO=3DUDP SPT=3D1026 DPT=3D53 LEN=3D42 
Aug  2 10:54:05 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.100 DST=3D151.99.125.2 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D=
60 ID=3D65458 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D456 SEQ=3D1 
Aug  2 10:54:06 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.30 DST=3D151.99.125.2 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D6687 PROTO=3DUDP SPT=3D1026 DPT=3D53 LEN=3D42 
Aug  2 10:54:06 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.100 DST=3D151.99.125.3 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D=
60 ID=3D65463 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D456 SEQ=3D0 
Aug  2 10:54:07 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.100 DST=3D151.99.125.3 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=3D=
60 ID=3D65468 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D456 SEQ=3D1 
Aug  2 10:54:07 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.25 DST=3D151.99.125.2 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D54184 PROTO=3DUDP SPT=3D1076 DPT=3D53 LEN=3D52 
Aug  2 10:54:07 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.25 DST=3D151.99.125.3 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D54185 PROTO=3DUDP SPT=3D1076 DPT=3D53 LEN=3D52 
Aug  2 10:54:08 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.30 DST=3D151.99.125.2 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D6688 PROTO=3DUDP SPT=3D1026 DPT=3D53 LEN=3D42 
Aug  2 10:54:08 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.30 DST=3D151.99.125.3 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D6689 PROTO=3DUDP SPT=3D1026 DPT=3D53 LEN=3D42 
Aug  2 10:54:09 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.34 DST=3D151.99.125.3 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D9984 PROTO=3DUDP SPT=3D4911 DPT=3D53 LEN=3D42 
Aug  2 10:54:10 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3D MAC=3D0=
1:00:5e:00:00:01:00:20:1a:21:a2:21:08:00 SRC=3D192.168.1.65 DST=3D224.0.0=
.1 LEN=3D28 TOS=3D0x00 PREC=3D0x00 TTL=3D1 ID=3D7895 PROTO=3D2 
Aug  2 10:54:10 fwlbsede kernel: RULE 39 -- DENY IN=3Deth1 OUT=3Deth0 SRC=
=3D192.168.2.34 DST=3D151.99.125.3 LEN=3D62 TOS=3D0x00 PREC=3D0x00 TTL=3D=
124 ID=3D9999 PROTO=3DUDP SPT=3D4911 DPT=3D53 LEN=3D42 
Aug  2 10:54:10 fwlbsede kernel: RULE 8 -- ACCEPT IN=3Deth1 OUT=3Deth0 SR=
C=3D192.168.1.54 DST=3D209.62.179.57 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D=
127 ID=3D21338 DF PROTO=3DTCP SPT=3D1617 DPT=3D80 WINDOW=3D65535 RES=3D0x=
00 SYN URGP=3D0 


--_=__=_XaM3_.1217667445.2A.321891.42.2034.52.42.007.1734963857--

