From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables and the owner module
Date: Wed, 28 Mar 2012 03:32:13 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203280325160.14701@frira.zrqbmnf.qr>
References: <20120327194521.00a33d86@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120327194521.00a33d86@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firstname Lastname <forbiddentransition@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2012-03-28 01:45, Firstname Lastname wrote:
>
>-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport
>--dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner
>--uid-owner 1000 -j ACCEPT
>
>The following log output is generated prior to being dropped:
>
>IN= OUT=eth0 SRC=192.168.2.2 DST=173.194.73.103 LEN=60 TOS=0x00
>PREC=0x00 TTL=40 ID=7363 DF PROTO=TCP SPT=58642 DPT=80 WINDOW=5840
>RES=0x00 SYN URGP=0 OPT (020405B40402080A1D88900B0000000001030307)
>UID=1000 GID=1000
>
>As indicated in the log output, the packet socket's file structure
>is owned by userid 1000 and thus should match the preceding
>configuration line with the ACCEPT target.

Not if a preceding match in the same rule returned false. Which is
what your log line indicates. Seeing it as that, the actual
ct state is not NEW nor EST.
