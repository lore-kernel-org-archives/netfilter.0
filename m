From: Hildegard Meier <daku8938@gmx.de>
Subject: Aw: connlimit allows more established conns than the limit set
Date: Tue, 24 Nov 2020 17:12:01 +0100
Message-ID: <trinity-250fe6c2-bc11-43ba-afbe-44555997ee2d-1606234321863@3c-app-gmx-bap76>
References: <trinity-165ef9af-b5d5-42c5-b8de-2d158b86db65-1605190018175@3c-app-gmx-bs44>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1606234322;
        bh=L2W9fS5nRPC3HErcVkfTi39vFW6chf1izYaBrSQ4HS0=;
        h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
        b=TYze7tWEfCEl1I9YbqypysU8wQNMqjr33QQsvB/bIKcge/kS+4+2TRGRA0ZOcNLNf
         i/fHGiJHXjazGPtt6Pv9MdjbYe/C1Rge5X2yHCrAFRahttiwU7RRIf+TAhppxOX9FM
         gV4heoCQqXkmjRyTernF5H+doHRQ7/FjNr2mCwiM=
In-Reply-To: <trinity-165ef9af-b5d5-42c5-b8de-2d158b86db65-1605190018175@3c-app-gmx-bs44>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Environment:
Ubuntu 18.04.1 LTS
Kernel 4.15.0-123-generic #126-Ubuntu x86_64
Packages:
conntrack                        1:1.4.4+snapshot20161117-6ubuntu2
libnetfilter-conntrack3:amd64    1.0.6-2

lsmod | grep conntr
nf_conntrack_ipv4      16384  1
nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
nf_conntrack          131072  2 nf_conntrack_ipv4,xt_connlimit
libcrc32c              16384  1 nf_conntrack


Hello,

looks like it is an Ubuntu 12 bug.

The very same iptables-rule, that does not work correctly on Ubuntu 12, wo=
rks as expected with Ubuntu 18.

Best regards


> Gesendet: Donnerstag, 12. November 2020 um 15:06 Uhr
> Von: "Hildegard Meier" <daku8938@gmx.de>
> An: netfilter@vger.kernel.org
> Betreff: connlimit allows more established conns than the limit set
>
> Environment:
>
> Ubuntu 12.04.5 LTS
> Kernel 3.13.0-117-generic #164~precise1-Ubuntu SMP Mon Apr 10 16:16:25 U=
TC 2017 x86_64
> Package conntrack 1:1.0.0-2ubuntu1
>
> lsmod | grep conntr
> xt_conntrack           12760  0
> nf_conntrack_netlink    36326  0
> nfnetlink              14650  1 nf_conntrack_netlink
> nf_conntrack_ipv4      15063  2
> nf_defrag_ipv4         12758  1 nf_conntrack_ipv4
> nf_conntrack           97807  7 xt_conntrack,nf_conntrack_netlink,xt_con=
nlimit,iptable_nat,nf_conntrack_ipv4,nf_nat_ipv4,nf_nat
> x_tables               34892  8 xt_conntrack,xt_LOG,xt_connlimit,ipt_REJ=
ECT,xt_nat,xt_tcpudp,iptable_filter,ip_tables
>
>
>
> Hello,
>
> I have an sftp server listening on port 2222 (IP redacted to 1.2.3.4) fo=
r which I want to limit the TCP connections from source IP address 195.225=
.2.2 (IP slightly changed for privacy reasons) to a maximum of 5.
>
> So I setup the following iptables rules (these are all rules in table "f=
ilter"):
>
> *filter
> :INPUT ACCEPT
> :FORWARD ACCEPT
> :OUTPUT ACCEPT
> :LOGDROP
> -A INPUT -s 195.225.2.2/32 -p tcp -m tcp --dport 2222 --tcp-flags FIN,SY=
N,RST,ACK SYN -j LOG
> -A INPUT -s 195.225.2.2/32 -p tcp -m tcp --dport 2222 --tcp-flags FIN,SY=
N,RST,ACK SYN -m connlimit --connlimit-above 5 --connlimit-mask 32 --connl=
imit-saddr -j LOGDROP
> -A LOGDROP -j LOG --log-prefix "INPUT:DROP:"
> -A LOGDROP -j REJECT --reject-with icmp-port-unreachable
>
> But after having running this for 1h, there are still 41 established tcp=
 connections, instead of the allowed 5:
>
> conntrack -L --orig-src 195.225.2.2
>
> shows roughly 40 (fourty) establsihed TCP connections from 195.225.2.2 t=
o my sftp server:
>
> tcp      6 431994 ESTABLISHED src=3D195.225.2.2 dst=3D1.2.3.4 sport=3D49=
218 dport=3D2222 src=3D1.2.3.4 dst=3D195.225.2.2 sport=3D2222 dport=3D4921=
8 [ASSURED] mark=3D0 use=3D1
> [...]
> tcp      6 431978 ESTABLISHED src=3D195.225.2.2 dst=3D1.2.3.4 sport=3D49=
668 dport=3D2222 src=3D1.2.3.4 dst=3D195.225.2.2 sport=3D2222 dport=3D4966=
8 [ASSURED] mark=3D0 use=3D1
> conntrack v1.0.0 (conntrack-tools): 41 flow entries have been shown.
>
> I can confirm this with netstat. The tcp sessions are also closed after =
some minutes and established new, there are no "old" sessions sitting ther=
e.
>
> Every SYN packet from 195.225.2.2 I see in the log (so the packets do no=
t go somewhere else but through this rule), but only roughly every fourth =
SYN packet is being rejected. The non-rejected packets lead to a new SFTP =
connection, I see the sftp session opening in the sftp server log right af=
terwards.
>
> So, the connlimit rule does not work as I expect. I would expect that co=
nntrack -L --orig-src 195.225.2.2 does show at maximum 5 flow entries in s=
tate established, and until there are 5 established connections, _every_ n=
ew SYN packet gets rejected.
>
> I know that Ubuntu 12 is rather old software, but it is use now and will=
 be used for some time more before a new server gets to work.
>
> Did I miss something here?
>
> Thanks very much
>
