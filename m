From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
        <Andre.Paulsberg-Csibi@evry.com>
Subject: RE: Getting rid of false ULOG events once and for all
Date: Wed, 26 Apr 2017 10:58:18 +0000
Message-ID: <a653bff0c5c64040871ff713eda948cf@CCDEX021.corp.corpcommon.com>
References: <1304d06c2895e5d7a3747cf2baafb572@tango.lu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=evry.onmicrosoft.com;
 s=selector1-evry-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ytgns/Tlu2wb2Eb8wSFctxkaMkZq5KEuqGgHlcft10M=;
 b=aGQ7HnPplq4xJBzKKLwvoG9kLsHzDSGQHBqO62WMLDYdaHUMrZVKSVkdVSWxj9r6eeBBstNt3KSE0iCbTHv6Wu6YNCNAuvWgqgkhj1hB7CWj8Nh9pzl1093b2X61jpTzLYxioUUgAJy6Xy2BaAaZGoFhg81KYwE9eLT2oSUBq4c=
In-Reply-To: <1304d06c2895e5d7a3747cf2baafb572@tango.lu>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Luescher Claude <stargate@tango.lu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi ,

To analyze / evaluate you basically have 3 options , there are more but wit=
hout more details it is hard to give 100% viable options .

1. Increase log level outside or connected to iptables ( on same machine ob=
viously )
   * turn on logging of invalid packets with "echo 256 > /proc/sys/net/netf=
ilter/nf_conntrack_log_invalid"
   * session info/logs with "conntrack -E > conntrack.log" .
   * complete data/logs with "tcpdump -s0 -nnvvi eth0 -w test.%F-%T.pcap -G=
 10" .
Then review data/log file(s) generated the next time the issue occurs , and=
 look for that specific session with same identifiers .

2. Increase log level at the client or the server side to be able to track =
TCP level sessions
   ( cannot give specifics as I known not what these systems are , but coul=
d be the same as options 1 , other , more or less . )

3. Increase log level at the application level , on client and/or server ma=
ybe this can tell when that session was started
   and if the session has been IDLE for some time or was broken on one side=
 ( as in some signal was sent asking to end session and such )

In many cases you might have to combinate these 3 options to actually pinpo=
int an accurate root cause ,
but from a technical standpoint option 3 is the "favored" options if this i=
s causing issues to start with
as the lower numbered options are the lower level ( deeper ) analysis which=
 typically just verifies the issue and does not resolv it
or suggest any way how to resolv it ( if this is actually an issue )


SIDE NOTE:

I suggest using this in you firewall rules as this is "less obsolete" then =
how you did ,
and I also feels it more correctly covers the options better to be really S=
TATEFUL ( not just for TCP )

-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -m conntrack --ctstate NEW -s 10.0.0.2 -d 10.0.0.1 -p tcp -m tcp -=
-dport 3306 -j ACCEPT

-A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT


Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988




-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.o=
rg] On Behalf Of Luescher Claude
Sent: 26. april 2017 11:07
To: netfilter@vger.kernel.org
Subject: Getting rid of false ULOG events once and for all

Hello,

I'm using a similar ruleset since many years on many servers:

$FWCMD -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
$FWCMD -A INPUT -s 10.0.0.2 -d 10.0.0.1 -p tcp -m tcp --dport 3306=20
--tcp-flags SYN,RST,ACK SYN -m state --state NEW -j ACCEPT
$FWCMD -A INPUT -j $UL --ulog-prefix "LAN IN: "
$FWCMD -A INPUT -j DROP

These are basic stateful firewall rules to allow mysql connections from=20
a sepcific server. However once in a while I always get log events from=20
all the allowed targets such as:

Apr 24 11:51:56 mysql LAN IN:  IN=3Deth0 OUT=3D  SRC=3D10.0.0.2 DST=3D10.0.=
0.1=20
LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D22317 PROTO=3DTCP SPT=3D28445 D=
PT=3D3306=20
SEQ=3D1775770220 ACK=3D2310754247 WINDOW=3D2048 ACK URGP=3D0
Apr 24 11:51:56 mysql LAN IN:  IN=3Deth0 OUT=3D SRC=3D10.0.0.2 DST=3D10.0.0=
.1=20
LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D17183 PROTO=3DTCP SPT=3D18431 D=
PT=3D3306=20
SEQ=3D1985459406 ACK=3D286608940 WINDOW=3D2048 ACK URGP=3D0

What's happening here exactly? Are the packets out of sequence,=20
connection broke up, packets duplicating etc. and how can I remove these=20
false positives from my log files so only the bad traffic which was=20
blocked is showing up?

Thank you.
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  https://emea01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fvger.kernel.org%2Fmajordomo-info.html&data=3D02%7C01%7C%7C=
3473b552582e42b7c8cf08d48c86e755%7C40cc2915e2834a2794716bdd7ca4c6e1%7C1%7C0=
%7C636287958413968580&sdata=3D9%2FRxnx%2F2XE518OnjyOJm2HvGct3Ctpzh4S6ICkEYn=
4w%3D&reserved=3D0
