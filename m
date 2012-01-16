From: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Subject: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
Date: Mon, 16 Jan 2012 12:22:02 +0100
Message-ID: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


I could not find=A0a netfilter_queue RPM for Centos 6.2 so went to comp=
ile it (after=A0successfully installing=A0nfnetflink RPMs).=20
=A0
The error I got was:
=A0
make[1]: Entering directory `/home/dev/software/libnetfilter_queue-1.0.=
1/src'
=A0 CC=A0=A0=A0=A0 libnetfilter_queue.lo
In file included from ../include/libnetfilter_queue/libnetfilter_queue.=
h:19,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 from libnetfilter_queu=
e.c:34:
=2E./include/libnetfilter_queue/linux_nfnetlink_queue.h:8:42: error: li=
bnfnetlink/linux_nfnetlink.h: No such file or directory


I solved it by modifying the following header:
=A0
libnetfilter_queue-1.0.1/include/libnetfilter_queue/linux_nfnetlink_que=
ue.h
=A0
as follows:=20
=A0
//#include <libnfnetlink/linux_nfnetlink.h>
#include <linux/netfilter/nfnetlink.h>
=A0
Am I missing something?



Andres Velasco
M: +34 670 40 73 69
Skype: newwwave.andres.velasco
 		 	   		  